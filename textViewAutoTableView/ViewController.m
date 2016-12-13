//
//  ViewController.m
//  textViewAutoTableView
//
//  Created by nacker on 2016/12/13.
//  Copyright © 2016年 帶頭二哥 QQ:648959. All rights reserved.
//

#import "ViewController.h"
#import "TextViewCell.h"

@interface ViewController ()<TextViewCellDelegate>

@property (nonatomic, strong) NSArray *statusArray;

@end

@implementation ViewController

- (NSArray *)statusArray
{
    if (_statusArray == nil){
        self.statusArray = @[@"Cell 1 ", @"Cell 2", @"Cell 3", @"Cell 4", @"Cell 5", @"Cell 6", @"Cell 7", @"Cell 8",@"Cell 8",@"Cell 8",@"Cell 8",@"Cell 8",@"Cell 8",@"Cell 8",@"Cell 8",@"Cell 8",@"Cell 8"];
    }
    return _statusArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    
    self.tableView.estimatedRowHeight = 100.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.statusArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TextViewCell *cell = [TextViewCell cellWithTableView:tableView];
    cell.delegate = self;
    cell.textView.text = self.statusArray[indexPath.row];
    return cell;
}


#pragma mark - TextViewCellDelegate
- (void)textViewCell:(TextViewCell *)cell didChangeText:(NSString *)text
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    NSMutableArray *data = [self.statusArray mutableCopy];
    data[indexPath.row] = text;
    self.statusArray = [data copy];
}

#pragma -- Keyboard
- (void)keyboardWillShow:(NSNotification*)aNotification {
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(self.tableView.contentInset.top, 0.0, kbSize.height, 0.0);
    self.tableView.contentInset = contentInsets;
    self.tableView.scrollIndicatorInsets = contentInsets;
}

- (void)keyboardWillHide:(NSNotification*)aNotification {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.35];
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(self.tableView.contentInset.top, 0.0, 0.0, 0.0);
    self.tableView.contentInset = contentInsets;
    self.tableView.scrollIndicatorInsets = contentInsets;
    [UIView commitAnimations];
}
@end
