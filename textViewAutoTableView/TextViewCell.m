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
{
    UITextView *_textView;
}

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
        
        [self.contentView addSubview:_textView];
        
        
        [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.top.right.equalTo(self.contentView);
        }];
        
//        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.offset(0);
//            make.bottom.mas_equalTo(_textView).offset(0);
//        }];
    }
    
    return self;
}

@end
