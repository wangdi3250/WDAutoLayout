//
//  WDViewLayout.m
//  WDAutoLayout
//
//  Created by 王迪 on 16/3/19.
//  Copyright © 2016年 wangdi. All rights reserved.
//

#import "WDViewLayout.h"
#import "WDLayoutConstraint.h"
#import "UIView+WDAutoLayout.h"

@interface WDViewLayout()

@property (nonatomic, strong) WDLayoutConstraint *leftConstraint;
@property (nonatomic, strong) WDLayoutConstraint *topConstraint;
@property (nonatomic, strong) WDLayoutConstraint *rightConstraint;
@property (nonatomic, strong) WDLayoutConstraint *bottomConstraint;
@property (nonatomic, strong) WDLayoutConstraint *widthConstraint;
@property (nonatomic, strong) WDLayoutConstraint *heightConstraint;
@property (nonatomic, strong) WDLayoutConstraint *leftEqualConstraint;
@property (nonatomic, strong) WDLayoutConstraint *leftEqualAndExtrasMarginConstraint;
@property (nonatomic, strong) WDLayoutConstraint *topEqualConstraint;
@property (nonatomic, strong) WDLayoutConstraint *topEqualAndExtrasMarginConstraint;
@property (nonatomic, strong) WDLayoutConstraint *rightEqualConstraint;
@property (nonatomic, strong) WDLayoutConstraint *rightEqualAndExtrasMarginConstraint;
@property (nonatomic, strong) WDLayoutConstraint *bottomEqualConstraint;
@property (nonatomic, strong) WDLayoutConstraint *bottomEqualAndExtrasMarginConstraint;
@property (nonatomic, strong) WDLayoutConstraint *centerXEqualConstraint;
@property (nonatomic, strong) WDLayoutConstraint *centerXEqualAndExtrasMarginConstraint;
@property (nonatomic, strong) WDLayoutConstraint *centerYEqualConstraint;
@property (nonatomic, strong) WDLayoutConstraint *centerYEqualAndExtrasMarginConstraint;
@property (nonatomic, strong) NSNumber *limitMaxWidth;
@property (nonatomic, strong) NSNumber *limitMaxHeight;
@property (nonatomic, strong) NSNumber *limitMinWidth;
@property (nonatomic, strong) NSNumber *limitMinHeight;
@property (nonatomic, strong) NSNumber *heightRatio;
@property (nonatomic, strong) NSNumber *limitAutoresizingMaxWidth;
@property (nonatomic, strong) NSNumber *limitExtrasWidth;
@property (nonatomic, strong) NSNumber *limitExtrasHeight;
@property (nonatomic, strong) WDLayoutConstraint *widthRatioToViewConstraint;
@property (nonatomic, strong) WDLayoutConstraint *heightRatioToViewConstraint;
@property (nonatomic, strong) WDLayoutConstraint *fixedWidthConstraint;
@property (nonatomic, strong) WDLayoutConstraint *fixedHeightConstraint;

@end

@implementation WDViewLayout

@synthesize leftSpaceToView = _leftSpaceToView;
@synthesize rightSpaceToView = _rightSpaceToView;
@synthesize topSpaceToView = _topSpaceToView;
@synthesize bottomSpaceToView = _bottomSpaceToView;
@synthesize leftSpaceToSuperView = _leftSpaceToSuperView;
@synthesize topSpaceToSuperView = _topSpaceToSuperView;
@synthesize rightSpaceToSuperView = _rightSpaceToSuperView;
@synthesize bottomSpaceToSuperView = _bottomSpaceToSuperView;
@synthesize leftEqualToView = _leftEqualToView;
@synthesize rightEqualToView = _rightEqualToView;
@synthesize topEqualToView = _topEqualToView;
@synthesize bottomEqualToView = _bottomEqualToView;
@synthesize centerXEqualToView = _centerXEqualToView;
@synthesize centerYEqualToView = _centerYEqualToView;
@synthesize widthEqualToView = _widthEqualToView;
@synthesize heightEqualToView = _heightEqualToView;
@synthesize width = _width;
@synthesize height = _height;
@synthesize maxWidth = _maxWidth;
@synthesize maxHeight = _maxHeight;
@synthesize minWidth = _minWidth;
@synthesize minHeight = _minHeight;
@synthesize autoresizingMaxWidth = _autoresizingMaxWidth;
@synthesize widthEqualHeight = _widthEqualHeight;
@synthesize heightEqualWidth = _heightEqualWidth;
@synthesize widthRatioToView = _widthRatioToView;
@synthesize heightRatioToView = _heightRatioToView;
@synthesize spaceToSuperView = _spaceToSuperView;
@synthesize autoHeightRatio = _autoHeightRatio;
@synthesize extrasWidth = _extrasWidth;
@synthesize extrasHeight = _extrasHeight;
@synthesize leftEqualToViewAndExtrasMargin = _leftEqualToViewAndExtrasMargin;
@synthesize topEqualToViewAndExtrasMargin = _topEqualToViewAndExtrasMargin;
@synthesize rightEqualToViewAndExtrasMargin = _rightEqualToViewAndExtrasMargin;
@synthesize bottomEqualToViewAndExtrasMargin = _bottomEqualToViewAndExtrasMargin;
@synthesize centerXEqualToViewAndExtrasMargin = _centerXEqualToViewAndExtrasMargin;
@synthesize centerYEqualToViewAndExtrasMargin = _centerYEqualToViewAndExtrasMargin;
@synthesize leftEqualToSuperView = _leftEqualToSuperView;
@synthesize topEqualToSuperView = _topEqualToSuperView;
@synthesize rightEqualToSuperView = _rightEqualToSuperView;
@synthesize bottomEqualToSuperView = _bottomEqualToSuperView;
@synthesize leftEqualToSuperViewAndExtrasMargin = _leftEqualToSuperViewAndExtrasMargin;
@synthesize topEqualToSuperViewAndExtrasMargin = _topEqualToSuperViewAndExtrasMargin;
@synthesize rightEqualToSuperViewAndExtrasMargin = _rightEqualToSuperViewAndExtrasMargin;
@synthesize bottomEqualToSuperViewAndExtrasMargin = _bottomEqualToSuperViewAndExtrasMargin;
@synthesize centerXEqualToSuperViewAndExtrasMargin = _centerXEqualToSuperViewAndExtrasMargin;
@synthesize centerYEqualToSuperViewAndExtrasMargin = _centerYEqualToSuperViewAndExtrasMargin;
@synthesize centerXEqualToSuperView = _centerXEqualToSuperView;
@synthesize centerYEqualToSuperView = _centerYEqualToSuperView;
@synthesize fixedWidth = _fixedWidth;
@synthesize fixedHeight = _fixedHeight;

