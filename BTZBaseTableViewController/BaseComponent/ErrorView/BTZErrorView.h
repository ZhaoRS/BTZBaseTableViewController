//
//  BTZErrorView.h
//  OrangeStage
//
//  Created by Rathen on 2018/6/8.
//  Copyright © 2018年 com.3wchina. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BTZErrorViewBlock)();

@interface BTZErrorView : UIView

- (void)changeErrorImageView:(NSString *)imageString content:(NSString *)content showButton:(BOOL)buttonShow buttonString:(NSString *)buttonStrin;

@property (nonatomic, copy) BTZErrorViewBlock clickBlock;

@end
