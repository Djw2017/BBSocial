//
//  BBShareView.h
//  Baby_Recommend
//
//  Created by 刘艳妮 on 17/4/1.
//  Copyright © 2017年 Babybus. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Masonry.h"

#import "BBShareUIConfig.h"

#import "BBShareMenuItem.h"
#import "BBOtherMenuItem.h"

// 设备全屏高
#define SCREEN_FULL_HEIGHT  [[UIScreen mainScreen] bounds].size.height
// 设备全屏宽
#define SCREEN_FULL_WIDTH [[UIScreen mainScreen] bounds].size.width
// 是否高清设备
#define IS_RETINA ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && ([UIScreen mainScreen].scale == 2.0))

// 颜色
#define COLOR_WIHT_HEX_ALPHA(rgbValue,alphaValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:alphaValue]


@interface BBShareView : UIView

- (instancetype)initWithFrame:(CGRect)frame
                withShareList:(NSMutableArray <BBShareMenuItem *> *)shareList
                withOtherList:(NSArray <BBOtherMenuItem *> *)otherList;

/**
 点击各个item,包含第一行与第二行

 @param shareItemHandler 点击第一行分享按钮
 @param otherItemHandler 点击第二行其它按钮
 @param cancelHandler 取消操作
 */
- (void)clickShareItem:(BBShareClickShareItemHandler )shareItemHandler
    withClickOtherItem:(BBShareClickOtherItemHandler )otherItemHandler
        withCickCancel:(BBShareClickCancelHandler )cancelHandler;


/**
 显示
 */
- (void)show;

/**
 移除
 */
- (void)remove;

@end
