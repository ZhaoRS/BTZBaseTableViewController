//
//  BTZTestItem.h
//  OrangeStage
//
//  Created by Rathen on 2018/6/11.
//  Copyright © 2018年 com.3wchina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BTZBaseItemProtocol.h"

@interface BTZTestItem : NSObject <BTZBaseItemProtocol>


@property (nonatomic, assign) int type;

@property (nonatomic, copy) NSString *titleStr;

@end