+ (instancetype)layoutWithNeedAutoLayoutView:(UIView *)view
{
    WDViewLayout *layout = [[WDViewLayout alloc] init];
    layout.needAutoLayoutView = view;
    return layout;
}

- (WDMarginToView)leftSpaceToView
{
    if(!_leftSpaceToView) {
        _leftSpaceToView = [self marginToViewBlockWithKey:@"leftConstraint"];
    }
    return _leftSpaceToView;
    
}

- (WDMarginToView)topSpaceToView
{
    if(!_topSpaceToView) {
        _topSpaceToView = [self marginToViewBlockWithKey:@"topConstraint"];
    }
    return _topSpaceToView;
}

- (WDMarginToView)rightSpaceToView
{
    if(!_rightSpaceToView) {
        _rightSpaceToView = [self marginToViewBlockWithKey:@"rightConstraint"];
    }
    return _rightSpaceToView;
}

- (WDMarginToView)bottomSpaceToView
{
    if(!_bottomSpaceToView) {
        _bottomSpaceToView = [self marginToViewBlockWithKey:@"bottomConstraint"];
    }
    return _bottomSpaceToView;
}

- (WDMarginToView)marginToViewBlockWithKey:(NSString *)key
{
    __weak typeof (self) weakSelf = self;
    return ^WDViewLayout *(UIView *toView,CGFloat value) {
        WDLayoutConstraint *constraint = [WDLayoutConstraint constraintWithFirstView:weakSelf.needAutoLayoutView secondView:toView constant:value];
        [weakSelf setValue:constraint forKey:key];
        return weakSelf;
    };
}

- (WDMarginToSuperView)leftSpaceToSuperView
{
    if(!_leftSpaceToSuperView) {
        __weak typeof(self) weakSelf = self;
        _leftSpaceToSuperView = ^WDViewLayout *(CGFloat value) {
            weakSelf.leftSpaceToView(weakSelf.needAutoLayoutView.superview,value);
            return weakSelf;
        };
    }
    return _leftSpaceToSuperView;
}

- (WDMarginToSuperView)topSpaceToSuperView
{
    if(!_topSpaceToSuperView) {
        __weak typeof(self) weakSelf = self;
        _topSpaceToSuperView = ^WDViewLayout *(CGFloat value) {
            weakSelf.topSpaceToView(weakSelf.needAutoLayoutView.superview,value);
            return weakSelf;
        };
    }
    return _topSpaceToSuperView;
}

- (WDMarginToSuperView)rightSpaceToSuperView
{
    if(!_rightSpaceToSuperView) {
        __weak typeof(self) weakSelf = self;
        _rightSpaceToSuperView = ^WDViewLayout *(CGFloat value) {
            weakSelf.rightSpaceToView(weakSelf.needAutoLayoutView.superview,value);
            return weakSelf;
        };
    }
    return _rightSpaceToSuperView;
}

- (WDMarginToSuperView)bottomSpaceToSuperView
{
    if(!_bottomSpaceToSuperView) {
        __weak typeof(self) weakSelf = self;
        _bottomSpaceToSuperView = ^WDViewLayout *(CGFloat value) {
            weakSelf.bottomSpaceToView(weakSelf.needAutoLayoutView.superview,value);
            return weakSelf;
        };
    }
    return _bottomSpaceToSuperView;
}

- (WDMarginEqualToView)leftEqualToView
{
    if(!_leftEqualToView) {
        _leftEqualToView = [self marginEqualToViewBlockWithKey:@"leftEqualConstraint"];
    }
    return _leftEqualToView;
}

- (WDMarginEqualToView)topEqualToView
{
    if(!_topEqualToView) {
        _topEqualToView = [self marginEqualToViewBlockWithKey:@"topEqualConstraint"];
    }
    return _topEqualToView;
}

- (WDMarginEqualToView)rightEqualToView
{
    if(!_rightEqualToView) {
        _rightEqualToView = [self marginEqualToViewBlockWithKey:@"rightEqualConstraint"];
    }
    return _rightEqualToView;
}

- (WDMarginEqualToView)bottomEqualToView
{
    if(!_bottomEqualToView) {
        _bottomEqualToView = [self marginEqualToViewBlockWithKey:@"bottomEqualConstraint"];
    }
    return _bottomEqualToView;
}

