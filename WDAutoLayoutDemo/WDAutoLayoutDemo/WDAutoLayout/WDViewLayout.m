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

@end

@implementation WDViewLayout

@synthesize leftSpaceToView = _leftSpaceToView;
@synthesize leftSpaceToViewKeepWidth = _leftSpaceToViewKeepWidth;
@synthesize rightSpaceToView = _rightSpaceToView;
@synthesize rightSpaceToViewKeepWidth = _rightSpaceToViewKeepWidth;
@synthesize topSpaceToView = _topSpaceToView;
@synthesize topSpaceToViewKeepHeight = _topSpaceToViewKeepHeight;
@synthesize bottomSpaceToView = _bottomSpaceToView;
@synthesize bottomSpaceToViewKeepHeight = _bottomSpaceToViewKeepHeight;
@synthesize leftSpaceToSuperView = _leftSpaceToSuperView;
@synthesize leftSpaceToSuperViewKeepWidth = _leftSpaceToSuperViewKeepWidth;
@synthesize topSpaceToSuperView = _topSpaceToSuperView;
@synthesize topSpaceToSuperViewKeepHeight = _topSpaceToSuperViewkeepHeight;
@synthesize rightSpaceToSuperView = _rightSpaceToSuperView;
@synthesize rightSpaceToSuperViewKeepWidth = _rightSpaceToSuperViewKeepWidth;
@synthesize bottomSpaceToSuperView = _bottomSpaceToSuperView;
@synthesize bottomSpaceToSuperViewKeepHeight = _bottomSpaceToSuperViewKeepHeight;
@synthesize leftEqualToView = _leftEqualToView;
@synthesize leftEqualToViewKeepWidth = _leftEqualToViewKeepWidth;
@synthesize rightEqualToView = _rightEqualToView;
@synthesize rightEqualToViewKeepWidth = _rightEqualToViewKeepWidth;
@synthesize topEqualToView = _topEqualToView;
@synthesize topEqualToViewKeepHeight = _topEqualToViewKeepHeight;
@synthesize bottomEqualToView = _bottomEqualToView;
@synthesize bottomEqualToViewKeepHeight = _bottomEqualToViewKeepHeight;
@synthesize centerXEqualToView = _centerXEqualToView;
@synthesize centerXEqualToViewKeepWidth = _centerXEqualToViewKeepWidth;
@synthesize centerYEqualToView = _centerYEqualToView;
@synthesize centerYEqualToViewKeepHeight = _centerYEqualToViewKeepHeight;
@synthesize widthEqualToView = _widthEqualToView;
@synthesize widthEqualToViewKeepLeft = _widthEqualToViewKeepLeft;
@synthesize heightEqualToView = _heightEqualToView;
@synthesize heightEqualToViewKeepTop = _heightEqualToViewKeepTop;
@synthesize width = _width;
@synthesize widthKeepLeft = _widthKeepLeft;
@synthesize height = _height;
@synthesize heightKeepTop = _heightKeepTop;
@synthesize maxWidth = _maxWidth;
@synthesize maxHeight = _maxHeight;
@synthesize minWidth = _minWidth;
@synthesize minHeight = _minHeight;
@synthesize autoresizingMaxWidth = _autoresizingMaxWidth;
@synthesize autoresizingMaxWidthKeepLeft = _autoresizingMaxWidthKeepLeft;
@synthesize widthEqualHeight = _widthEqualHeight;
@synthesize widthEqualHeightKeepLeft = _widthEqualHeightKeepLeft;
@synthesize heightEqualWidth = _heightEqualWidth;
@synthesize heightEqualWidthKeepTop = _heightEqualWidthKeepTop;
@synthesize widthRatioToView = _widthRatioToView;
@synthesize widthRatioToViewKeepLeft = _widthRatioToViewKeepLeft;
@synthesize heightRatioToView = _heightRatioToView;
@synthesize heightRatioToViewKeepTop = _heightRatioToViewKeepTop;
@synthesize spaceToSuperView = _spaceToSuperView;
@synthesize autoHeightRatio = _autoHeightRatio;
@synthesize autoHeightRatioKeepTop = _autoHeightRatioKeepTop;
@synthesize extrasWidth = _extrasWidth;
@synthesize extrasHeight = _extrasHeight;
@synthesize leftEqualToViewAndExtrasMargin = _leftEqualToViewAndExtrasMargin;
@synthesize leftEqualToViewAndExtrasMarginKeepWidth = _leftEqualToViewAndExtrasMarginKeepWidth;
@synthesize topEqualToViewAndExtrasMargin = _topEqualToViewAndExtrasMargin;
@synthesize topEqualToViewAndExtrasMarginKeepHeight = _topEqualToViewAndExtrasMarginKeepHeight;
@synthesize rightEqualToViewAndExtrasMargin = _rightEqualToViewAndExtrasMargin;
@synthesize rightEqualToViewAndExtrasMarginKeepWidth = _rightEqualToViewAndExtrasMarginKeepWidth;
@synthesize bottomEqualToViewAndExtrasMargin = _bottomEqualToViewAndExtrasMargin;
@synthesize bottomEqualToViewAndExtrasMarginKeepHeight = _bottomEqualToViewAndExtrasMarginKeepHeight;
@synthesize centerXEqualToViewAndExtrasMargin = _centerXEqualToViewAndExtrasMargin;
@synthesize centerXEqualToViewAndExtrasMarginKeepWidth = _centerXEqualToViewAndExtrasMarginKeepWidth;
@synthesize centerYEqualToViewAndExtrasMargin = _centerYEqualToViewAndExtrasMargin;
@synthesize centerYEqualToViewAndExtrasMarginKeepHeight = _centerYEqualToViewAndExtrasMarginKeepHeight;
@synthesize leftEqualToSuperView = _leftEqualToSuperView;
@synthesize leftEqualToSuperViewKeepWidth = _leftEqualToSuperViewKeepWidth;
@synthesize topEqualToSuperView = _topEqualToSuperView;
@synthesize topEqualToSuperViewKeepHeight = _topEqualToSuperViewKeepHeight;
@synthesize rightEqualToSuperView = _rightEqualToSuperView;
@synthesize rightEqualToSuperViewKeepWidth = _rightEqualToSuperViewKeepWidth;
@synthesize bottomEqualToSuperView = _bottomEqualToSuperView;
@synthesize bottomEqualToSuperViewKeepHeight = _bottomEqualToSuperViewKeepHeight;
@synthesize leftEqualToSuperViewAndExtrasMargin = _leftEqualToSuperViewAndExtrasMargin;
@synthesize leftEqualToSuperViewAndExtrasMarginKeepWidth = _leftEqualToSuperViewAndExtrasMarginKeepWidth;
@synthesize topEqualToSuperViewAndExtrasMargin = _topEqualToSuperViewAndExtrasMargin;
@synthesize topEqualToSuperViewAndExtrasMarginKeepHeight = _topEqualToSuperViewAndExtrasMarginKeepHeight;
@synthesize rightEqualToSuperViewAndExtrasMargin = _rightEqualToSuperViewAndExtrasMargin;
@synthesize rightEqualToSuperViewAndExtrasMarginKeepWidth = _rightEqualToSuperViewAndExtrasMarginKeepWidth;
@synthesize bottomEqualToSuperViewAndExtrasMargin = _bottomEqualToSuperViewAndExtrasMargin;
@synthesize bottomEqualToSuperViewAndExtrasMarginKeepHeight = _bottomEqualToSuperViewAndExtrasMarginKeepHeight;
@synthesize centerXEqualToSuperViewAndExtrasMargin = _centerXEqualToSuperViewAndExtrasMargin;
@synthesize centerXEqualToSuperViewAndExtrasMarginKeepWidth = _centerXEqualToSuperViewAndExtrasMarginKeepWidth;
@synthesize centerYEqualToSuperViewAndExtrasMargin = _centerYEqualToSuperViewAndExtrasMargin;
@synthesize centerYEqualToSuperViewAndExtrasMarginKeepHeight = _centerYEqualToSuperViewAndExtrasMarginKeepHeight;
@synthesize centerXEqualToSuperView = _centerXEqualToSuperView;
@synthesize centerXEqualToSuperViewKeepWidth = _centerXEqualToSuperViewKeepWidth;
@synthesize centerYEqualToSuperView = _centerYEqualToSuperView;
@synthesize centerYEqualToSuperViewKeepHeight = _centerYEqualToSuperViewKeepHeight;
@synthesize fixedWidth = _fixedWidth;
@synthesize fixedHeight = _fixedHeight;
@synthesize heightSpaceToBottom = _heightSpaceToBottom;
@synthesize widthSpaceToRight = _widthSpaceToRight;

