//
//  BTZBaseTableGroupViewController.m
//  OrangeStage
//
//  Created by Rathen on 2018/6/12.
//  Copyright © 2018年 com.3wchina. All rights reserved.
//

#import "BTZBaseTableGroupViewController.h"
#import "BTZBaseGroupItem.h"
#import "BTZBaseItem.h"
#import "BTZBaseTableViewCell.h"
#import "MJRefresh.h"


@interface BTZBaseTableGroupViewController ()

@end

@implementation BTZBaseTableGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)serviceWithResult:(NSArray *)result operation:(NSURLSessionDataTask *)operation
{
    [super serviceWithResult:result operation:operation];
    NSInteger resultCount = 0;
    for (BTZBaseGroupItem *item in result) {
        if ([item isKindOfClass:[BTZBaseGroupItem class]]) {
            resultCount += 1;
        }
    }
    self.mainTableView.mj_footer.hidden = resultCount < self.pageSize ? YES : NO;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.tbDataArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    BTZBaseGroupItem *item = [self.tbDataArray objectAtIndex:section];
    return [item.sectionArray count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    return @"";
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BTZBaseGroupItem *item = [self.tbDataArray objectAtIndex:indexPath.section];
    BTZBaseItem *subItem = [item.sectionArray objectAtIndex:indexPath.row];
    
    return subItem.cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BTZBaseGroupItem *item = [self.tbDataArray objectAtIndex:indexPath.section];
    BTZBaseItem *subItem = [item.sectionArray objectAtIndex:indexPath.row];
    
    static NSString* cellIdentification = @"currentCell";
    
    BTZBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentification];
    if (!cell) {
        if (self.cellIsXIB) {//是XIB
            cell = [[[NSBundle mainBundle] loadNibNamed:[subItem cellName] owner:self options:0] objectAtIndex:0];
        } else {//不是XIB
            if (!cellIdentification) {
                return nil;
            }
            Class ModelClass = NSClassFromString(cellIdentification);
            cell = [[ModelClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentification];
        }
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if ([item isKindOfClass:[BTZBaseItem class]]) {
        [cell updateCell:subItem];
    }
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