- (WDMarginEqualToSuperView)leftEqualToSuperView
{
    if(!_leftEqualToSuperView) {
        __weak typeof(self) weakSelf = self;
        _leftEqualToSuperView = ^WDViewLayout *{
            weakSelf.leftEqualToView(weakSelf.needAutoLayoutView.superview);
            return weakSelf;
        };
    }
    return _leftEqualToSuperView;
}
- (WDMarginEqualToSuperView)topEqualToSuperView
{
    if(!_topEqualToSuperView) {
        __weak typeof(self) weakSelf = self;
        _topEqualToSuperView = ^WDViewLayout *{
            weakSelf.topEqualToView(weakSelf.needAutoLayoutView.superview);
            return weakSelf;
        };
    }
    return _topEqualToSuperView;
}

- (WDMarginEqualToSuperView)rightEqualToSuperView
{
    if(!_rightEqualToSuperView) {
        __weak typeof(self) weakSelf = self;
        _rightEqualToSuperView = ^WDViewLayout *{
            weakSelf.rightEqualToView(weakSelf.needAutoLayoutView.superview);
            return weakSelf;
        };
    }
    return _rightEqualToSuperView;
}

- (WDMarginEqualToSuperView)bottomEqualToSuperView
{
    if(!_bottomEqualToSuperView) {
        __weak typeof(self) weakSelf = self;
        _bottomEqualToSuperView = ^WDViewLayout *{
            weakSelf.bottomEqualToView(weakSelf.needAutoLayoutView.superview);
            return weakSelf;
        };
    }
    return _bottomEqualToSuperView;
}

- (WDMarginEqualToView)centerXEqualToView
{
    if(!_centerXEqualToView) {
        _centerXEqualToView = [self marginEqualToViewBlockWithKey:@"centerXEqualConstraint"];
    }
    return _centerXEqualToView;
}

- (WDMarginEqualToView)centerYEqualToView
{
    if(!_centerYEqualToView) {
        _centerYEqualToView = [self marginEqualToViewBlockWithKey:@"centerYEqualConstraint"];
    }
    return _centerYEqualToView;
}

- (WDMarginEqualToSuperView)centerXEqualToSuperView
{
    if(!_centerXEqualToSuperView) {
        __weak typeof(self) weakSelf = self;
        _centerXEqualToSuperView = ^WDViewLayout *{
            weakSelf.centerXEqualToView(weakSelf.needAutoLayoutView.superview);
            return weakSelf;
        };
    }
    return _centerXEqualToSuperView;
}

- (WDMarginEqualToSuperView)centerYEqualToSuperView
{
    if(!_centerYEqualToSuperView) {
        __weak typeof(self) weakSelf = self;
        _centerYEqualToSuperView = ^WDViewLayout *{
            weakSelf.centerYEqualToView(weakSelf.needAutoLayoutView.superview);
            return weakSelf;
        };
    }
    return _centerYEqualToSuperView;
}

- (WDMarginEqualToViewAndExtrasMargin)leftEqualToViewAndExtrasMargin
{
    if(!_leftEqualToViewAndExtrasMargin) {
        _leftEqualToViewAndExtrasMargin = [self marginEqualToViewAndExtrasMarginBlockWithKey:@"leftEqualAndExtrasMarginConstraint"];
    }
    return _leftEqualToViewAndExtrasMargin;
}

- (WDMarginEqualToViewAndExtrasMargin)topEqualToViewAndExtrasMargin
{
    if(!_topEqualToViewAndExtrasMargin) {
        _topEqualToViewAndExtrasMargin = [self marginEqualToViewAndExtrasMarginBlockWithKey:@"topEqualAndExtrasMarginConstraint"];
    }
    return _topEqualToViewAndExtrasMargin;
}

- (WDMarginEqualToViewAndExtrasMargin)rightEqualToViewAndExtrasMargin
{
    if(!_rightEqualToViewAndExtrasMargin) {
        _rightEqualToViewAndExtrasMargin = [self marginEqualToViewAndExtrasMarginBlockWithKey:@"rightEqualAndExtrasMarginConstraint"];
    }
    return _rightEqualToViewAndExtrasMargin;
}

- (WDMarginEqualToViewAndExtrasMargin)bottomEqualToViewAndExtrasMargin
{
    if(!_bottomEqualToViewAndExtrasMargin) {
        _bottomEqualToViewAndExtrasMargin = [self marginEqualToViewAndExtrasMarginBlockWithKey:@"bottomEqualAndExtrasMarginConstraint"];
    }
    return _bottomEqualToViewAndExtrasMargin;
}
- (WDMarginEqualToSuperViewAndExtrasMargin)leftEqualToSuperViewAndExtrasMargin
{
    if(!_leftEqualToSuperViewAndExtrasMargin) {
        __weak typeof(self) weakSelf = self;
        _leftEqualToSuperViewAndExtrasMargin = ^WDViewLayout *(CGFloat value) {
            weakSelf.leftEqualToViewAndExtrasMargin(weakSelf.needAutoLayoutView.superview,value);
            return weakSelf;
        };
    }
    return _leftEqualToSuperViewAndExtrasMargin;
}

- (WDMarginEqualToSuperViewAndExtrasMargin)topEqualToSuperViewAndExtrasMargin
{
    if(!_topEqualToSuperViewAndExtrasMargin) {
        __weak typeof(self) weakSelf = self;
        _topEqualToSuperViewAndExtrasMargin = ^WDViewLayout *(CGFloat value) {
            weakSelf.topEqualToViewAndExtrasMargin(weakSelf.needAutoLayoutView.superview,value);
            return weakSelf;
        };
    }
    return _topEqualToSuperViewAndExtrasMargin;
}

- (WDMarginEqualToSuperViewAndExtrasMargin)rightEqualToSuperViewAndExtrasMargin
{
    if(!_rightEqualToSuperViewAndExtrasMargin) {
        __weak typeof(self) weakSelf = self;
        _rightEqualToSuperViewAndExtrasMargin = ^WDViewLayout *(CGFloat value) {
            weakSelf.rightEqualToViewAndExtrasMargin(weakSelf.needAutoLayoutView.superview,value);
            return weakSelf;
        };
    }
    return _rightEqualToSuperViewAndExtrasMargin;
}