+ (instancetype)layoutWithNeedAutoLayoutView:(UIView *)view
{
    WDViewLayout *layout = [[WDViewLayout alloc] init];
    layout.needAutoLayoutView = view;
    return layout;
}

- (WDMarginToView)leftSpaceToView
{
    [self removeLeftConstraint];
    if(!_leftSpaceToView) {
        _leftSpaceToView = [self marginToViewBlockWithKey:@"leftConstraint"];
    }
    return _leftSpaceToView;
    
}

- (WDMarginToViewKeepWidthHeight)leftSpaceToViewKeepWidth
{
    if(!_leftSpaceToViewKeepWidth) {
        __weak typeof(self) weakSelf = self;
        _leftSpaceToViewKeepWidth = ^WDViewLayout *(UIView *toView,CGFloat value,BOOL keep) {
            weakSelf.leftSpaceToView(toView,value);
            BOOL hasRightConstraint = [weakSelf hasRightConstraint];
            BOOL hasWidthConstraint = [weakSelf hasWidthConstraint];
            if(hasRightConstraint && hasWidthConstraint) {
                if(keep) {
                    [weakSelf removeRightConstraint];
                } else {
                    [weakSelf removeWidthConstraint];
                }
            }
            return weakSelf;
        };
    }
    return _leftSpaceToViewKeepWidth;
}

- (WDMarginToView)topSpaceToView
{
    [self removeTopConstraint];
    if(!_topSpaceToView) {
        _topSpaceToView = [self marginToViewBlockWithKey:@"topConstraint"];
    }
    return _topSpaceToView;
}

- (WDMarginToViewKeepWidthHeight)topSpaceToViewKeepHeight
{
    if(!_topSpaceToViewKeepHeight) {
        __weak typeof(self) weakSelf = self;
        _topSpaceToViewKeepHeight = ^WDViewLayout *(UIView *toView,CGFloat value,BOOL keep) {
            weakSelf.topSpaceToView(toView,value);
            BOOL hasBottomConstraint = [weakSelf hasBottomConstraint];
            BOOL hasHeightConstraint = [weakSelf hasHeightConstraint];
            if(hasHeightConstraint && hasBottomConstraint) {
                if(keep) {
                    [weakSelf removeBottomConstraint];
                } else {
                    [weakSelf removeHeightConstraint];
                }
            }
            return weakSelf;
        };
    }
    return _topSpaceToViewKeepHeight;
}

- (WDMarginToView)rightSpaceToView
{
    [self removeRightConstraint];
    if(!_rightSpaceToView) {
        _rightSpaceToView = [self marginToViewBlockWithKey:@"rightConstraint"];
    }
    return _rightSpaceToView;
}

- (WDMarginToViewKeepWidthHeight)rightSpaceToViewKeepWidth
{
    if(!_rightSpaceToViewKeepWidth) {
        __weak typeof(self) weakSelf = self;
        _rightSpaceToViewKeepWidth = ^WDViewLayout *(UIView *toView,CGFloat value,BOOL keep) {
            weakSelf.rightSpaceToView(toView,value);
            BOOL hasWidthConstraint = [weakSelf hasWidthConstraint];
            BOOL hasLeftConstraint = [weakSelf hasLeftConstraint];
            if(hasWidthConstraint && hasLeftConstraint) {
                if(keep) {
                    [weakSelf removeLeftConstraint];
                } else {
                    [weakSelf removeWidthConstraint];
                }
            }
            return weakSelf;
        };
    }
    return _rightSpaceToViewKeepWidth;
}

- (WDMarginToView)bottomSpaceToView
{
    [self removeBottomConstraint];
    if(!_bottomSpaceToView) {
        _bottomSpaceToView = [self marginToViewBlockWithKey:@"bottomConstraint"];
    }
    return _bottomSpaceToView;
}

