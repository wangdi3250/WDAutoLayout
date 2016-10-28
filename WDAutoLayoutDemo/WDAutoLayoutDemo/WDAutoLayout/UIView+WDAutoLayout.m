//
//  UIView+WDAutoLayout.m
//  WDAutoLayout
//
//  Created by 王迪 on 16/3/19.
//  Copyright © 2016年 wangdi. All rights reserved.
//

#import "UIView+WDAutoLayout.h"
#import "WDViewLayout.h"
#import "UITableView+WDAutoLayout.h"
#import <objc/runtime.h>

@implementation UIView (WDAutoLayout)
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL systemSEL[] = {@selector(layoutSubviews)};
        SEL customerSEL[] = {@selector(wd_layoutSubviews)};
        for(int i = 0;i < sizeof(systemSEL) / sizeof(SEL);i++) {
            Method systemMethod = class_getInstanceMethod(self,systemSEL[i]);
            Method custmerMethod = class_getInstanceMethod(self,customerSEL[i]);
            method_exchangeImplementations(systemMethod, custmerMethod);
        }
    });
}

- (void)wd_addSubviews:(NSArray *)subViews
{
    if(!subViews.count) return;
    for(UIView *view in subViews) {
        if(![view isKindOfClass:[UIView class]]) continue;
        [self addSubview:view];
    }
}