- (WDMarginEqualToSuperViewAndExtrasMargin)bottomEqualToSuperViewAndExtrasMargin
{
    if(!_bottomEqualToSuperViewAndExtrasMargin) {
        __weak typeof(self) weakSelf = self;
        _bottomEqualToSuperViewAndExtrasMargin = ^WDViewLayout *(CGFloat value) {
            weakSelf.bottomEqualToViewAndExtrasMargin(weakSelf.needAutoLayoutView.superview,value);
            return weakSelf;
        };
    }
    return _bottomEqualToSuperViewAndExtrasMargin;
}

- (WDMarginEqualToViewAndExtrasMargin)centerXEqualToViewAndExtrasMargin
{
    if(!_centerXEqualToViewAndExtrasMargin) {
        _centerXEqualToViewAndExtrasMargin = [self marginEqualToViewAndExtrasMarginBlockWithKey:@"centerXEqualAndExtrasMarginConstraint"];
    }
    return _centerXEqualToViewAndExtrasMargin;
}

- (WDMarginEqualToViewAndExtrasMargin)centerYEqualToViewAndExtrasMargin
{
    if(!_centerYEqualToViewAndExtrasMargin) {
        _centerYEqualToViewAndExtrasMargin = [self marginEqualToViewAndExtrasMarginBlockWithKey:@"centerYEqualAndExtrasMarginConstraint"];
    }
    return _centerYEqualToViewAndExtrasMargin;
}

- (WDMarginEqualToSuperViewAndExtrasMargin)centerXEqualToSuperViewAndExtrasMargin
{
    if(!_centerXEqualToSuperViewAndExtrasMargin) {
        __weak typeof(self) weakSelf = self;
        _centerXEqualToSuperViewAndExtrasMargin = ^WDViewLayout *(CGFloat value) {
            weakSelf.centerXEqualToViewAndExtrasMargin(weakSelf.needAutoLayoutView.superview,value);
            return weakSelf;
        };
    }
    return _centerXEqualToSuperViewAndExtrasMargin;
}

- (WDMarginEqualToSuperViewAndExtrasMargin)centerYEqualToSuperViewAndExtrasMargin
{
    if(!_centerYEqualToSuperViewAndExtrasMargin) {
        __weak typeof(self) weakSelf = self;
        _centerYEqualToSuperViewAndExtrasMargin = ^WDViewLayout *(CGFloat value) {
            weakSelf.centerYEqualToViewAndExtrasMargin(weakSelf.needAutoLayoutView.superview,value);
            return weakSelf;
        };
    }
    return _centerYEqualToSuperViewAndExtrasMargin;
}

- (WDMarginEqualToViewAndExtrasMargin)marginEqualToViewAndExtrasMarginBlockWithKey:(NSString *)key
{
    __weak typeof(self) weakSelf = self;
    return ^WDViewLayout *(UIView *toView,CGFloat value) {
        WDLayoutConstraint *constraint = [WDLayoutConstraint constraintWithFirstView:weakSelf.needAutoLayoutView secondView:toView constant:value];
        [weakSelf setValue:constraint forKey:key];
        return weakSelf;
    };
}

- (WDMarginEqualToView)marginEqualToViewBlockWithKey:(NSString *)key
{
    __weak typeof(self) weakSelf = self;
    return ^WDViewLayout *(UIView *toView) {
        WDLayoutConstraint *constraint = [WDLayoutConstraint constraintWithFirstView:weakSelf.needAutoLayoutView secondView:toView];
        [weakSelf setValue:constraint forKey:key];
        return weakSelf;
    };
}

- (WDWidthHeightEqualToView)widthEqualToView
{
    if(!_widthEqualToView) {
        __weak typeof(self) weakSelf = self;
        _widthEqualToView = ^WDViewLayout *(UIView *toView) {
            weakSelf.widthRatioToView(toView,1);
            return weakSelf;
        };
    }
    return _widthEqualToView;
}

- (WDWidthHeightEqualToView)heightEqualToView
{
    if(!_heightEqualToView) {
        __weak typeof(self) weakSelf = self;
        _heightEqualToView = ^WDViewLayout *(UIView *toView) {
            weakSelf.heightRatioToView(toView,1);
            return weakSelf;
        };
    }
    return _heightEqualToView;
}

- (WDWidthHeight)width
{
    if(!_width) {
        _width = [self widthHeightBlockWithKey:@"widthConstraint"];
    }
    return _width;
}

- (WDWidthHeight)height
{
    if(!_height) {
        _height = [self widthHeightBlockWithKey:@"heightConstraint"];
    }
    return _height;
}

- (WDExtrasWidthHeight)extrasWidth
{
    if(!_extrasWidth) {
        __weak typeof(self) weakSelf = self;
        _extrasWidth = ^WDViewLayout *(CGFloat value) {
            [weakSelf setValue:@(value) forKey:@"limitExtrasWidth"];
            return weakSelf;
        };
    }
    return _extrasWidth;
}

- (WDExtrasWidthHeight)extrasHeight
{
    if(!_extrasHeight) {
        __weak typeof(self) weakSelf = self;
        _extrasHeight = ^WDViewLayout *(CGFloat value) {
            [weakSelf setValue:@(value) forKey:@"limitExtrasHeight"];
            return weakSelf;
        };
    }
    return _extrasHeight;
}

