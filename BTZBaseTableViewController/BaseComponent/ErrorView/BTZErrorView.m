//
//  BTZErrorView.m
//  OrangeStage
//
//  Created by Rathen on 2018/6/8.
//  Copyright © 2018年 com.3wchina. All rights reserved.
//

#import "BTZErrorView.h"

@interface BTZErrorView ()

@property (weak, nonatomic) IBOutlet UIImageView *errorImageView;
@property (weak, nonatomic) IBOutlet UILabel *errorContentLabel;

@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation BTZErrorView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"BTZErrorView" owner:self options:0].lastObject;
        self.button.layer.cornerRadius = 5;
        self.button.layer.masksToBounds = YES;
        self.button.layer.borderColor = [UIColor blueColor].CGColor;
        self.button.layer.borderWidth = 0.5;
        self.button.hidden = YES;
    }
    return self;
}

- (void)changeErrorImageView:(NSString *)imageString content:(NSString *)content showButton:(BOOL)buttonShow buttonString:(NSString *)buttonString {
    self.errorImageView.image = [UIImage imageNamed:imageString];
    self.errorContentLabel.text = content;
    
    self.button.hidden = !buttonShow;
    [self.button setTitle:buttonString forState:UIControlStateNormal];
}
- (IBAction)clickAction:(UIButton *)sender {
    if ([sender.titleLabel.text isEqualToString:@"去逛逛"]) {
        if (self.clickBlock) {
            self.clickBlock();
        }
    } else {
        if (self.serviceBlock) {
            self.serviceBlock();
        }
    }
    
    
}

@end
