//
//  BTZErrorViewTool.m
//  OrangeStage
//
//  Created by Rathen on 2018/6/8.
//  Copyright © 2018年 com.3wchina. All rights reserved.
//

#import "BTZErrorViewTool.h"
#import "BTZErrorView.h"


@interface BTZErrorViewTool ()


@property (nonatomic, assign) BTZErrorViewType errorType;
@property (nonatomic, assign) BOOL isNetworkError;
@property (nonatomic, assign) CGRect frame;
@property (nonatomic, strong) BTZErrorView *errorView;


@end

@implementation BTZErrorViewTool

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(netChangeNotReachable) name:@"NetChangeNotReachable" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(netChangeAvliable) name:@"NetChangeAvliable" object:nil];
    }
    return self;
}

- (void)netChangeNotReachable {
    self.isNetworkError = YES;
}
- (void)netChangeAvliable {
    self.isNetworkError = NO;
}

- (void)getErrorViewWithFrame:(CGRect)frame type:(BTZErrorViewType)type {
    self.errorType = type;
    self.errorView.frame = frame;
}

- (UIView *)getView {

    return self.errorView;
}


- (void)getImageNameStrAndContent:(BTZErrorViewType)type {
    if (self.isNetworkError) {
        type = BTZErrorViewTypeNetwork;
    }
    NSString *imageNameStr = @"hybrid_overlay";
    NSString *content = @"暂无数据";
    NSString *buttonStr = @"去逛逛";
    BOOL showButton = NO;
    switch (type) {
            case BTZErrorViewTypeOrderList:
            imageNameStr = @"hybrid_overlay";
            content = @"您还没有相关订单呢";
            break;
            
            case BTZErrorViewTypeCoupon:
            imageNameStr = @"hybrid_overlay";
            content = @"当前没有可用优惠券";
            break;
            
            
            case BTZErrorViewTypeRepayment:
            imageNameStr = @"hybrid_overlay";
            content = @"暂无还款记录";
            showButton = YES;
            break;
            
            case BTZErrorViewTypeNetwork:
            imageNameStr = @"hybrid_overlay@2x";
            content = @"暂无还款记录";
            showButton = YES;
            buttonStr = @"刷新";
            break;
            
            
        default:
            break;
    }
    [self.errorView changeErrorImageView:imageNameStr content:content showButton:showButton buttonString:buttonStr];
}


- (BTZErrorView *)errorView {
    if (_errorView == nil) {
        _errorView = [[BTZErrorView alloc] init];
        _errorView.frame = _frame;
        _errorView.tag = 1212121212;
        _errorView.hidden = YES;
        __weak typeof(self) weakself=self;
        _errorView.clickBlock = ^{
            if (weakself.clickAction) {
                weakself.clickAction();
            }
        };
    }
    return _errorView;
}




- (void)showErrorView {
    [self getImageNameStrAndContent:self.errorType];
    self.errorView.hidden = NO;
}

- (void)hiddenErrorView {
    self.errorView.hidden = YES;
//    [self.errorView removeFromSuperview];
//    self.errorView = nil;
}



@end