- (WDSameWidthHeight)widthEqualHeight
{
    if(!_widthEqualHeight) {
        __weak typeof(self) weakSelf = self;
        _widthEqualHeight = ^{
            __strong typeof(weakSelf) strongSelf = weakSelf;
            strongSelf->_widthEqualHeightConstraint = [[WDLayoutConstraint alloc] init];
            return weakSelf;
        };
    }
    return _widthEqualHeight;
}

- (WDSameWidthHeight)heightEqualWidth
{
    if(!_heightEqualWidth) {
        __weak typeof(self) weakSelf = self;
        _heightEqualWidth = ^{
            __strong typeof(weakSelf) strongSelf = weakSelf;
            strongSelf->_heightEqualWidthConstraint = [[WDLayoutConstraint alloc] init];
            return weakSelf;
        };
    }
    return _heightEqualWidth;
}

- (WDFixedWidthHeight)fixedWidth
{
    if(!_fixedWidth) {
        __weak typeof(self) weakSelf = self;
        _fixedWidth = ^{
            __strong typeof(weakSelf) strongSelf = weakSelf;
            strongSelf->_fixedWidthConstraint = [[WDLayoutConstraint alloc] init];
            return weakSelf;
        };
    }
    return _fixedWidth;
}

- (WDFixedWidthHeight)fixedHeight
{
    if(!_fixedHeight) {
        __weak typeof(self) weakSelf = self;
        _fixedHeight = ^{
            __strong typeof(weakSelf) strongSelf = weakSelf;
            strongSelf->_fixedHeightConstraint = [[WDLayoutConstraint alloc] init];
            return weakSelf;
        };
    }
    return _fixedHeight;
}

- (WDWidthHeight)widthHeightBlockWithKey:(NSString *)key
{
    __weak typeof(self) weakSelf = self;
    return ^WDViewLayout *(CGFloat value) {
        WDLayoutConstraint *constraint = [WDLayoutConstraint constraintWithFirstView:weakSelf.needAutoLayoutView secondView:weakSelf.needAutoLayoutView constant:value];
        [weakSelf setValue:constraint forKey:key];
        return weakSelf;
    };
}

- (WDWidthHeight)maxWidth
{
    if(!_maxWidth) {
        _maxWidth = [self limitWidhHeightBlockWithKey:@"limitMaxWidth"];
    }
    return _maxWidth;
}

- (WDWidthHeight)maxHeight
{
    if(!_maxHeight) {
        _maxHeight = [self limitWidhHeightBlockWithKey:@"limitMaxHeight"];
    }
    return _maxHeight;
}

- (WDWidthHeight)minWidth
{
    if(!_minWidth) {
        _minWidth = [self limitWidhHeightBlockWithKey:@"limitMinWidth"];
    }
    return _minWidth;
}

- (WDWidthHeight)minHeight
{
    if(!_minHeight) {
        _minHeight = [self limitWidhHeightBlockWithKey:@"limitMinHeight"];
    }
    return _minHeight;
}

- (WDWidthHeight)autoresizingMaxWidth
{
    if(!_autoresizingMaxWidth) {
        _autoresizingMaxWidth = [self limitWidhHeightBlockWithKey:@"limitAutoresizingMaxWidth"];
    }
    return _autoresizingMaxWidth;
}

- (WDWidthHeight)limitWidhHeightBlockWithKey:(NSString *)key
{
    __weak typeof(self) weakSelf = self;
    return ^WDViewLayout *(CGFloat value) {
        [weakSelf setValue:@(value) forKey:key];
        return weakSelf;
    };
}

- (WDWidthHeightRatioToView)widthRatioToView
{
    if(!_widthRatioToView) {
        _widthRatioToView = [self widthHeightRatioToViewBlockWithKey:@"widthRatioToViewConstraint"];
    }
    return _widthRatioToView;
}

- (WDWidthHeightRatioToView)heightRatioToView
{
    if(!_heightRatioToView) {
        _heightRatioToView = [self widthHeightRatioToViewBlockWithKey:@"heightRatioToViewConstraint"];
    }
    return _heightRatioToView;
}

- (WDWidthHeightRatioToView)widthHeightRatioToViewBlockWithKey:(NSString *)key
{
    __weak typeof(self) weakSelf = self;
    return ^WDViewLayout *(UIView *toView,CGFloat value) {
        WDLayoutConstraint *constraint = [WDLayoutConstraint constraintWithFirstView:weakSelf.needAutoLayoutView secondView:toView constant:0 multiplier:value];
        [weakSelf setValue:constraint forKey:key];
        return weakSelf;
    };
}

- (WDSpaceToSuperView)spaceToSuperView
{
    __weak typeof(self) weakSelf = self;
    if(!_spaceToSuperView) {
        _spaceToSuperView = ^WDViewLayout *(UIEdgeInsets edgeInsets) {
            weakSelf.leftSpaceToView(weakSelf.needAutoLayoutView.superview,edgeInsets.left).topSpaceToView(weakSelf.needAutoLayoutView.superview,edgeInsets.top).rightSpaceToView(weakSelf.needAutoLayoutView.superview,edgeInsets.right).bottomSpaceToView(weakSelf.needAutoLayoutView.superview,edgeInsets.bottom);
            return weakSelf;
        };
    }
    return _spaceToSuperView;
}

- (WDAutoHeightRatio)autoHeightRatio
{
    if(!_autoHeightRatio) {
        __weak typeof(self) weakSelf = self;
        _autoHeightRatio = ^WDViewLayout *(CGFloat value) {
            [weakSelf setValue:@(value) forKey:@"heightRatio"];
            return weakSelf;
        };
    }
    return _autoHeightRatio;
}

