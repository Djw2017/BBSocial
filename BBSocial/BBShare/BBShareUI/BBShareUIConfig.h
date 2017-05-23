//
//  BBShareUIConfig.h
//  BBShareSDK
//
//  Created by Dongjw on 17/5/14.
//  Copyright © 2017年 Babybus. All rights reserved.
//

#import "BBSocialPlatformConfig.h"

#pragma mark - 自定义分享界面回调
/**
 点击第一行分享按钮block回调
 
 @param shareType 分享类型
 */
typedef void(^BBShareClickShareItemHandler)(BBSocialPlatformType shareType);

/**
 点击第二行其它按钮block回调
 
 @param otherIndex 点击第N个，0开始
 */
typedef void(^BBShareClickOtherItemHandler)(NSInteger otherIndex);

/**
 取消点击
 */
typedef void(^BBShareClickCancelHandler)(void);


@interface BBShareUIConfig : NSObject

@end
