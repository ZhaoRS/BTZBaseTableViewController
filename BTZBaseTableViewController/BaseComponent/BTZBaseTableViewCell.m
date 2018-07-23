//
//  BTZBaseTableViewCell.m
//  OrangeStage
//
//  Created by Rathen on 2018/5/21.
//  Copyright © 2018年 com.3wchina. All rights reserved.
//

#import "BTZBaseTableViewCell.h"


@implementation BTZBaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)updateCell:(NSObject<BTZBaseItemProtocol> *)item {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
