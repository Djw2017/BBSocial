//
//  BBShareButton.m
//  BBShare
//
//  Created by Dongjw on 17/5/18.
//  Copyright © 2017年 Babybus. All rights reserved.
//

#import "BBShareButton.h"

#import "BBShareView.h"

@interface BBShareButton() {
    UIImageView * _imageView;
    UILabel *_label;
}
@end

@implementation BBShareButton

-(instancetype)init{
    self = [super init];
    if(self){
        
        _imageView = [[UIImageView alloc]init];
        [self addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(0);
            make.left.equalTo(self).offset(8);
            make.right.equalTo(self).offset(-8);
            make.height.equalTo(_imageView.mas_width);
        }];
        
        _label = [[UILabel alloc]init];
        _label.text = @"分享平台";
        _label.textColor = COLOR_WIHT_HEX_ALPHA(0x323439,1);
        _label.font = [UIFont systemFontOfSize:12];
        [self addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(_imageView.mas_bottom).offset(4);
            make.bottom.equalTo(self).offset(0);
        }];
        
    }
    return self;
}

-(void)fillDataWithTopic:(NSString *)topic withImageStr:(NSString *)imageStr{
    _label.text=topic;
    [_imageView setImage:[UIImage imageNamed:imageStr]];
}

-(void)fillShareDataWithTitle:(NSString *)title imageStr:(NSString *)imageStr {
    _label.text=title;
    [_imageView setImage:[UIImage imageNamed:imageStr]];
    [_label mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(_imageView.mas_bottom).offset(4);
    }];
}


@end