- (void)startLayout
{
    UIView *view = self.needAutoLayoutView;
    if(!view) return;
    
    if(self.widthConstraint && self.widthConstraint.firstView == view && self.widthConstraint.secondView == view) {
        view.wd_width = self.widthConstraint.constant;
        if(self.limitExtrasWidth) {
            view.wd_width += [self.limitExtrasWidth floatValue];
        }
        self.widthFix = YES;
    } else if(self.widthRatioToViewConstraint && self.widthRatioToViewConstraint.firstView == view) {
        view.wd_width = self.widthRatioToViewConstraint.secondView.wd_width * self.widthRatioToViewConstraint.multiplier;
        if(self.limitExtrasWidth) {
            view.wd_width += [self.limitExtrasWidth floatValue];
        }
        self.widthFix = YES;
    }
    
    if(self.heightConstraint && self.heightConstraint.firstView == view && self.heightConstraint.secondView == view) {
        view.wd_height = self.heightConstraint.constant;
        if(self.limitExtrasHeight) {
            view.wd_height += [self.limitExtrasHeight floatValue];
        }
        self.heightFix = YES;
    } else if(self.heightRatioToViewConstraint && self.heightRatioToViewConstraint.firstView == view) {
        view.wd_height = self.heightRatioToViewConstraint.secondView.wd_height * self.heightRatioToViewConstraint.multiplier;
        if(self.limitExtrasHeight) {
            view.wd_height += [self.limitExtrasHeight floatValue];
        }
        self.heightFix = YES;
    }
    
    if(self.limitAutoresizingMaxWidth) {
        if([view isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)view;
            CGFloat maxWidth = self.limitAutoresizingMaxWidth.floatValue > 0 ?  self.limitAutoresizingMaxWidth.floatValue: MAXFLOAT;
            if(label.text.length) {
                if(!label.isAttributedContent) {
                    CGSize size = [label.text boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : label.font} context:nil].size;
                    label.wd_width = ceilf(size.width);
                    if(self.limitExtrasWidth) {
                        label.wd_width += [self.limitExtrasWidth floatValue];
                    }
                    self.widthFix = YES;
                } else {
                    [label sizeToFit];
                    if(label.wd_width > maxWidth) {
                        label.wd_width = maxWidth;
                    }
                    if(self.limitExtrasWidth) {
                        label.wd_width += [self.limitExtrasWidth floatValue];
                    }
                    self.widthFix = YES;
                }
            } else {
                label.wd_width = 0;
                if(self.limitExtrasWidth) {
                    label.wd_width += [self.limitExtrasWidth floatValue];
                }
            }
        }
    }
    
    if(self.leftConstraint && self.leftConstraint.firstView == view) {
        if(view.superview == self.leftConstraint.secondView) {
            view.wd_left = self.leftConstraint.constant;
        } else {
            view.wd_left = self.leftConstraint.secondView.wd_right + self.leftConstraint.constant;
        }
    } else if(self.leftEqualConstraint && self.leftEqualConstraint.firstView == view) {
        if(view.superview == self.leftEqualConstraint.secondView) {
            view.wd_left = 0;
        } else {
            view.wd_left = self.leftEqualConstraint.secondView.wd_left;
        }
    } else if(self.leftEqualAndExtrasMarginConstraint && self.leftEqualAndExtrasMarginConstraint.firstView == view) {
        if(view.superview == self.leftEqualAndExtrasMarginConstraint.secondView) {
            view.wd_left = self.leftEqualAndExtrasMarginConstraint.constant;
        } else {
            view.wd_left = self.leftEqualAndExtrasMarginConstraint.secondView.wd_left + self.leftEqualAndExtrasMarginConstraint.constant;
        }
    } else if(self.centerXEqualConstraint && self.centerXEqualConstraint.firstView == view) {
        if(view.superview == self.centerXEqualConstraint.secondView) {
            view.wd_centerX = self.centerXEqualConstraint.secondView.wd_width * 0.5;
        } else {
            view.wd_centerX = self.centerXEqualConstraint.secondView.wd_centerX;
        }
    } else if(self.centerXEqualAndExtrasMarginConstraint && self.centerXEqualAndExtrasMarginConstraint.firstView == view) {
        if(view.superview == self.centerXEqualAndExtrasMarginConstraint.secondView) {
            view.wd_centerX = self.centerXEqualAndExtrasMarginConstraint.secondView.wd_width * 0.5 + self.centerXEqualAndExtrasMarginConstraint.constant;
        } else {
            view.wd_centerX = self.centerXEqualAndExtrasMarginConstraint.secondView.wd_centerX + self.centerXEqualAndExtrasMarginConstraint.constant;
        }
    }
    
    [self adjustHorizontalConstraint];
    if(self.heightRatio && view.wd_width > 0) {
        CGFloat value = [self.heightRatio floatValue];
        self.heightFix = YES;
        if(value > 0) {
            view.wd_height = ceilf(view.wd_width * value);
            if(self.limitExtrasHeight) {
                view.wd_height += [self.limitExtrasHeight floatValue];
            }
        } else {
            if([view isKindOfClass:[UILabel class]]) {
                UILabel *label = (UILabel *)view;
                if(self.topConstraint || self.topEqualConstraint) {
                    self.bottomConstraint = nil;
                    self.bottomEqualConstraint = nil;
                }
                label.numberOfLines = 0;
                if(label.text.length) {
                    if(!label.isAttributedContent) {
                        CGRect rect = [label.text boundingRectWithSize:CGSizeMake(view.wd_width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : label.font} context:nil];
                        view.wd_height = ceilf(rect.size.height);
                        if(self.limitExtrasHeight) {
                            view.wd_height += [self.limitExtrasHeight floatValue];
                        }
                    } else {
                        [label sizeToFit];
                        if(self.limitExtrasHeight) {
                            view.wd_height += [self.limitExtrasHeight floatValue];
                        }
                    }
                } else {
                    view.wd_height = 0;
                    if(self.limitExtrasHeight) {
                        view.wd_height += [self.limitExtrasHeight floatValue];
                    }
                }
            } else {
                view.wd_height = 0;
                if(self.limitExtrasHeight) {
                    view.wd_height += [self.limitExtrasHeight floatValue];
                }
            }
        }
    }
    
    if(self.topConstraint && self.topConstraint.firstView == view) {
        if(view.superview == self.topConstraint.secondView) {
            view.wd_top = self.topConstraint.constant;
        } else {
            view.wd_top = self.topConstraint.secondView.wd_bottom + self.topConstraint.constant;
        }
    } else if(self.topEqualConstraint && self.topEqualConstraint.firstView == view) {
        if(view.superview == self.topEqualConstraint.secondView) {
            view.wd_top = 0;
        } else {
            view.wd_top = self.topEqualConstraint.secondView.wd_top;
        }
    } else if(self.topEqualAndExtrasMarginConstraint && self.topEqualAndExtrasMarginConstraint.firstView == view) {
        if(view.superview == self.topEqualAndExtrasMarginConstraint.secondView) {
            view.wd_top = self.topEqualAndExtrasMarginConstraint.constant;
        } else {
            view.wd_top = self.topEqualAndExtrasMarginConstraint.secondView.wd_top + self.topEqualAndExtrasMarginConstraint.constant;
        }
    } else if(self.centerYEqualConstraint && self.centerYEqualConstraint.firstView == view) {
        if(view.superview == self.centerYEqualConstraint.secondView) {
            view.wd_centerY = self.centerYEqualConstraint.secondView.wd_height * 0.5;
        } else {
            view.wd_centerY = self.centerYEqualConstraint.secondView.wd_centerY;
        }
    } else if(self.centerYEqualAndExtrasMarginConstraint && self.centerYEqualAndExtrasMarginConstraint.firstView == view) {
        if(view.superview == self.centerYEqualAndExtrasMarginConstraint.secondView) {
            view.wd_centerY = self.centerYEqualAndExtrasMarginConstraint.secondView.wd_height * 0.5 + self.centerYEqualAndExtrasMarginConstraint.constant;
        } else {
            view.wd_centerY = self.centerYEqualAndExtrasMarginConstraint.secondView.wd_centerY + self.centerYEqualAndExtrasMarginConstraint.constant;
        }
    }
    
    [self adjustVerticalConstraint];
    
    if(self.limitMaxWidth && [self.limitMaxWidth floatValue] < view.wd_width) {
        view.wd_width = [self.limitMaxWidth floatValue];
    }
    if(self.limitMinWidth && [self.limitMinWidth floatValue] > view.wd_width) {
        view.wd_width = [self.limitMinWidth floatValue];
    }
    
    if(self.limitMaxHeight && [self.limitMaxHeight floatValue] < view.wd_height) {
        view.wd_height = [self.limitMaxHeight floatValue];
    }
    
    if(self.limitMinHeight && [self.limitMinHeight floatValue] > view.wd_height) {
        view.wd_height = [self.limitMinHeight floatValue];
    }
    if(self.widthEqualHeightConstraint) {
        view.wd_width = view.wd_height;
    }
    if(self.heightEqualWidthConstraint) {
        view.wd_height = view.wd_width;
    }
    if(view.wd_didFinishedAutoLayout) {
        view.wd_didFinishedAutoLayout(view.frame);
    }
    if(view.wd_bottomViewArray || view.wd_rightViewArray) {
        [view layoutSubviews];
    }
}

