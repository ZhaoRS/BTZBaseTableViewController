//
//  BTZBaseTableViewCellProtocol.h
//  BTZBaseTableViewController
//
//  Created by Rathen on 2018/6/28.
//  Copyright © 2018年 Rathen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTZBaseItemProtocol.h"

@protocol BTZBaseTableViewCellProtocol <NSObject>

- (void)updateCell:(NSObject<BTZBaseItemProtocol> *)item;

@end
