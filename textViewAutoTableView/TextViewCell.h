//
//  TextViewCell.h
//  textViewAutoTableView
//
//  Created by nacker on 2016/12/13.
//  Copyright © 2016年 帶頭二哥 QQ:648959. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TextViewCell;

@protocol TextViewCellDelegate <NSObject>

- (void)textViewCell:(TextViewCell *)cell didChangeText:(NSString *)text;

@end

@interface TextViewCell : UITableViewCell

@property (nonatomic, strong) UITextView *textView;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, weak) id<TextViewCellDelegate> delegate;

@end
