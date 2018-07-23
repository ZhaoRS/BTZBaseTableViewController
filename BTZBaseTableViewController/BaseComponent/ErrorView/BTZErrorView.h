//
//  BTZErrorView.h
//  OrangeStage
//
//  Created by Rathen on 2018/6/8.
//  Copyright © 2018年 com.3wchina. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BTZErrorViewBlock)();
typedef void(^BTZErrorViewNoServiceBlock)(void);

@interface BTZErrorView : UIView

- (void)changeErrorImageView:(NSString *)imageString content:(NSString *)content showButton:(BOOL)buttonShow buttonString:(NSString *)buttonStrin;

@property (nonatomic, copy) BTZErrorViewBlock clickBlock;

@property (nonatomic, copy) BTZErrorViewNoServiceBlock serviceBlock;

@end