+ (void)setupWidthEqualSubViewsWithSubviewsArray:(NSArray *)subviewsArray
{
    CGFloat superViewW = ((UIView *)[subviewsArray firstObject]).superview.wd_width;
    if(!superViewW) return;
    CGFloat totalMargin = 0;
    for(UIView *view in subviewsArray) {
        WDViewLayout *layout = view.wd_layout;
        CGFloat left = layout.leftConstraint.constant;
        CGFloat right = layout.rightConstraint.constant;
        totalMargin += left + right;
    }
    
    for(UIView *view in subviewsArray) {
        CGFloat viewW = (superViewW - totalMargin) / subviewsArray.count;
        view.wd_width = viewW;
        view.wd_layout.widthFix = YES;
    }
    
}

+ (void)setupHeightEqualSubViewsWithSubviewsArray:(NSArray *)subviewsArray
{
    CGFloat superViewH = ((UIView *)[subviewsArray firstObject]).superview.wd_height;
    if(!superViewH) return;
    CGFloat totalMargin = 0;
    for(UIView *view in subviewsArray) {
        WDViewLayout *layout = view.wd_layout;
        CGFloat top = layout.topConstraint.constant;
        CGFloat bottom = layout.bottomConstraint.constant;
        totalMargin += top + bottom;
        
    }
    for(UIView *view in subviewsArray) {
        CGFloat viewH = (superViewH - totalMargin) / subviewsArray.count;
        view.wd_height = viewH;
        view.wd_layout.heightFix = YES;
    }
}

