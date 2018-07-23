//
//  BTZBaseTableViewCell.h
//  OrangeStage
//
//  Created by Rathen on 2018/5/21.
//  Copyright © 2018年 com.3wchina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BTZBaseItemProtocol.h"

@interface BTZBaseTableViewCell : UITableViewCell

- (void)updateCell:(NSObject<BTZBaseItemProtocol> *)item;

@end
