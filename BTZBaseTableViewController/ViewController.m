//
//  ViewController.m
//  BTZBaseTableViewController
//
//  Created by Rathen on 2018/6/13.
//  Copyright © 2018年 Rathen. All rights reserved.
//

#import "ViewController.h"
#import "BTZTestTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)action:(id)sender {
    BTZTestTableViewController *controller = [[BTZTestTableViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
