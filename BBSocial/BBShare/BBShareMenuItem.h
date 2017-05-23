//
//  BBShareMenuItem.h
//  BBShare
//
//  Created by Dongjw on 17/5/15.
//  Copyright © 2017年 Babybus. All rights reserved.
//

#import "BBShareMenuItemProtocol.h"

#import "BBSocialPlatformConfig.h"

/**
 自定义分享界面中分享按钮
 */
@interface BBShareMenuItem : NSObject <BBShareMenuItemProtocol>

/**
 * 标题
 */
@property (nonatomic, strong) NSString *title;

/**
 * 分享图标
 */
@property (nonatomic, copy) NSString *iconStr;

/**
 * 分享类型
 */
@property (nonatomic, assign) BBSocialPlatformType shareType;


/**
 * 初始化分享按钮
 *
 * @param title        标题
 * @param iconStr      图标
 *
 * @return 分享按钮模型
 */
- (id)initWithTitle:(NSString *)title
               icon:(NSString *)iconStr
          shareType:(BBSocialPlatformType)shareType;


@end
