//
//  MainTableViewController.m
//  SearchTableViewController
//
//  Created by admin on 15/7/30.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "MainTableViewController.h"
#import "bookCell.h"

@interface MainTableViewController ()
{
    NSMutableArray *_dataList;
    NSArray *_resultList;
}
@end

 static NSString *cellID = @"bookCell";
@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   //生成假数据
    _dataList = [[NSMutableArray alloc]initWithCapacity:40];
    for (int i=0; i<40; i++) {
        [_dataList addObject:[NSString stringWithFormat:@"葵花宝典(%03d)",i]];
    }
    [self.searchDisplayController.searchResultsTableView registerClass:[bookCell class] forCellReuseIdentifier:cellID];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.searchDisplayController.searchResultsTableView ==tableView) {
        return [_resultList count];
    }
    return [_dataList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    NSString *content;
    if (self.searchDisplayController.searchResultsTableView == tableView) {
        content =_resultList[indexPath.row];
    }
    else
        content = _dataList[indexPath.row];
    
    [cell.textLabel setText:content];
    
    return cell;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    //模糊查找
    //定义谓词
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c]%@",searchString];
    _resultList = [_dataList filteredArrayUsingPredicate:pre];
   // NSLog(@"%@",_resultList);
    return YES;

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
