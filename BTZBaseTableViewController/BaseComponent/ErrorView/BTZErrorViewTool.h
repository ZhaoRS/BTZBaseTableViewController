//
//  BTZErrorViewTool.h
//  OrangeStage
//
//  Created by Rathen on 2018/6/8.
//  Copyright © 2018年 com.3wchina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, BTZErrorViewType) {
    BTZErrorViewTypeOrderList,//订单为空
    BTZErrorViewTypeCoupon,//优惠券
    BTZErrorViewTypeRepayment,//还款记录
    BTZErrorViewTypeNetwork,//网络错误视图
};


typedef NS_ENUM(NSUInteger, BTZErrorViewAtionType) {
    BTZErrorViewAtionTypeRefresh,
    BTZErrorViewAtionTypeGotoPage,
};
typedef void(^BTZErrorViewToolBlock)(void);
typedef void(^BTZErrorNoServiceBlock)(void);

@class BTZErrorView;

@interface BTZErrorViewTool : NSObject

/**
 去逛逛按钮点击
 */
@property (nonatomic, copy) BTZErrorViewToolBlock clickAction;


/**
 没有网络的情况下要执行网络请求
 */
@property (nonatomic, copy) BTZErrorNoServiceBlock noServiceAction;


/**
 得到错误视图

 @param frame frame
 @param type BTZErrorViewType类型
 */
- (void)getErrorViewWithFrame:(CGRect)frame type:(BTZErrorViewType)type;

/**
 得到错误视图

 @return UIView
 */
- (UIView *)getView;


/**
 显示错误视图
 */
- (void)showErrorView;

/**
 隐藏错误视图
 */
- (void)hiddenErrorView;

@end
