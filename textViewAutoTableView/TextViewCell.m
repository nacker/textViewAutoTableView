//
//  TextViewCell.m
//  textViewAutoTableView
//
//  Created by nacker on 2016/12/13.
//  Copyright © 2016年 帶頭二哥 QQ:648959. All rights reserved.
//

#import "TextViewCell.h"
#import "Masonry.h"

@interface TextViewCell() <UITextViewDelegate>

@end

@implementation TextViewCell

static NSString * const CellIdentifier = @"TextViewCell";

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    TextViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[TextViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        

        _textView = [[UITextView alloc] init];
        _textView.backgroundColor = [UIColor greenColor];
        _textView.bounces = NO;
        _textView.scrollEnabled = NO;
        _textView.font = [UIFont systemFontOfSize:16];
        _textView.userInteractionEnabled = YES;
        _textView.delegate = self;
        _textView.layer.masksToBounds = YES;
        // 自适应高度
        _textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        _textView.textContainer.lineFragmentPadding = 0.0;
        _textView.textContainerInset = UIEdgeInsetsZero;
        
        [self.contentView addSubview:_textView];
        
        
        [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.top.right.equalTo(self.contentView);
        }];
        
    }
    
    return self;
}

- (void)textViewDidChange:(UITextView *)textView
{
    CGRect bounds = textView.bounds;
    
    // 计算 text view 的高度
    CGSize maxSize = CGSizeMake(bounds.size.width, CGFLOAT_MAX);
    CGSize newSize = [textView sizeThatFits:maxSize];
    bounds.size = newSize;
    
    textView.bounds = bounds;
    
    // 让 table view 重新计算高度
    UITableView *tableView = [self tableView];
    [tableView beginUpdates];
    [tableView endUpdates];
    
    if ([self.delegate respondsToSelector:@selector(textViewCell:didChangeText:)]) {
        [self.delegate textViewCell:self didChangeText:textView.text];
    }
}

- (UITableView *)tableView
{
    UIView *tableView = self.superview;
    
    while (![tableView isKindOfClass:[UITableView class]] && tableView) {
        tableView = tableView.superview;
    }
    
    return (UITableView *)tableView;
}

//- (void)textViewDidChange:(UITextView *)textView
//{
//    if ([self.delegate respondsToSelector:@selector(textViewCell:didChangeText:)]) {
//        [self.delegate textViewCell:self didChangeText:textView.text];
//    }
//    
//    // 计算 text view 的高度
//
//    // 让 table view 重新计算高度
//
//}

@end
