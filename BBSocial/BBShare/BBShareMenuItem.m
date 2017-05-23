//
//  BBShareMenuItem.m
//  BBShare
//
//  Created by Dongjw on 17/5/15.
//  Copyright © 2017年 Babybus. All rights reserved.
//

#import "BBShareMenuItem.h"

@implementation BBShareMenuItem

/**
 * 初始化分享按钮项目
 *
 * @param title        标题
 * @param iconStr      图标
 *
 * @return 分享按钮模型
 */
- (id)initWithTitle:(NSString *)title
               icon:(NSString *)iconStr
          shareType:(BBSocialPlatformType)shareType {
    
    if (self = [super init])
    {
        self.title = title;
        self.iconStr = iconStr;
        self.shareType = shareType;
    }
    
    return self;
}

@end