- (WDViewLayout *)wd_layout
{
    WDViewLayout *layout = objc_getAssociatedObject(self, _cmd);
    if(!layout) {
        layout = [WDViewLayout layoutWithNeedAutoLayoutView:self];
        objc_setAssociatedObject(self, _cmd, layout, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [[self.superview wd_layoutArray] addObject:layout];
    }
    return layout;
}

- (WDViewLayout *)wd_resetLayout
{
    WDViewLayout *oldLayout = self.wd_layout;
    WDViewLayout *newLayout = [WDViewLayout layoutWithNeedAutoLayoutView:self];
    objc_setAssociatedObject(self, @selector(wd_layout), newLayout, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.frame = CGRectZero;
    NSInteger index = 0;
    if (oldLayout) {
        [self wd_setupBottomViewWithBottomViewArray:nil marginToBottom:0];
        [self wd_setupRightViewWithRightViewArray:nil marginToRight:0];
        if([self isKindOfClass:[UIScrollView class]]) {
            UIScrollView *scrollView = (UIScrollView *)self;
            [scrollView wd_setupContentSizeWidthWithRightViewArray:nil contentSizeWidthmarginToRight:0];
            [scrollView wd_setupContentSizeHeightWithBottomViewArray:nil contentSizeHeightmarginToBottom:0];
        }
        index = [self.superview.wd_layoutArray indexOfObject:oldLayout];
        NSInteger count = self.superview.wd_layoutArray.count;
        if(index < count) {
            [self.superview.wd_layoutArray replaceObjectAtIndex:index withObject:newLayout];
        }
    } else {
        [self.superview.wd_layoutArray addObject:newLayout];
    }
    return newLayout;
    
}

- (NSMutableArray *)wd_layoutArray
{
    NSMutableArray *layoutArray = objc_getAssociatedObject(self, _cmd);
    if(!layoutArray) {
        layoutArray = [NSMutableArray array];
        objc_setAssociatedObject(self, _cmd, layoutArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return layoutArray;
}

- (void)setWd_widthEqualSubviews:(NSArray *)wd_widthEqualSubviews
{
    objc_setAssociatedObject(self, @selector(wd_widthEqualSubviews), wd_widthEqualSubviews, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSArray *)wd_widthEqualSubviews
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setWd_heightEqualSubviews:(NSArray *)wd_heightEqualSubviews
{
    objc_setAssociatedObject(self, @selector(wd_heightEqualSubviews) , wd_heightEqualSubviews, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSArray *)wd_heightEqualSubviews
{
    return objc_getAssociatedObject(self, _cmd);
}

- (UITableView *)wd_tableView
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setWd_tableView:(UITableView *)wd_tableView
{
    objc_setAssociatedObject(self, @selector(wd_tableView), wd_tableView, OBJC_ASSOCIATION_ASSIGN);
}

- (NSIndexPath *)wd_indexPath
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setWd_indexPath:(NSIndexPath *)wd_indexPath
{
    objc_setAssociatedObject(self, @selector(wd_indexPath), wd_indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)wd_updateLayout
{
    [self wd_resetLayoutDidFinished:self.superview.wd_layoutArray];
    [self.superview layoutSubviews];
}

- (void)wd_resetLayoutDidFinished:(NSArray *)layoutArray
{
    if(!layoutArray.count) return;
    for(int i = 0;i < layoutArray.count;i++) {
        WDViewLayout *layout = layoutArray[i];
        UIView *view = layout.needAutoLayoutView;
        if(!view) continue;
        layout.didFinishedCache = NO;
        layout.cellSubview = NO;
        [self wd_resetLayoutDidFinished:view.wd_layoutArray];
    }
}

- (void)wd_calculateCellSubviewFrame
{
    NSArray *layoutArray = self.wd_layoutArray;
    if(!layoutArray.count) return;
    for(int i = 0;i < layoutArray.count;i++) {
        WDViewLayout *layout = layoutArray[i];
        UIView *view = layout.needAutoLayoutView;
        if(!view) continue;
        if(!layout.isDidFinishedCache) {
            [layout startLayout];
            if(!view.wd_bottomViewArray.count && !view.wd_bottomViewArray.count) {
                layout.didFinishedCache = YES;
            }
            layout.cellSubview = YES;
        }
        [view wd_calculateCellSubviewFrame];
    }
}

- (void)wd_adjustCellSubviewFrame
{
    UIView *contentView = ((UITableViewCell *)self).contentView;
    NSArray *layoutArray = contentView.wd_layoutArray;
    if(!layoutArray.count) return;
    id<NSCopying>key = nil;
    id dataSource = contentView.wd_tableView.dataSource;
    NSArray *cellSubviewFrames = nil;
    if(dataSource && [dataSource respondsToSelector:@selector(tableView:identifierForRowAtIndexPath:)] && contentView.wd_tableView && contentView.wd_indexPath) {
        key = [dataSource tableView:contentView.wd_tableView identifierForRowAtIndexPath:contentView.wd_indexPath];
    }
    if(!key && contentView.wd_indexPath && contentView.wd_tableView) {
        key = [NSString stringWithFormat:@"%zd%zd",contentView.wd_indexPath.section,contentView.wd_indexPath.row];
    }
    if(key) {
        cellSubviewFrames = [contentView.wd_tableView wd_subviewFramwWithCacheKey:key];
    }
    if(cellSubviewFrames.count != layoutArray.count) {
        [self wd_resetLayoutDidFinished:contentView.wd_layoutArray];
        [contentView wd_calculateCellSubviewFrame];
        return;
    }
    for(int i = 0;i < layoutArray.count;i++) {
        WDViewLayout *layout = layoutArray[i];
        UIView *view = layout.needAutoLayoutView;
        if(!view) continue;
        WDCellSubviewFrame *cellSubviewFrame = cellSubviewFrames[i];
        NSArray *subviewFrames = cellSubviewFrame.subviewFrames;
        view.frame = cellSubviewFrame.selfFrame;
        layout.cellSubview = YES;
        [view wd_enumerateCellAllSubviewWithSubviewFrames:subviewFrames];
    }
}

- (void)wd_calculateNormalViewFrame
{
    NSArray *layoutArray = self.wd_layoutArray;
    if(!layoutArray.count) return;
    for(int i = 0;i < layoutArray.count;i++) {
        WDViewLayout *layout = layoutArray[i];
        UIView *view = layout.needAutoLayoutView;
        if(!view) continue;
        if(!layout.isCellSubview) {
            [layout startLayout];
        }
    }
}

- (void)wd_enumerateCellAllSubviewWithSubviewFrames:(NSArray *)subviewFrames
{
    NSArray *layoutArray = self.wd_layoutArray;
    if(!layoutArray.count) return;
    if(layoutArray.count != subviewFrames.count) return;
    for(int i = 0;i < layoutArray.count;i++) {
        WDViewLayout *layout = layoutArray[i];
        UIView *view = layout.needAutoLayoutView;
        if(!view) continue;
        WDCellSubviewFrame *subviewFrame = subviewFrames[i];
        view.frame = subviewFrame.selfFrame;
        [view wd_enumerateCellAllSubviewWithSubviewFrames:subviewFrame.subviewFrames];
    }
}

- (void)wd_adjustMySelfFrame
{
    if([self isKindOfClass:[UIScrollView class]]) {
        UIScrollView *scrollView = (UIScrollView *)self;
        if(!scrollView.wd_contentSizeHeightBottomViewArray.count && !scrollView.wd_contentSizeWidthRightViewArray.count && !scrollView.wd_bottomViewArray.count && !scrollView.wd_rightViewArray.count) return;
    } else if([self isKindOfClass:[UITableViewCell class]]) {
        return;
    } else {
        if(!self.wd_bottomViewArray.count && !self.wd_rightViewArray.count) {
            return;
        }
    }
    
    if(self.wd_layout.isCellSubview && self.wd_layout.isDidFinishedCache) {
        return;
    } else if(self.wd_layout.isCellSubview) {
        self.wd_layout.didFinishedCache = YES;
    }
    CGFloat finalHeight = 0;
    CGFloat finalWidth = 0;
    if(self.wd_bottomViewArray.count) {
        for(UIView *subView in self.wd_bottomViewArray) {
            finalHeight = MAX(finalHeight, subView.wd_bottom);
        }
        finalHeight += self.wd_marginToBottom;
    }
    if(self.wd_rightViewArray.count) {
        for(UIView *subView in self.wd_rightViewArray) {
            finalWidth = MAX(finalWidth, subView.wd_right);
        }
        finalWidth += self.wd_marginToRight;
    }
    
    if([self isKindOfClass:[UIScrollView class]]) {
        CGFloat contentWidth = 0;
        CGFloat contentHeight = 0;
        UIScrollView *scrollView = (UIScrollView *)self;
        if(scrollView.wd_contentSizeHeightBottomViewArray.count) {
            for(UIView *subView in scrollView.wd_contentSizeHeightBottomViewArray) {
                contentHeight = MAX(contentHeight, subView.wd_bottom);
            }
            contentHeight += scrollView.wd_contentSizeHeightMarginToBottom;
        }
        if(scrollView.wd_contentSizeWidthRightViewArray.count) {
            for(UIView *subView in scrollView.wd_contentSizeWidthRightViewArray) {
                contentWidth = MAX(contentWidth, subView.wd_right);
            }
            contentWidth += scrollView.wd_contentSizeWidthMarginToRight;
        }
        CGSize contentSize = scrollView.contentSize;
        if(contentWidth > 0) {
            contentSize.width = contentWidth;
        }
        if(contentHeight > 0) {
            contentSize.height = contentHeight;
        }
        if (contentSize.width <= 0) {
            contentSize.width = scrollView.wd_width;
        }
        if (!CGSizeEqualToSize(contentSize, scrollView.contentSize)) {
            scrollView.contentSize = contentSize;
        }
    }
    if(self.wd_bottomViewArray.count && ceil(self.wd_height) != ceil(finalHeight)) {
        self.wd_height = finalHeight;
        self.wd_layout.hasCalculateHeight = YES;
        [self.wd_layout adjustVerticalConstraint];
    }
    
    if(self.wd_rightViewArray.count && ceil(self.wd_width) != ceil(finalWidth)) {
        self.wd_width = finalWidth;
        self.wd_layout.hasCalculateWidth = YES;
        [self.wd_layout adjustHorizontalConstraint];
    }
}

- (void)wd_setupWidthEqualSubviews
{
    NSArray *views = self.wd_widthEqualSubviews;
    if(!views.count) return;
    [WDViewLayout setupWidthEqualSubViewsWithSubviewsArray:views];
}

- (void)wd_setupHeightEqualSubviews
{
    NSArray *views = self.wd_heightEqualSubviews;
    if(!views.count) return;
    [WDViewLayout setupHeightEqualSubViewsWithSubviewsArray:views];
}

- (void)wd_setupAutoLayout
{
    if(self.wd_autoLayoutArray.count) {
        CGFloat w = 0;
        CGFloat hormargin = 0;
        NSInteger rowCount = self.wd_rowCount;
        CGFloat autoLayoutHorMargin = self.wd_autoLayoutHormargin;
        CGFloat autoLayoutVerMargin = self.wd_autoLayoutVerMargin;
        CGFloat autoLayoutFixWidth = self.wd_autoLayoutFixWidth;
        if(self.wd_fixWidthLayout) {
            w = autoLayoutFixWidth;
            hormargin = (self.wd_width - rowCount * w) / (rowCount + 1);
        } else {
            w = (self.wd_width - (rowCount + 1) * autoLayoutHorMargin) / rowCount;
            hormargin = autoLayoutHorMargin;
        }
        
        UIView *refView = self;
        NSInteger count = self.wd_autoLayoutArray.count;
        for(int i = 0;i < count;i++) {
            UIView *view = self.wd_autoLayoutArray[i];
            if(i < self.wd_rowCount) {
                if(i == 0) {
                    view.wd_layout.leftSpaceToView(refView,hormargin).topSpaceToView(refView,autoLayoutVerMargin).width(w);
                } else {
                    view.wd_layout.leftSpaceToView(refView,hormargin).topEqualToView(refView).width(w);
                }
                refView = view;
            } else {
                refView = self.wd_autoLayoutArray[i % self.wd_rowCount];
                view.wd_layout.leftEqualToView(refView).topSpaceToView(refView,autoLayoutVerMargin).width(w);
            }
        }
    }
}

- (void)layoutSubviewsFrame
{
    [self wd_setupWidthEqualSubviews];
    [self wd_setupHeightEqualSubviews];
    [self wd_setupAutoLayout];
    if([self isKindOfClass:NSClassFromString(@"UITableViewCellContentView")]) {
        [self wd_calculateCellSubviewFrame];
    } else if([self isKindOfClass:[UITableViewCell class]] && ((UITableViewCell *)self).contentView.wd_layoutArray.count) {
        [self wd_adjustCellSubviewFrame];
    } else {
        [self wd_calculateNormalViewFrame];
    }
    [self wd_adjustMySelfFrame];
}


- (void)wd_layoutSubviews
{
    [self wd_layoutSubviews];
    [self layoutSubviewsFrame];
}

- (void)setWd_didFinishedAutoLayout:(void (^)(CGRect))wd_didFinishedAutoLayout
{
    objc_setAssociatedObject(self, @selector(wd_didFinishedAutoLayout), wd_didFinishedAutoLayout, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(CGRect))wd_didFinishedAutoLayout
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setWd_bottomView:(UIView *)wd_bottomView
{
    if(!wd_bottomView) return;
    [self setWd_bottomViewArray:@[wd_bottomView]];
}

- (NSArray *)wd_autoLayoutArray
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setWd_autoLayoutArray:(NSArray *)wd_autoLayoutArray
{
    objc_setAssociatedObject(self, @selector(wd_autoLayoutArray), wd_autoLayoutArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)wd_autoLayoutFixWidth
{
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}

- (void)setWd_autoLayoutFixWidth:(CGFloat)wd_autoLayoutFixWidth
{
    objc_setAssociatedObject(self, @selector(wd_autoLayoutFixWidth), @(wd_autoLayoutFixWidth), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)wd_autoLayoutHormargin
{
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
    
}

- (void)setWd_autoLayoutHormargin:(CGFloat)wd_autoLayoutHormargin
{
    objc_setAssociatedObject(self, @selector(wd_autoLayoutHormargin), @(wd_autoLayoutHormargin), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (CGFloat)wd_autoLayoutVerMargin
{
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}

- (void)setWd_autoLayoutVerMargin:(CGFloat)wd_autoLayoutVerMargin
{
    objc_setAssociatedObject(self, @selector(wd_autoLayoutVerMargin), @(wd_autoLayoutVerMargin), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (NSInteger)wd_rowCount
{
    return [objc_getAssociatedObject(self, _cmd) integerValue];
    
}

- (void)setWd_rowCount:(NSInteger)wd_rowCount
{
    objc_setAssociatedObject(self, @selector(wd_rowCount), @(wd_rowCount), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (BOOL)isWd_FixWidthLayout
{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
    
}

- (void)setWd_fixWidthLayout:(BOOL)wd_fixWidthLayout
{
    objc_setAssociatedObject(self, @selector(isWd_FixWidthLayout), @(wd_fixWidthLayout), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (UIView *)wd_bottomView
{
    NSArray *bottomViewArray = [self wd_bottomViewArray];
    if(!bottomViewArray.count) return nil;
    return bottomViewArray[0];
}

- (void)setWd_bottomViewArray:(NSArray *)wd_bottomViewArray
{
    objc_setAssociatedObject(self, @selector(wd_bottomViewArray), wd_bottomViewArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSArray *)wd_bottomViewArray
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setWd_marginToBottom:(CGFloat)wd_marginToBottom
{
    objc_setAssociatedObject(self, @selector(wd_marginToBottom), @(wd_marginToBottom), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)wd_marginToBottom
{
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)wd_setupBottomViewWithBottomView:(UIView *)bottomView marginToBottom:(CGFloat)marginToBottom
{
    self.wd_bottomView = bottomView;
    self.wd_marginToBottom = marginToBottom;
}

- (void)wd_setupBottomViewWithBottomViewArray:(NSArray *)bottomViewArray marginToBottom:(CGFloat)marginToBottom
{
    self.wd_bottomViewArray = bottomViewArray;
    self.wd_marginToBottom = marginToBottom;
}

- (void)setWd_rightView:(UIView *)wd_rightView
{
    if(!wd_rightView) return;
    [self setWd_rightViewArray:@[wd_rightView]];
}

- (UIView *)wd_rightView
{
    NSArray *rightViewArray = [self wd_rightViewArray];
    if(!rightViewArray.count) return nil;
    return rightViewArray[0];
}

- (void)setWd_rightViewArray:(NSArray *)wd_rightViewArray
{
    objc_setAssociatedObject(self, @selector(wd_rightViewArray), wd_rightViewArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSArray *)wd_rightViewArray
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setWd_marginToRight:(CGFloat)wd_marginToRight
{
    objc_setAssociatedObject(self, @selector(wd_marginToRight), @(wd_marginToRight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)wd_marginToRight
{
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)wd_setupRightViewWithRightView:(UIView *)rightView marginToRight:(CGFloat)marginToRight
{
    self.wd_rightView = rightView;
    self.wd_marginToRight = marginToRight;
}

- (void)wd_setupRightViewWithRightViewArray:(NSArray *)rightViewArray marginToRight:(CGFloat)marginToRight
{
    self.wd_rightViewArray = rightViewArray;
    self.wd_marginToRight = marginToRight;
}

- (void)wd_setupAutoMarginFixWidthLayoutWithItemArray:(NSArray *)itemArray verticalMargin:(CGFloat)verticalMargin itemWidth:(CGFloat)itemWidth rowCount:(NSInteger)rowCount
{
    self.wd_autoLayoutFixWidth = itemWidth;
    self.wd_fixWidthLayout = YES;
    [self wd_setupAutoWidthFixMarginLayoutWithItemArray:itemArray horizontalMargin:0 verticalMargin:verticalMargin rowCount:rowCount];
}

- (void)wd_setupAutoWidthFixMarginLayoutWithItemArray:(NSArray *)itemArray horizontalMargin:(CGFloat)horizontalMargin verticalMargin:(CGFloat)verticalMargin rowCount:(NSInteger)rowCount
{
    self.wd_autoLayoutArray = itemArray;
    self.wd_autoLayoutHormargin = horizontalMargin;
    self.wd_autoLayoutVerMargin = verticalMargin;
    self.wd_rowCount = rowCount;
    if(itemArray.count) {
        [self wd_setupBottomViewWithBottomView:itemArray.lastObject marginToBottom:verticalMargin];
    } else {
        [self.wd_layoutArray removeAllObjects];
    }
}

@end

@implementation UIView (WDAutoLayoutFrame)

- (void)setWd_left:(CGFloat)wd_left
{
    CGRect frame = self.frame;
    frame.origin.x = wd_left;
    self.frame = frame;
}

- (CGFloat)wd_left
{
    return self.frame.origin.x;
}

- (void)setWd_top:(CGFloat)wd_top
{
    CGRect frame = self.frame;
    frame.origin.y = wd_top;
    self.frame = frame;
}

- (CGFloat)wd_top
{
    return self.frame.origin.y;
}

-(void)setWd_right:(CGFloat)wd_right
{
    CGRect frame = self.frame;
    frame.origin.x = wd_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)wd_right
{
    return self.frame.size.width + self.frame.origin.x;
}

-(void)setWd_bottom:(CGFloat)wd_bottom
{
    CGRect frame = self.frame;
    frame.origin.y = wd_bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)wd_bottom
{
    return self.frame.size.height + self.frame.origin.y;
}

-(void)setWd_centerX:(CGFloat)wd_centerX
{
    CGPoint center = self.center;
    center.x = wd_centerX;
    self.center = center;
}

- (CGFloat)wd_centerX
{
    return self.center.x;
}

-(void)setWd_centerY:(CGFloat)wd_centerY
{
    CGPoint center = self.center;
    center.y = wd_centerY;
    self.center = center;
}

- (CGFloat)wd_centerY
{
    return self.center.y;
}

- (void)setWd_width:(CGFloat)wd_width
{
    if(self.wd_layout.widthEqualHeightConstraint) {
        if(wd_width != self.wd_height) return;
    }
    CGRect frame = self.frame;
    frame.size.width = wd_width;
    if(self.wd_layout.heightEqualWidthConstraint) {
        frame.size.height = wd_width;
    }
    self.frame = frame;
}

- (CGFloat)wd_width
{
    return self.frame.size.width;
}

- (void)setWd_height:(CGFloat)wd_height
{
    if(self.wd_layout.heightEqualWidthConstraint) {
        if(wd_height != self.wd_width) return;
    }
    CGRect frame = self.frame;
    frame.size.height = wd_height;
    if(self.wd_layout.widthEqualHeightConstraint) {
        frame.size.width = wd_height;
    }
    self.frame = frame;
}

- (CGFloat)wd_height
{
    return self.frame.size.height;
}


- (CGPoint)wd_origin
{
    return self.frame.origin;
}

- (void)setWd_origin:(CGPoint)wd_origin
{
    CGRect frame = self.frame;
    frame.origin = wd_origin;
    self.frame = frame;
}

- (CGSize)wd_size
{
    return self.frame.size;
}

- (void)setWd_size:(CGSize)wd_size
{
    CGRect frame = self.frame;
    frame.size = wd_size;
    self.frame = frame;
}

@end

@implementation UILabel (WDAutoLayout)

- (BOOL)isAttributedContent
{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setAttributedContent:(BOOL)attributedContent
{
    objc_setAssociatedObject(self, @selector(isAttributedContent), @(attributedContent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)wd_setMaxNumberOfLines:(NSInteger)lineCount
{
    if(lineCount > 0) {
        self.wd_layout.maxHeight(self.font.lineHeight * lineCount + 0.1);
    } else {
        self.wd_layout.maxHeight(MAXFLOAT);
    }
}

@end

@implementation UIScrollView (WDAutoLayout)

- (void)setWd_contentSizeHeightBottomView:(UIView *)wd_contentSizeHeightBottomView
{
    if(!wd_contentSizeHeightBottomView) return;
    [self setWd_contentSizeHeightBottomViewArray:@[wd_contentSizeHeightBottomView]];
}

- (UIView *)wd_contentSizeHeightBottomView
{
    NSArray *array = [self wd_contentSizeHeightBottomViewArray];
    if(!array.count) return nil;
    return array[0];
}

- (void)setWd_contentSizeHeightBottomViewArray:(NSArray *)wd_contentSizeHeightBottomViewArray
{
    objc_setAssociatedObject(self, @selector(wd_contentSizeHeightBottomViewArray), wd_contentSizeHeightBottomViewArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSArray *)wd_contentSizeHeightBottomViewArray
{
    return objc_getAssociatedObject(self, _cmd);
}


- (void)setWd_contentSizeWidthRightView:(UIView *)wd_contentSizeWidthRightView
{
    if(!wd_contentSizeWidthRightView) return;
    [self setWd_contentSizeWidthRightViewArray:@[wd_contentSizeWidthRightView]];
}

- (UIView *)wd_contentSizeWidthRightView
{
    NSArray *array = [self wd_contentSizeWidthRightViewArray];
    if(!array.count) return nil;
    return array[0];
}

- (void)setWd_contentSizeWidthRightViewArray:(NSArray *)wd_contentSizeWidthRightViewArray
{
    objc_setAssociatedObject(self, @selector(wd_contentSizeWidthRightViewArray), wd_contentSizeWidthRightViewArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSArray *)wd_contentSizeWidthRightViewArray
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setWd_contentSizeHeightMarginToBottom:(CGFloat)wd_contentSizeHeightMarginToBottom
{
    objc_setAssociatedObject(self, @selector(wd_contentSizeHeightMarginToBottom), @(wd_contentSizeHeightMarginToBottom), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)wd_contentSizeHeightMarginToBottom
{
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)setWd_contentSizeWidthMarginToRight:(CGFloat)wd_contentSizeWidthMarginToRight
{
    objc_setAssociatedObject(self, @selector(wd_contentSizeWidthMarginToRight), @(wd_contentSizeWidthMarginToRight),OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)wd_contentSizeWidthMarginToRight
{
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)wd_setupContentSizeHeightWithBottomView:(UIView *)bottomView contentSizeHeightmarginToBottom:(CGFloat)marginToBottom
{
    self.wd_contentSizeHeightBottomView = bottomView;
    self.wd_contentSizeHeightMarginToBottom = marginToBottom;
}

- (void)wd_setupContentSizeHeightWithBottomViewArray:(NSArray *)bottomViewArray contentSizeHeightmarginToBottom:(CGFloat)marginToBottom
{
    self.wd_contentSizeHeightBottomViewArray = bottomViewArray;
    self.wd_contentSizeHeightMarginToBottom = marginToBottom;
}

- (void)wd_setupContentSizeWidthWithRightView:(UIView *)rightView contentSizeWidthmarginToRight:(CGFloat)marginToRight
{
    self.wd_contentSizeWidthRightView = rightView;
    self.wd_contentSizeWidthMarginToRight = marginToRight;
}

- (void)wd_setupContentSizeWidthWithRightViewArray:(NSArray *)rightViewArray contentSizeWidthmarginToRight:(CGFloat)marginToRight
{
    self.wd_contentSizeWidthRightViewArray = rightViewArray;
    self.wd_contentSizeWidthMarginToRight = marginToRight;
}

@end

@implementation UIButton (WDAutoLayout)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL systemSEL[] = {@selector(layoutSubviews)};
        SEL customerSEL[] = {@selector(wd_buttonLayoutSubviews)};
        for(int i = 0;i < sizeof(systemSEL) / sizeof(SEL);i++) {
            Method systemMethod = class_getInstanceMethod(self,systemSEL[i]);
            Method custmerMethod = class_getInstanceMethod(self,customerSEL[i]);
            method_exchangeImplementations(systemMethod, custmerMethod);
        }
    });
}

- (void)wd_buttonWidthAutoresizingWithMargin:(CGFloat)horMargin fixHeight:(CGFloat)height
{
    self.titleLabel.wd_layout.topEqualToSuperView().leftSpaceToSuperView(horMargin).height(height);
    self.titleLabel.wd_layout.autoresizingMaxWidth(0);
    self.wd_height = height;
    self.wd_layout.heightFix = YES;
    [self wd_setupRightViewWithRightView:self.titleLabel marginToRight:horMargin];
}

- (void)wd_buttonHeightAutoresizingWithMargin:(CGFloat)verMargin fixWidth:(CGFloat)width
{
    self.titleLabel.wd_layout.leftEqualToSuperView().topSpaceToSuperView(verMargin).width(width);
    self.titleLabel.wd_layout.autoHeightRatio(0);
    self.wd_width = width;
    self.wd_layout.widthFix = YES;
    
    [self wd_setupBottomViewWithBottomView:self.titleLabel marginToBottom:verMargin];
}

- (void)wd_buttonWidthHeightAutoresizingWithHorMargin:(CGFloat)horMargin verMargin:(CGFloat)verMargin
{
    self.titleLabel.wd_layout.autoHeightRatio(0).autoresizingMaxWidth(0).leftSpaceToSuperView(horMargin).topSpaceToSuperView(verMargin);
    [self wd_setupRightViewWithRightView:self.titleLabel marginToRight:horMargin];
    [self wd_setupBottomViewWithBottomView:self.titleLabel marginToBottom:verMargin];
    
}

- (void)wd_buttonLayoutSubviews
{
    [self wd_buttonLayoutSubviews];
    [self layoutSubviewsFrame];
    if(self.wd_layoutArray.count) {
        [self.titleLabel.wd_layout startLayout];
        [self.imageView.wd_layout startLayout];
    }
}

@end