- (void)adjustHorizontalConstraint
{
    UIView *view = self.needAutoLayoutView;
    if(!view) return;
    if(self.rightConstraint && self.rightConstraint.firstView == view) {
        if(view.superview == self.rightConstraint.secondView) {
            if(!self.isWidthFix) {
                view.wd_width = self.rightConstraint.secondView.wd_width - self.rightConstraint.constant - view.wd_left;
                if(self.limitExtrasWidth) {
                    view.wd_width += [self.limitExtrasWidth floatValue];
                }
            }
            view.wd_right = self.rightConstraint.secondView.wd_width - self.rightConstraint.constant;
        } else {
            if(!self.isWidthFix) {
                view.wd_width = self.rightConstraint.secondView.wd_left - self.rightConstraint.constant - view.wd_left;
                if(self.limitExtrasWidth) {
                    view.wd_width += [self.limitExtrasWidth floatValue];
                }
            }
            view.wd_right = self.rightConstraint.secondView.wd_left - self.rightConstraint.constant;
        }
    } else if(self.rightEqualConstraint && self.rightEqualConstraint.firstView == view) {
        if(self.rightEqualConstraint.secondView == view.superview) {
            if(!self.isWidthFix) {
                view.wd_width = self.rightEqualConstraint.secondView.wd_width - view.wd_left;
                if(self.limitExtrasWidth) {
                    view.wd_width += [self.limitExtrasWidth floatValue];
                }
            }
            view.wd_right = self.rightEqualConstraint.secondView.wd_width;
        } else {
            if(!self.isWidthFix) {
                view.wd_width = self.rightEqualConstraint.secondView.wd_right - view.wd_left;
                if(self.limitExtrasWidth) {
                    view.wd_width += [self.limitExtrasWidth floatValue];
                }
            }
            view.wd_right = self.rightEqualConstraint.secondView.wd_right;
        }
    } else if(self.rightEqualAndExtrasMarginConstraint && self.rightEqualAndExtrasMarginConstraint.firstView == view) {
        if(self.rightEqualAndExtrasMarginConstraint.secondView == view.superview) {
            if(!self.isWidthFix) {
                view.wd_width = self.rightEqualAndExtrasMarginConstraint.secondView.wd_width -self.rightEqualAndExtrasMarginConstraint.constant - view.wd_left;
                if(self.limitExtrasWidth) {
                    view.wd_width += [self.limitExtrasWidth floatValue];
                }
            }
            view.wd_right = self.rightEqualAndExtrasMarginConstraint.secondView.wd_width -self.rightEqualAndExtrasMarginConstraint.constant;
        } else {
            if(!self.isWidthFix) {
                view.wd_width = self.rightEqualAndExtrasMarginConstraint.secondView.wd_right -self.rightEqualAndExtrasMarginConstraint.constant - view.wd_left;
                if(self.limitExtrasWidth) {
                    view.wd_width += [self.limitExtrasWidth floatValue];
                }
            }
            view.wd_right = self.rightEqualAndExtrasMarginConstraint.secondView.wd_right - self.rightEqualAndExtrasMarginConstraint.constant;
        }
    }
}

- (void)adjustVerticalConstraint
{
    UIView *view = self.needAutoLayoutView;
    if(!view) return;
    if(self.bottomConstraint && self.bottomConstraint.firstView == view) {
        if(view.superview == self.bottomConstraint.secondView) {
            if(!self.isHeightFix) {
                view.wd_height = self.bottomConstraint.secondView.wd_height - self.bottomConstraint.constant - view.wd_top;
                if(self.limitExtrasHeight) {
                    view.wd_height += [self.limitExtrasHeight floatValue];
                }
            }
            view.wd_bottom = self.bottomConstraint.secondView.wd_height - self.bottomConstraint.constant;
        } else {
            if(!self.isHeightFix) {
                view.wd_height = self.bottomConstraint.secondView.wd_top - self.bottomConstraint.constant - view.wd_top;
                if(self.limitExtrasHeight) {
                    view.wd_height += [self.limitExtrasHeight floatValue];
                }
            }
            view.wd_bottom = self.bottomConstraint.secondView.wd_top - self.bottomConstraint.constant;
        }
    } else if(self.bottomEqualConstraint && self.bottomEqualConstraint.firstView == view) {
        if(view.superview == self.bottomEqualConstraint.secondView) {
            if(!self.isHeightFix) {
                view.wd_height = self.bottomEqualConstraint.secondView.wd_height - view.wd_top;
                if(self.limitExtrasHeight) {
                    view.wd_height += [self.limitExtrasHeight floatValue];
                }
            }
            view.wd_bottom = self.bottomEqualConstraint.secondView.wd_height;
        } else {
            if(!self.isHeightFix) {
                view.wd_height = self.bottomEqualConstraint.secondView.wd_bottom - view.wd_top;
                if(self.limitExtrasHeight) {
                    view.wd_height += [self.limitExtrasHeight floatValue];
                }
            }
            view.wd_bottom = self.bottomEqualConstraint.secondView.wd_bottom;
        }
    } else if(self.bottomEqualAndExtrasMarginConstraint && self.bottomEqualAndExtrasMarginConstraint.firstView == view) {
        if(view.superview == self.bottomEqualAndExtrasMarginConstraint.secondView) {
            if(!self.isHeightFix) {
                view.wd_height = self.bottomEqualAndExtrasMarginConstraint.secondView.wd_height - self.bottomEqualAndExtrasMarginConstraint.constant  - view.wd_top;
                if(self.limitExtrasHeight) {
                    view.wd_height += [self.limitExtrasHeight floatValue];
                }
            }
            view.wd_bottom = self.bottomEqualAndExtrasMarginConstraint.secondView.wd_height - self.bottomEqualAndExtrasMarginConstraint.constant;
        } else {
            if(!self.isHeightFix) {
                view.wd_height = self.bottomEqualAndExtrasMarginConstraint.secondView.wd_bottom - self.bottomEqualAndExtrasMarginConstraint.constant - view.wd_top;
                if(self.limitExtrasHeight) {
                    view.wd_height += [self.limitExtrasHeight floatValue];
                }
            }
            view.wd_bottom = self.bottomEqualAndExtrasMarginConstraint.secondView.wd_bottom - self.bottomEqualAndExtrasMarginConstraint.constant;
        }
    }
}

@end