- (WDMarginToViewKeepWidthHeight)bottomSpaceToViewKeepHeight
{
    if(!_bottomSpaceToViewKeepHeight) {
        __weak typeof (self) weakSelf = self;
        _bottomSpaceToViewKeepHeight = ^WDViewLayout *(UIView *toView,CGFloat value,BOOL keep) {
            weakSelf.bottomSpaceToView(toView,value);
            BOOL hasTopConstraint = [weakSelf hasTopConstraint];
            BOOL hasHeightConstraint = [weakSelf hasHeightConstraint];
            if(hasHeightConstraint && hasTopConstraint) {
                if(keep) {
                    [weakSelf removeTopConstraint];
                } else {
                    [weakSelf removeHeightConstraint];
                }
            }
            return weakSelf;
        };
    }
    return _bottomSpaceToViewKeepHeight;
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

- (WDMarginToSuperViewKeepWidthHeight)leftSpaceToSuperViewKeepWidth
{
    if(!_leftSpaceToSuperViewKeepWidth) {
        __weak typeof(self) weakSelf = self;
        _leftSpaceToSuperViewKeepWidth = ^WDViewLayout *(CGFloat value,BOOL keep) {
            weakSelf.leftSpaceToViewKeepWidth(weakSelf.needAutoLayoutView.superview,value,keep);
            return weakSelf;
        };
    }
    return _leftSpaceToSuperViewKeepWidth;
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

- (WDMarginToSuperViewKeepWidthHeight)topSpaceToSuperViewKeepHeight
{
    if(!_topSpaceToSuperViewkeepHeight) {
        __weak typeof(self) weakSelf = self;
        _topSpaceToSuperViewkeepHeight = ^WDViewLayout *(CGFloat value,BOOL keep) {
            weakSelf.topSpaceToViewKeepHeight(weakSelf.needAutoLayoutView.superview,value,keep);
            return weakSelf;
        };
    }
    return _topSpaceToSuperViewkeepHeight;
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

- (WDMarginToSuperViewKeepWidthHeight)rightSpaceToSuperViewKeepWidth
{
    if(!_rightSpaceToSuperViewKeepWidth) {
        __weak typeof(self) weakSelf = self;
        _rightSpaceToSuperViewKeepWidth = ^WDViewLayout *(CGFloat value,BOOL keep) {
            weakSelf.rightSpaceToViewKeepWidth(weakSelf.needAutoLayoutView.superview,value,keep);
            return weakSelf;
        };
    }
    return _rightSpaceToSuperViewKeepWidth;
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

- (WDMarginToSuperViewKeepWidthHeight)bottomSpaceToSuperViewKeepHeight
{
    if(!_bottomSpaceToSuperViewKeepHeight) {
        __weak typeof(self) weakSelf = self;
        _bottomSpaceToSuperViewKeepHeight = ^WDViewLayout *(CGFloat value,BOOL keep) {
            weakSelf.bottomSpaceToViewKeepHeight(weakSelf.needAutoLayoutView.superview,value,keep);
            return weakSelf;
        };
    }
    return _bottomSpaceToSuperViewKeepHeight;
}

- (WDMarginEqualToView)leftEqualToView
{
    [self removeLeftConstraint];
    if(!_leftEqualToView) {
        _leftEqualToView = [self marginEqualToViewBlockWithKey:@"leftEqualConstraint"];
    }
    return _leftEqualToView;
}

- (WDMarginEqualToViewKeepWidthHeight)leftEqualToViewKeepWidth
{
    if(!_leftEqualToViewKeepWidth) {
        __weak typeof(self) weakSelf = self;
        _leftEqualToViewKeepWidth = ^WDViewLayout *(UIView *toView,BOOL keep) {
            weakSelf.leftEqualToView(toView);
            BOOL hasRightConstraint = [weakSelf hasRightConstraint];
            BOOL hasWidthConstraint = [weakSelf hasWidthConstraint];
            if(hasRightConstraint && hasWidthConstraint) {
                if(keep) {
                    [weakSelf removeRightConstraint];
                } else {
                    [weakSelf removeWidthConstraint];
                }
            }
            return weakSelf;
        };
    }
    return _leftEqualToViewKeepWidth;
}

- (WDMarginEqualToView)topEqualToView
{
    [self removeTopConstraint];
    if(!_topEqualToView) {
        _topEqualToView = [self marginEqualToViewBlockWithKey:@"topEqualConstraint"];
    }
    return _topEqualToView;
}

- (WDMarginEqualToViewKeepWidthHeight)topEqualToViewKeepHeight
{
    if(!_topEqualToViewKeepHeight) {
        __weak typeof(self) weakSelf = self;
        _topEqualToViewKeepHeight = ^WDViewLayout *(UIView *toView,BOOL keep) {
            weakSelf.topEqualToView(toView);
            BOOL hasHeightConstraint = [weakSelf hasHeightConstraint];
            BOOL hasBottomConstraint = [weakSelf hasBottomConstraint];
            if(hasHeightConstraint && hasBottomConstraint) {
                if(keep) {
                    [weakSelf removeBottomConstraint];
                } else {
                    [weakSelf removeHeightConstraint];
                }
            }
            return weakSelf;
        };
    }
    return _topEqualToViewKeepHeight;
}

- (WDMarginEqualToView)rightEqualToView
{
    [self removeRightConstraint];
    if(!_rightEqualToView) {
        _rightEqualToView = [self marginEqualToViewBlockWithKey:@"rightEqualConstraint"];
    }
    return _rightEqualToView;
}

- (WDMarginEqualToViewKeepWidthHeight)rightEqualToViewKeepWidth
{
    if(!_rightEqualToViewKeepWidth) {
        __weak typeof(self) weakSelf = self;
        _rightEqualToViewKeepWidth = ^WDViewLayout *(UIView *toView,BOOL keep) {
            weakSelf.rightEqualToView(toView);
            BOOL hasLeftConstraint = [weakSelf hasLeftConstraint];
            BOOL hasWidthConstraint = [weakSelf hasWidthConstraint];
            if(hasLeftConstraint && hasWidthConstraint) {
                if(keep) {
                    [weakSelf removeLeftConstraint];
                } else {
                    [weakSelf removeWidthConstraint];
                }
            }
            return weakSelf;
        };
    }
    return _rightEqualToViewKeepWidth;
}

- (WDMarginEqualToView)bottomEqualToView
{
    [self removeBottomConstraint];
    if(!_bottomEqualToView) {
        _bottomEqualToView = [self marginEqualToViewBlockWithKey:@"bottomEqualConstraint"];
    }
    return _bottomEqualToView;
}

- (WDMarginEqualToViewKeepWidthHeight)bottomEqualToViewKeepHeight
{
    if(!_bottomEqualToViewKeepHeight) {
        __weak typeof(self) weakSelf = self;
        _bottomEqualToViewKeepHeight =  ^WDViewLayout *(UIView *toView,BOOL keep) {
            weakSelf.bottomEqualToView(toView);
            BOOL hasTopConstraint = [weakSelf hasTopConstraint];
            BOOL hasHeightConstraint = [weakSelf hasHeightConstraint];
            if(hasTopConstraint && hasHeightConstraint) {
                if(keep) {
                    [weakSelf removeTopConstraint];
                } else {
                    [weakSelf removeHeightConstraint];
                }
            }
            return weakSelf;
        };
    }
    return _bottomEqualToViewKeepHeight;
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

- (WDMarginEqualToSuperViewKeepWidthHeight)leftEqualToSuperViewKeepWidth
{
    if(!_leftEqualToSuperViewKeepWidth) {
        __weak typeof(self) weakSelf = self;
        _leftEqualToSuperViewKeepWidth = ^WDViewLayout *(BOOL keep) {
            weakSelf.leftEqualToViewKeepWidth(weakSelf.needAutoLayoutView.superview,keep);
            return weakSelf;
        };
    }
    return _leftEqualToSuperViewKeepWidth;
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

- (WDMarginEqualToSuperViewKeepWidthHeight)topEqualToSuperViewKeepHeight
{
    if(!_topEqualToSuperViewKeepHeight) {
        __weak typeof(self) weakSelf = self;
        _topEqualToSuperViewKeepHeight = ^WDViewLayout *(BOOL keep) {
            weakSelf.topEqualToViewKeepHeight(weakSelf.needAutoLayoutView.superview,keep);
            return weakSelf;
        };
    }
    return _topEqualToSuperViewKeepHeight;
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

- (WDMarginEqualToSuperViewKeepWidthHeight)rightEqualToSuperViewKeepWidth
{
    if(!_rightEqualToSuperViewKeepWidth) {
        __weak typeof(self) weakSelf = self;
        _rightEqualToSuperViewKeepWidth = ^WDViewLayout *(BOOL keep) {
            weakSelf.rightEqualToViewKeepWidth(weakSelf.needAutoLayoutView.superview,keep);
            return weakSelf;
        };
    }
    return _rightEqualToSuperViewKeepWidth;
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

- (WDMarginEqualToSuperViewKeepWidthHeight)bottomEqualToSuperViewKeepHeight
{
    if(!_bottomEqualToSuperViewKeepHeight) {
        __weak typeof(self) weakSelf = self;
        _bottomEqualToSuperViewKeepHeight = ^WDViewLayout *(BOOL keep) {
            weakSelf.bottomEqualToViewKeepHeight(weakSelf.needAutoLayoutView.superview,keep);
            return weakSelf;
        };
    }
    return _bottomEqualToSuperViewKeepHeight;
}

- (WDMarginEqualToView)centerXEqualToView
{
    [self removeLeftConstraint];
    if(!_centerXEqualToView) {
        _centerXEqualToView = [self marginEqualToViewBlockWithKey:@"centerXEqualConstraint"];
    }
    return _centerXEqualToView;
}

- (WDMarginEqualToViewKeepWidthHeight)centerXEqualToViewKeepWidth
{
    if(!_centerXEqualToViewKeepWidth) {
        __weak typeof(self) weakSelf = self;
        _centerXEqualToViewKeepWidth = ^WDViewLayout *(UIView *toView,BOOL keep) {
            weakSelf.centerXEqualToView(toView);
            BOOL hasRightConstraint = [weakSelf hasRightConstraint];
            BOOL hasWidthConstraint = [weakSelf hasWidthConstraint];
            if(hasRightConstraint && hasWidthConstraint) {
                if(keep) {
                    [weakSelf removeRightConstraint];
                } else {
                    [weakSelf removeWidthConstraint];
                }
            }
            return weakSelf;
        };
    }
    return _centerXEqualToViewKeepWidth;
}

- (WDMarginEqualToView)centerYEqualToView
{
    [self removeTopConstraint];
    if(!_centerYEqualToView) {
        _centerYEqualToView = [self marginEqualToViewBlockWithKey:@"centerYEqualConstraint"];
    }
    return _centerYEqualToView;
}

- (WDMarginEqualToViewKeepWidthHeight)centerYEqualToViewKeepHeight
{
    if(!_centerYEqualToViewKeepHeight) {
        __weak typeof(self) weakSelf = self;
        _centerYEqualToViewKeepHeight = ^WDViewLayout *(UIView *toView,BOOL keep) {
            weakSelf.centerYEqualToView(toView);
            BOOL hasBottomConstraint = [weakSelf hasBottomConstraint];
            BOOL hasHeightConstraint = [weakSelf hasHeightConstraint];
            if(hasBottomConstraint && hasHeightConstraint) {
                if(keep) {
                    [weakSelf removeBottomConstraint];
                } else {
                    [weakSelf removeHeightConstraint];
                }
            }
            return weakSelf;
        };
    }
    return _centerYEqualToViewKeepHeight;
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

- (WDMarginEqualToSuperViewKeepWidthHeight)centerXEqualToSuperViewKeepWidth
{
    if(!_centerXEqualToSuperViewKeepWidth) {
        __weak typeof(self) weakSelf = self;
        _centerXEqualToSuperViewKeepWidth = ^WDViewLayout *(BOOL keep) {
            weakSelf.centerXEqualToViewKeepWidth(weakSelf.needAutoLayoutView.superview,keep);
            return weakSelf;
        };
    }
    return _centerXEqualToSuperViewKeepWidth;
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

- (WDMarginEqualToSuperViewKeepWidthHeight)centerYEqualToSuperViewKeepHeight
{
    if(!_centerYEqualToSuperViewKeepHeight) {
        __weak typeof(self) weakSelf = self;
        _centerYEqualToSuperViewKeepHeight = ^WDViewLayout *(BOOL keep) {
            weakSelf.centerYEqualToViewKeepHeight(weakSelf.needAutoLayoutView.superview,keep);
            return weakSelf;
        };
    }
    return _centerYEqualToSuperViewKeepHeight;
}

- (WDMarginEqualToViewAndExtrasMargin)leftEqualToViewAndExtrasMargin
{
    [self removeLeftConstraint];
    if(!_leftEqualToViewAndExtrasMargin) {
        _leftEqualToViewAndExtrasMargin = [self marginEqualToViewAndExtrasMarginBlockWithKey:@"leftEqualAndExtrasMarginConstraint"];
    }
    return _leftEqualToViewAndExtrasMargin;
}

- (WDMarginEqualToViewAndExtrasMarginKeepWidthHeight)leftEqualToViewAndExtrasMarginKeepWidth
{
    if(!_leftEqualToViewAndExtrasMarginKeepWidth) {
        __weak typeof(self) weakSelf = self;
        _leftEqualToViewAndExtrasMarginKeepWidth = ^WDViewLayout *(UIView *toView,CGFloat value,BOOL keep) {
            weakSelf.leftEqualToViewAndExtrasMargin(toView,value);
            BOOL hasRightConstraint = [weakSelf hasRightConstraint];
            BOOL hasWidthConstraint = [weakSelf hasWidthConstraint];
            if(hasRightConstraint && hasWidthConstraint) {
                if(keep) {
                    [weakSelf removeRightConstraint];
                } else {
                    [weakSelf removeWidthConstraint];
                }
            }
            return weakSelf;
        };
    }
    return _leftEqualToViewAndExtrasMarginKeepWidth;
}

- (WDMarginEqualToViewAndExtrasMargin)topEqualToViewAndExtrasMargin
{
    [self removeTopConstraint];
    if(!_topEqualToViewAndExtrasMargin) {
        _topEqualToViewAndExtrasMargin = [self marginEqualToViewAndExtrasMarginBlockWithKey:@"topEqualAndExtrasMarginConstraint"];
    }
    return _topEqualToViewAndExtrasMargin;
}

- (WDMarginEqualToViewAndExtrasMarginKeepWidthHeight)topEqualToViewAndExtrasMarginKeepHeight
{
    if(!_topEqualToViewAndExtrasMarginKeepHeight) {
        __weak typeof(self) weakSelf = self;
        _topEqualToViewAndExtrasMarginKeepHeight = ^WDViewLayout *(UIView *toView,CGFloat value,BOOL keep) {
            weakSelf.topEqualToViewAndExtrasMargin(toView,value);
            BOOL hasBottomConstraint = [weakSelf hasBottomConstraint];
            BOOL hasHeightConstraint = [weakSelf hasHeightConstraint];
            if(hasBottomConstraint && hasHeightConstraint) {
                if(keep) {
                    [weakSelf removeBottomConstraint];
                } else {
                    [weakSelf removeHeightConstraint];
                }
            }
            return weakSelf;
        };
    }
    return _topEqualToViewAndExtrasMarginKeepHeight;
}

- (WDMarginEqualToViewAndExtrasMargin)rightEqualToViewAndExtrasMargin
{
    [self removeRightConstraint];
    if(!_rightEqualToViewAndExtrasMargin) {
        _rightEqualToViewAndExtrasMargin = [self marginEqualToViewAndExtrasMarginBlockWithKey:@"rightEqualAndExtrasMarginConstraint"];
    }
    return _rightEqualToViewAndExtrasMargin;
}

- (WDMarginEqualToViewAndExtrasMarginKeepWidthHeight)rightEqualToViewAndExtrasMarginKeepWidth
{
    if(!_rightEqualToViewAndExtrasMarginKeepWidth) {
        __weak typeof(self) weakSelf = self;
        _rightEqualToViewAndExtrasMarginKeepWidth = ^WDViewLayout *(UIView *toView,CGFloat value,BOOL keep) {
            weakSelf.rightEqualToViewAndExtrasMargin(toView,value);
            BOOL hasLeftConstraint = [weakSelf hasLeftConstraint];
            BOOL hasWidthConstraint = [weakSelf hasWidthConstraint];
            if(hasLeftConstraint && hasWidthConstraint) {
                if(keep) {
                    [weakSelf removeLeftConstraint];
                } else {
                    [weakSelf removeWidthConstraint];
                }
            }
            return weakSelf;
        };
    }
    return _rightEqualToViewAndExtrasMarginKeepWidth;
}

- (WDMarginEqualToViewAndExtrasMargin)bottomEqualToViewAndExtrasMargin
{
    [self removeBottomConstraint];
    if(!_bottomEqualToViewAndExtrasMargin) {
        _bottomEqualToViewAndExtrasMargin = [self marginEqualToViewAndExtrasMarginBlockWithKey:@"bottomEqualAndExtrasMarginConstraint"];
    }
    return _bottomEqualToViewAndExtrasMargin;
}

- (WDMarginEqualToViewAndExtrasMarginKeepWidthHeight)bottomEqualToViewAndExtrasMarginKeepHeight
{
    if(!_bottomEqualToViewAndExtrasMarginKeepHeight) {
        __weak typeof(self) weakSelf = self;
        _bottomEqualToViewAndExtrasMarginKeepHeight = ^WDViewLayout *(UIView *toView,CGFloat value,BOOL keep) {
            weakSelf.bottomEqualToViewAndExtrasMargin(toView,value);
            BOOL hastopConstraint = [weakSelf hasTopConstraint];
            BOOL hasHeightConstraint = [weakSelf hasHeightConstraint];
            if(hastopConstraint && hasHeightConstraint) {
                if(keep) {
                    [weakSelf removeTopConstraint];
                } else {
                    [weakSelf removeHeightConstraint];
                }
            }
            return weakSelf;
        };
    }
    return _bottomEqualToViewAndExtrasMarginKeepHeight;
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

- (WDMarginEqualToSuperViewAndExtrasMarginKeepWidthHeight)leftEqualToSuperViewAndExtrasMarginKeepWidth
{
    if(!_leftEqualToSuperViewAndExtrasMarginKeepWidth) {
        __weak typeof(self) weakSelf = self;
        _leftEqualToSuperViewAndExtrasMarginKeepWidth = ^WDViewLayout *(CGFloat value,BOOL keep) {
            weakSelf.leftEqualToViewAndExtrasMarginKeepWidth(weakSelf.needAutoLayoutView.superview,value,keep);
            return weakSelf;
        };
    }
    return _leftEqualToSuperViewAndExtrasMarginKeepWidth;
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

- (WDMarginEqualToSuperViewAndExtrasMarginKeepWidthHeight)topEqualToSuperViewAndExtrasMarginKeepHeight
{
    if(!_topEqualToSuperViewAndExtrasMarginKeepHeight) {
        __weak typeof(self) weakSelf = self;
        _topEqualToSuperViewAndExtrasMarginKeepHeight = ^WDViewLayout *(CGFloat value,BOOL keep) {
            weakSelf.topEqualToViewAndExtrasMarginKeepHeight(weakSelf.needAutoLayoutView.superview,value,keep);
            return weakSelf;
        };
    }
    return _topEqualToSuperViewAndExtrasMarginKeepHeight;
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

- (WDMarginEqualToSuperViewAndExtrasMarginKeepWidthHeight)rightEqualToSuperViewAndExtrasMarginKeepWidth
{
    if(!_rightEqualToSuperViewAndExtrasMarginKeepWidth) {
        __weak typeof(self) weakSelf = self;
        _rightEqualToSuperViewAndExtrasMarginKeepWidth = ^WDViewLayout *(CGFloat value,BOOL keep) {
            weakSelf.rightEqualToViewAndExtrasMarginKeepWidth(weakSelf.needAutoLayoutView.superview,value,keep);
            return weakSelf;
        };
    }
    return _rightEqualToSuperViewAndExtrasMarginKeepWidth;
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

- (WDMarginEqualToSuperViewAndExtrasMarginKeepWidthHeight)bottomEqualToSuperViewAndExtrasMarginKeepHeight
{
    if(!_bottomEqualToSuperViewAndExtrasMarginKeepHeight) {
        __weak typeof(self) weakSelf = self;
        _bottomEqualToSuperViewAndExtrasMarginKeepHeight = ^WDViewLayout *(CGFloat value,BOOL keep) {
            weakSelf.bottomEqualToViewAndExtrasMarginKeepHeight(weakSelf.needAutoLayoutView.superview,value,keep);
            return weakSelf;
        };
    }
    return _bottomEqualToSuperViewAndExtrasMarginKeepHeight;
}

- (WDMarginEqualToViewAndExtrasMargin)centerXEqualToViewAndExtrasMargin
{
    [self removeLeftConstraint];
    if(!_centerXEqualToViewAndExtrasMargin) {
        _centerXEqualToViewAndExtrasMargin = [self marginEqualToViewAndExtrasMarginBlockWithKey:@"centerXEqualAndExtrasMarginConstraint"];
    }
    return _centerXEqualToViewAndExtrasMargin;
}

- (WDMarginEqualToViewAndExtrasMarginKeepWidthHeight)centerXEqualToViewAndExtrasMarginKeepWidth
{
    if(!_centerXEqualToViewAndExtrasMarginKeepWidth) {
        __weak typeof(self) weakSelf = self;
        _centerXEqualToViewAndExtrasMarginKeepWidth = ^WDViewLayout *(UIView *toView,CGFloat value,BOOL keep) {
            weakSelf.centerXEqualToViewAndExtrasMargin(toView,value);
            BOOL hasRightConstraint = [weakSelf hasRightConstraint];
            BOOL hasWidthConstraint = [weakSelf hasWidthConstraint];
            if(hasRightConstraint && hasWidthConstraint) {
                if(keep) {
                    [weakSelf removeRightConstraint];
                } else {
                    [weakSelf removeWidthConstraint];
                }
            }
            return weakSelf;
        };
    }
    return _centerXEqualToViewAndExtrasMarginKeepWidth;
}

- (WDMarginEqualToViewAndExtrasMargin)centerYEqualToViewAndExtrasMargin
{
    [self removeTopConstraint];
    if(!_centerYEqualToViewAndExtrasMargin) {
        _centerYEqualToViewAndExtrasMargin = [self marginEqualToViewAndExtrasMarginBlockWithKey:@"centerYEqualAndExtrasMarginConstraint"];
    }
    return _centerYEqualToViewAndExtrasMargin;
}

- (WDMarginEqualToViewAndExtrasMarginKeepWidthHeight)centerYEqualToViewAndExtrasMarginKeepHeight
{
    if(!_centerYEqualToViewAndExtrasMarginKeepHeight) {
        __weak typeof(self) weakSelf = self;
        _centerYEqualToViewAndExtrasMarginKeepHeight = ^WDViewLayout *(UIView *toView,CGFloat value,BOOL keep) {
            weakSelf.centerYEqualToViewAndExtrasMargin(toView,value);
            BOOL hasBottomConstraint = [weakSelf hasBottomConstraint];
            BOOL hasHeightConstraint = [weakSelf hasHeightConstraint];
            if(hasBottomConstraint && hasHeightConstraint) {
                if(keep) {
                    [weakSelf removeBottomConstraint];
                } else {
                    [weakSelf removeHeightConstraint];
                }
            }
            return weakSelf;
        };
    }
    return _centerYEqualToViewAndExtrasMarginKeepHeight;
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

- (WDMarginEqualToSuperViewAndExtrasMarginKeepWidthHeight)centerXEqualToSuperViewAndExtrasMarginKeepWidth
{
    if(!_centerXEqualToSuperViewAndExtrasMarginKeepWidth) {
        __weak typeof(self) weakSelf = self;
        _centerXEqualToSuperViewAndExtrasMarginKeepWidth = ^WDViewLayout *(CGFloat value,BOOL keep) {
            weakSelf.centerXEqualToViewAndExtrasMarginKeepWidth(weakSelf.needAutoLayoutView.superview,value,keep);
            return weakSelf;
        };
    }
    return _centerXEqualToSuperViewAndExtrasMarginKeepWidth;
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

- (WDMarginEqualToSuperViewAndExtrasMarginKeepWidthHeight)centerYEqualToSuperViewAndExtrasMarginKeepHeight
{
    if(!_centerYEqualToSuperViewAndExtrasMarginKeepHeight) {
        __weak typeof(self) weakSelf = self;
        _centerYEqualToSuperViewAndExtrasMarginKeepHeight = ^WDViewLayout *(CGFloat value,BOOL keep) {
            weakSelf.centerYEqualToViewAndExtrasMarginKeepHeight(weakSelf.needAutoLayoutView.superview,value,keep);
            return weakSelf;
        };
    }
    return _centerYEqualToSuperViewAndExtrasMarginKeepHeight;
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

- (WDWidthHeightEqualToViewKeepLeftTop)widthEqualToViewKeepLeft
{
    if(!_widthEqualToViewKeepLeft) {
        __weak typeof(self) weakSelf = self;
        _widthEqualToViewKeepLeft = ^WDViewLayout *(UIView *toView,BOOL keep) {
            weakSelf.widthRatioToViewKeepLeft(toView,1,keep);
            return weakSelf;
        };
    }
    return _widthEqualToViewKeepLeft;
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

- (WDWidthHeightEqualToViewKeepLeftTop)heightEqualToViewKeepLeft
{
    if(!_heightEqualToViewKeepTop) {
        __weak typeof(self) weakSelf = self;
        _heightEqualToViewKeepTop = ^WDViewLayout *(UIView *toView,BOOL keep) {
            weakSelf.heightRatioToViewKeepTop(toView,1,keep);
            return weakSelf;
        };
    }
    return _heightEqualToViewKeepTop;
}

- (WDWidthHeight)width
{
    [self removeWidthConstraint];
    if(!_width) {
        _width = [self widthHeightBlockWithKey:@"widthConstraint"];
    }
    return _width;
}

- (WDWidthHeightKeepLeftTop)widthKeepLeft
{
    if(!_widthKeepLeft) {
        __weak typeof(self) weakSelf = self;
        _widthKeepLeft = ^WDViewLayout *(CGFloat value,BOOL keep) {
            weakSelf.width(value);
            BOOL hasLeftConstraint = [weakSelf hasLeftConstraint];
            BOOL hasRightConstraint = [weakSelf hasRightConstraint];
            if(hasLeftConstraint && hasRightConstraint) {
                if(keep) {
                    [weakSelf removeRightConstraint];
                } else {
                    [weakSelf removeLeftConstraint];
                }
            }
            return weakSelf;
        };
    }
    return _widthKeepLeft;
}

- (WDWidthHeight)height
{
    [self removeHeightConstraint];
    if(!_height) {
        _height = [self widthHeightBlockWithKey:@"heightConstraint"];
    }
    return _height;
}

- (WDWidthHeightKeepLeftTop)heightKeepTop
{
    if(!_heightKeepTop) {
        __weak typeof(self) weakSelf = self;
        _heightKeepTop = ^WDViewLayout *(CGFloat value,BOOL keep) {
            weakSelf.height(value);
            BOOL hasTopConstraint = [weakSelf hasTopConstraint];
            BOOL hasBottomConstraint = [weakSelf hasBottomConstraint];
            if(hasBottomConstraint && hasTopConstraint) {
                if(keep) {
                    [weakSelf removeBottomConstraint];
                } else {
                    [weakSelf removeTopConstraint];
                }
            }
            return weakSelf;
        };
    }
    return _heightKeepTop;
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
    [self removeWidthConstraint];
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

- (WDSameWidthHeightKeepLeftTop)widthEqualHeightKeepLeft
{
    if(!_widthEqualHeightKeepLeft) {
        __weak typeof(self) weakSelf = self;
        _widthEqualHeightKeepLeft = ^WDViewLayout *(BOOL keep) {
            weakSelf.widthEqualHeight();
            BOOL hasLeftConstraint = [weakSelf hasLeftConstraint];
            BOOL hasRightConstraint = [weakSelf hasRightConstraint];
            if(hasLeftConstraint && hasRightConstraint) {
                if(keep) {
                    [weakSelf removeRightConstraint];
                } else {
                    [weakSelf removeLeftConstraint];
                }
            }

            return weakSelf;
        };
    }
    return _widthEqualHeightKeepLeft;
}

- (WDSameWidthHeight)heightEqualWidth
{
    [self removeHeightConstraint];
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

- (WDSameWidthHeightKeepLeftTop)heightEqualWidthKeepTop
{
    if(!_heightEqualWidthKeepTop) {
        __weak typeof(self) weakSelf = self;
        _heightEqualWidthKeepTop = ^WDViewLayout *(BOOL keep) {
            weakSelf.heightEqualWidth();
            BOOL hasTopConstraint = [weakSelf hasTopConstraint];
            BOOL hasBottomConstraint = [weakSelf hasBottomConstraint];
            if(hasBottomConstraint && hasTopConstraint) {
                if(keep) {
                    [weakSelf removeBottomConstraint];
                } else {
                    [weakSelf removeTopConstraint];
                }
            }
            return weakSelf;
        };
    }
    return _heightEqualWidthKeepTop;
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
    [self removeWidthConstraint];
    if(!_autoresizingMaxWidth) {
        _autoresizingMaxWidth = [self limitWidhHeightBlockWithKey:@"limitAutoresizingMaxWidth"];
    }
    return _autoresizingMaxWidth;
}

- (WDWidthHeightKeepLeftTop)autoresizingMaxWidthKeepLeft
{
    if(!_autoresizingMaxWidthKeepLeft) {
        __weak typeof(self) weakSelf = self;
        _autoresizingMaxWidthKeepLeft = ^WDViewLayout *(CGFloat value,BOOL keep) {
            weakSelf.autoresizingMaxWidth(value);
            BOOL hasLeftConstraint = [weakSelf hasLeftConstraint];
            BOOL hasRightConstraint = [weakSelf hasRightConstraint];
            if(hasLeftConstraint && hasRightConstraint) {
                if(keep) {
                    [weakSelf removeRightConstraint];
                } else {
                    [weakSelf removeLeftConstraint];
                }
            }
            return weakSelf;
        };
    }
    return _autoresizingMaxWidthKeepLeft;
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
    [self removeWidthConstraint];
    if(!_widthRatioToView) {
        _widthRatioToView = [self widthHeightRatioToViewBlockWithKey:@"widthRatioToViewConstraint"];
    }
    return _widthRatioToView;
}

- (WDWidthHeightRatioToViewKeepLeftTop)widthRatioToViewKeepLeft
{
    if(!_widthRatioToViewKeepLeft) {
        __weak typeof(self) weakSelf = self;
        _widthRatioToViewKeepLeft = ^WDViewLayout *(UIView *toView,CGFloat value,BOOL keep) {
            weakSelf.widthRatioToView(toView,value);
            BOOL hasLeftConstraint = [weakSelf hasLeftConstraint];
            BOOL hasRightConstraint = [weakSelf hasRightConstraint];
            if(hasLeftConstraint && hasRightConstraint) {
                if(keep) {
                    [weakSelf removeRightConstraint];
                } else {
                    [weakSelf removeLeftConstraint];
                }
            }
            return weakSelf;
        };
    }
    return _widthRatioToViewKeepLeft;
}

- (WDWidthHeightRatioToView)heightRatioToView
{
    [self removeHeightConstraint];
    if(!_heightRatioToView) {
        _heightRatioToView = [self widthHeightRatioToViewBlockWithKey:@"heightRatioToViewConstraint"];
    }
    return _heightRatioToView;
}

- (WDWidthHeightRatioToViewKeepLeftTop)heightRatioToViewKeepTop
{
    if(!_heightRatioToViewKeepTop) {
        __weak typeof(self) weakSelf = self;
        _heightRatioToViewKeepTop = ^WDViewLayout *(UIView *toView,CGFloat value,BOOL keep) {
            weakSelf.heightRatioToView(toView,value);
            BOOL hasTopConstraint = [weakSelf hasRightConstraint];
            BOOL hasBottomConstraint = [weakSelf hasBottomConstraint];
            if(hasBottomConstraint && hasTopConstraint) {
                if(keep) {
                    [weakSelf removeBottomConstraint];
                } else {
                    [weakSelf removeTopConstraint];
                }
            }
            return weakSelf;
        };
    }
    return _heightRatioToViewKeepTop;
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

- (WDWidthHeight)autoHeightRatio
{
    [self removeHeightConstraint];
    if(!_autoHeightRatio) {
        __weak typeof(self) weakSelf = self;
        _autoHeightRatio = ^WDViewLayout *(CGFloat value) {
            [weakSelf setValue:@(value) forKey:@"heightRatio"];
            return weakSelf;
        };
    }
    return _autoHeightRatio;
}

- (WDWidthHeightKeepLeftTop)autoHeightRatioKeepTop
{
    if(!_autoHeightRatioKeepTop) {
        __weak typeof(self) weakSelf = self;
        _autoHeightRatioKeepTop = ^WDViewLayout *(CGFloat value,BOOL keep) {
            weakSelf.autoHeightRatio(value);
            BOOL hasTopConstraint = [weakSelf hasRightConstraint];
            BOOL hasBottomConstraint = [weakSelf hasBottomConstraint];
            if(hasBottomConstraint && hasTopConstraint) {
                if(keep) {
                    [weakSelf removeBottomConstraint];
                } else {
                    [weakSelf removeTopConstraint];
                }
            }
            return weakSelf;
        };
    }
    return _autoHeightRatioKeepTop;
}

- (WDFixedWidthHeight)fixedWidth
{
    if(!_fixedWidth) {
        __weak typeof(self) weakSelf = self;
        _fixedWidth = ^{
            __strong typeof(weakSelf) strongSelf = weakSelf;
            strongSelf->_widthFix = YES;
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
            strongSelf->_heightFix = YES;
            return weakSelf;
        };
    }
    return _fixedHeight;
}

- (WDAutoWidthHeight)heightSpaceToBottom
{
    [self removeHeightConstraint];
    if(!_heightSpaceToBottom) {
        __weak typeof(self) weakSelf = self;
        _heightSpaceToBottom = ^WDViewLayout *(NSArray<UIView *> *views,CGFloat margin) {
            [weakSelf.needAutoLayoutView wd_setupBottomViewWithBottomViewArray:views marginToBottom:margin];
            return weakSelf;
        };
    }
    return _heightSpaceToBottom;
}

- (WDAutoWidthHeight)widthSpaceToRight
{
    [self removeWidthConstraint];
    if(!_widthSpaceToRight) {
        __weak typeof(self) weakSelf = self;
        _widthSpaceToRight = ^WDViewLayout*(NSArray<UIView *> *views,CGFloat margin) {
            [weakSelf.needAutoLayoutView wd_setupRightViewWithRightViewArray:views marginToRight:margin];
            return weakSelf;
        };
    }
    return _widthSpaceToRight;
}

- (void)startLayout
{
    UIView *view = self.needAutoLayoutView;
    if(!view) return;
    self.hasCalculateWidth = NO;
    self.hasCalculateHeight = NO;
    if(self.widthConstraint && self.widthConstraint.firstView == view && self.widthConstraint.secondView == view && !self.isWidthFix) {
        view.wd_width = self.widthConstraint.constant;
        if(self.limitExtrasWidth) {
            view.wd_width += [self.limitExtrasWidth floatValue];
        }
//        self.widthFix = YES;
        self.hasCalculateWidth = YES;
    } else if(self.widthRatioToViewConstraint && self.widthRatioToViewConstraint.firstView == view && !self.isWidthFix) {
        view.wd_width = self.widthRatioToViewConstraint.secondView.wd_width * self.widthRatioToViewConstraint.multiplier;
        if(self.limitExtrasWidth) {
            view.wd_width += [self.limitExtrasWidth floatValue];
        }
//        self.widthFix = YES;
        self.hasCalculateWidth = YES;
    }
    
    if(self.heightConstraint && self.heightConstraint.firstView == view && self.heightConstraint.secondView == view && !self.isHeightFix) {
        view.wd_height = self.heightConstraint.constant;
        if(self.limitExtrasHeight) {
            view.wd_height += [self.limitExtrasHeight floatValue];
        }
//        self.heightFix = YES;
        self.hasCalculateHeight = YES;
    } else if(self.heightRatioToViewConstraint && self.heightRatioToViewConstraint.firstView == view && !self.isHeightFix) {
        view.wd_height = self.heightRatioToViewConstraint.secondView.wd_height * self.heightRatioToViewConstraint.multiplier;
        if(self.limitExtrasHeight) {
            view.wd_height += [self.limitExtrasHeight floatValue];
        }
//        self.heightFix = YES;
        self.hasCalculateHeight = YES;
    }
    
    if(self.limitAutoresizingMaxWidth && !self.isWidthFix) {
        if([view isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)view;
            CGFloat maxWidth = self.limitAutoresizingMaxWidth.floatValue > 0 ?  self.limitAutoresizingMaxWidth.floatValue: MAXFLOAT;
            if(label.text.length) {
                self.hasCalculateWidth = YES;
                if(!label.isAttributedContent) {
                    CGSize size = [label.text boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : label.font} context:nil].size;
                    label.wd_width = ceilf(size.width);
                    if(self.limitExtrasWidth) {
                        label.wd_width += [self.limitExtrasWidth floatValue];
                    }
//                    self.widthFix = YES;
                } else {
                    [label sizeToFit];
                    if(label.wd_width > maxWidth) {
                        label.wd_width = maxWidth;
                    }
                    if(self.limitExtrasWidth) {
                        label.wd_width += [self.limitExtrasWidth floatValue];
                    }
//                    self.widthFix = YES;
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
//        self.heightFix = YES;
        self.hasCalculateHeight = YES;
        if(value > 0) {
            view.wd_height = ceilf(view.wd_width * value);
            if(self.limitExtrasHeight) {
                view.wd_height += [self.limitExtrasHeight floatValue];
            }
        } else {
            if([view isKindOfClass:[UILabel class]]) {
                UILabel *label = (UILabel *)view;
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
    
    if(view.wd_bottomViewArray || view.wd_rightViewArray) {
        [view layoutSubviews];
    }
    if(view.wd_didFinishedAutoLayout) {
        view.wd_didFinishedAutoLayout(view.frame);
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
        view.wd_layout.hasCalculateWidth = YES;
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
        view.wd_layout.hasCalculateHeight = YES;
    }
}

- (void)adjustHorizontalConstraint
{
    UIView *view = self.needAutoLayoutView;
    if(!view) return;
    if(self.rightConstraint && self.rightConstraint.firstView == view) {
        if(view.superview == self.rightConstraint.secondView) {
            if(!self.isWidthFix && !self.hasCalculateWidth) {
                view.wd_width = self.rightConstraint.secondView.wd_width - self.rightConstraint.constant - view.wd_left;
                if(self.limitExtrasWidth) {
                    view.wd_width += [self.limitExtrasWidth floatValue];
                }
                self.hasCalculateWidth = YES;
            }
            view.wd_right = self.rightConstraint.secondView.wd_width - self.rightConstraint.constant;
        } else {
            if(!self.isWidthFix && !self.hasCalculateWidth) {
                view.wd_width = self.rightConstraint.secondView.wd_left - self.rightConstraint.constant - view.wd_left;
                if(self.limitExtrasWidth) {
                    view.wd_width += [self.limitExtrasWidth floatValue];
                }
                self.hasCalculateWidth = YES;
            }
            view.wd_right = self.rightConstraint.secondView.wd_left - self.rightConstraint.constant;
        }
    } else if(self.rightEqualConstraint && self.rightEqualConstraint.firstView == view) {
        if(self.rightEqualConstraint.secondView == view.superview) {
            if(!self.isWidthFix && !self.hasCalculateWidth) {
                view.wd_width = self.rightEqualConstraint.secondView.wd_width - view.wd_left;
                if(self.limitExtrasWidth) {
                    view.wd_width += [self.limitExtrasWidth floatValue];
                }
                self.hasCalculateWidth = YES;
            }
            view.wd_right = self.rightEqualConstraint.secondView.wd_width;
        } else {
            if(!self.isWidthFix && !self.hasCalculateWidth) {
                view.wd_width = self.rightEqualConstraint.secondView.wd_right - view.wd_left;
                if(self.limitExtrasWidth) {
                    view.wd_width += [self.limitExtrasWidth floatValue];
                }
                self.hasCalculateWidth = YES;
            }
            view.wd_right = self.rightEqualConstraint.secondView.wd_right;
        }
    } else if(self.rightEqualAndExtrasMarginConstraint && self.rightEqualAndExtrasMarginConstraint.firstView == view) {
        if(self.rightEqualAndExtrasMarginConstraint.secondView == view.superview) {
            if(!self.isWidthFix && !self.hasCalculateWidth) {
                view.wd_width = self.rightEqualAndExtrasMarginConstraint.secondView.wd_width -self.rightEqualAndExtrasMarginConstraint.constant - view.wd_left;
                if(self.limitExtrasWidth) {
                    view.wd_width += [self.limitExtrasWidth floatValue];
                }
                self.hasCalculateWidth = YES;
            }
            view.wd_right = self.rightEqualAndExtrasMarginConstraint.secondView.wd_width -self.rightEqualAndExtrasMarginConstraint.constant;
        } else {
            if(!self.isWidthFix && !self.hasCalculateWidth) {
                view.wd_width = self.rightEqualAndExtrasMarginConstraint.secondView.wd_right -self.rightEqualAndExtrasMarginConstraint.constant - view.wd_left;
                if(self.limitExtrasWidth) {
                    view.wd_width += [self.limitExtrasWidth floatValue];
                }
                self.hasCalculateWidth = YES;
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
            if(!self.isHeightFix && !self.hasCalculateHeight) {
                view.wd_height = self.bottomConstraint.secondView.wd_height - self.bottomConstraint.constant - view.wd_top;
                if(self.limitExtrasHeight) {
                    view.wd_height += [self.limitExtrasHeight floatValue];
                }
                self.hasCalculateHeight = YES;
            }
            view.wd_bottom = self.bottomConstraint.secondView.wd_height - self.bottomConstraint.constant;
        } else {
            if(!self.isHeightFix && !self.hasCalculateHeight) {
                view.wd_height = self.bottomConstraint.secondView.wd_top - self.bottomConstraint.constant - view.wd_top;
                if(self.limitExtrasHeight) {
                    view.wd_height += [self.limitExtrasHeight floatValue];
                }
                self.hasCalculateHeight = YES;
            }
            view.wd_bottom = self.bottomConstraint.secondView.wd_top - self.bottomConstraint.constant;
        }
    } else if(self.bottomEqualConstraint && self.bottomEqualConstraint.firstView == view) {
        if(view.superview == self.bottomEqualConstraint.secondView) {
            if(!self.isHeightFix && !self.hasCalculateHeight) {
                view.wd_height = self.bottomEqualConstraint.secondView.wd_height - view.wd_top;
                if(self.limitExtrasHeight) {
                    view.wd_height += [self.limitExtrasHeight floatValue];
                }
                self.hasCalculateHeight = YES;
            }
            view.wd_bottom = self.bottomEqualConstraint.secondView.wd_height;
        } else {
            if(!self.isHeightFix && !self.hasCalculateHeight) {
                view.wd_height = self.bottomEqualConstraint.secondView.wd_bottom - view.wd_top;
                if(self.limitExtrasHeight) {
                    view.wd_height += [self.limitExtrasHeight floatValue];
                }
                self.hasCalculateHeight = YES;
            }
            view.wd_bottom = self.bottomEqualConstraint.secondView.wd_bottom;
        }
    } else if(self.bottomEqualAndExtrasMarginConstraint && self.bottomEqualAndExtrasMarginConstraint.firstView == view) {
        if(view.superview == self.bottomEqualAndExtrasMarginConstraint.secondView) {
            if(!self.isHeightFix && !self.hasCalculateHeight) {
                view.wd_height = self.bottomEqualAndExtrasMarginConstraint.secondView.wd_height - self.bottomEqualAndExtrasMarginConstraint.constant  - view.wd_top;
                if(self.limitExtrasHeight) {
                    view.wd_height += [self.limitExtrasHeight floatValue];
                }
                self.hasCalculateHeight = YES;
            }
            view.wd_bottom = self.bottomEqualAndExtrasMarginConstraint.secondView.wd_height - self.bottomEqualAndExtrasMarginConstraint.constant;
        } else {
            if(!self.isHeightFix && !self.hasCalculateHeight) {
                view.wd_height = self.bottomEqualAndExtrasMarginConstraint.secondView.wd_bottom - self.bottomEqualAndExtrasMarginConstraint.constant - view.wd_top;
                if(self.limitExtrasHeight) {
                    view.wd_height += [self.limitExtrasHeight floatValue];
                }
                self.hasCalculateHeight = YES;
            }
            view.wd_bottom = self.bottomEqualAndExtrasMarginConstraint.secondView.wd_bottom - self.bottomEqualAndExtrasMarginConstraint.constant;
        }
    }
}

- (BOOL)hasLeftConstraint
{
    return self.leftConstraint != nil || self.leftEqualConstraint != nil || self.leftEqualAndExtrasMarginConstraint != nil || self.centerXEqualConstraint != nil || self.centerXEqualAndExtrasMarginConstraint != nil;
}

- (void)removeLeftConstraint
{
    self.leftConstraint = nil;
    self.leftEqualConstraint = nil;
    self.leftEqualAndExtrasMarginConstraint = nil;
    self.centerXEqualConstraint = nil;
    self.centerXEqualAndExtrasMarginConstraint = nil;
}

- (BOOL)hasRightConstraint
{
    return self.rightConstraint != nil  || self.rightEqualConstraint != nil || self.rightEqualAndExtrasMarginConstraint != nil;
}

- (void)removeRightConstraint
{
    self.rightConstraint = nil;
    self.rightEqualConstraint = nil;
    self.rightEqualAndExtrasMarginConstraint = nil;
}

- (BOOL)hasTopConstraint
{
    return self.topConstraint != nil || self.topEqualConstraint != nil || self.topEqualAndExtrasMarginConstraint != nil || self.centerYEqualConstraint != nil || self.centerYEqualAndExtrasMarginConstraint != nil;

}

- (void)removeTopConstraint
{
    self.topConstraint = nil;
    self.topEqualConstraint = nil;
    self.topEqualAndExtrasMarginConstraint = nil;
    self.centerYEqualConstraint = nil;
    self.centerYEqualAndExtrasMarginConstraint = nil;
}

- (BOOL)hasBottomConstraint
{
    return self.bottomConstraint != nil  || self.bottomEqualConstraint != nil || self.bottomEqualAndExtrasMarginConstraint != nil;
}

- (void)removeBottomConstraint
{
    self.bottomConstraint = nil;
    self.bottomEqualConstraint = nil;
    self.bottomEqualAndExtrasMarginConstraint = nil;
}

- (BOOL)hasWidthConstraint
{
    return self.widthConstraint != nil || self.widthRatioToViewConstraint != nil || self.limitAutoresizingMaxWidth != nil || self.widthEqualHeightConstraint != nil;
}

- (void)removeWidthConstraint
{
    self.hasCalculateWidth = NO;
    self.widthConstraint = nil;
    self.widthRatioToViewConstraint = nil;
    self.limitAutoresizingMaxWidth = nil;
    _widthEqualHeightConstraint = nil;
}

- (BOOL)hasHeightConstraint
{
    return self.heightConstraint != nil || self.heightRatio != nil || self.heightRatioToViewConstraint != nil || self.heightEqualWidthConstraint != nil;
}

- (void)removeHeightConstraint
{
    self.hasCalculateHeight = NO;
    self.heightConstraint = nil;
    self.heightRatioToViewConstraint = nil;
    self.heightRatio = nil;
    _heightEqualWidthConstraint = nil;
    
}

@end

