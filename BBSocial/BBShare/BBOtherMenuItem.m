//
//  BBOtherMenuItem.m
//  BBShare
//
//  Created by Dongjw on 17/5/18.
//  Copyright © 2017年 Babybus. All rights reserved.
//

#import "BBOtherMenuItem.h"

@implementation BBOtherMenuItem

/**
 * 初始化自定义按钮
 *
 * @param title        标题
 * @param iconStr      图标
 *
 * @return 自定义按钮模型
 */
- (id)initWithTitle:(NSString *)title
               icon:(NSString *)iconStr {
    
    if (self = [super init])
    {
        self.title = title;
        self.iconStr = iconStr;
    }
    
    return self;
}

@end
