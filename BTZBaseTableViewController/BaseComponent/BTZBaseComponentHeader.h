//
//  BTZBaseComponentHeader.h
//  OrangeStage
//
//  Created by Rathen on 2018/5/14.
//  Copyright © 2018年 com.3wchina. All rights reserved.
//

#ifndef BTZBaseComponentHeader_h
#define BTZBaseComponentHeader_h

#ifdef DEBUG
#define DLog(...) NSLog(@"%s %@", __PRETTY_FUNCTION__, [NSString stringWithFormat:__VA_ARGS__])
#define ALog(...) [[NSAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithCString:__PRETTY_FUNCTION__ encoding:NSUTF8StringEncoding] file:[NSString stringWithCString:__FILE__ encoding:NSUTF8StringEncoding] lineNumber:__LINE__ description:__VA_ARGS__]
#else
#define DLog(...) do { } while (0)
#endif

#import "UIViewController+ShowView.h"
#import "UIViewController+NavigationSetting.h"
#import "UIViewController+BaiDu.h"


#import "BTZBaseTbaleViewController.h"
#import "BTZBaseTableViewCell.h"
#import "BTZBaseItem.h"

#import "UIView+Cuntome.h"


#endif /* BTZBaseComponentHeader_h */
