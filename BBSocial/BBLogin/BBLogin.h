//
//  BBLogin.h
//  BBSocial
//
//  Created by Dongjw on 17/5/23.
//  Copyright © 2017年 Babybus. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BBSocialPlatformConfig.h"

@interface BBLogin : NSObject

/**
 授权并获取用户信息
 
 @param platformType 平台类型 @see BBSocialPlatformType
 @param completion 回调 @see BBSocialUserInfoResponse
 */
+ (void)getUserInfoForPlatform:(BBSocialPlatformType)platformType completion:(BBSocialRequestCompletionHandler)completion;

@end
