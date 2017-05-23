//
//  BBLogin.m
//  BBSocial
//
//  Created by Dongjw on 17/5/23.
//  Copyright © 2017年 Babybus. All rights reserved.
//

#import <UMSocialCore/UMSocialCore.h>

#import "BBLogin.h"
#import "BBSocialCommon.h"
#import "BBSocialResponse.h"

@implementation BBLogin

/**
 授权并获取用户信息

 @param platformType 平台类型 @see BBSocialPlatformType
 @param completion 回调  @see BBSocialUserInfoResponse
 */
+ (void)getUserInfoForPlatform:(BBSocialPlatformType)platformType completion:(BBSocialRequestCompletionHandler)completion {
    
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:(UMSocialPlatformType)platformType
                                        currentViewController:nil
                                                   completion:^(id result, NSError *error) {
        
       UMSocialUserInfoResponse *resp = result;

       BBSocialUserInfoResponse *bbResponse = [[BBSocialUserInfoResponse alloc] init];
       bbResponse.uid = resp.uid;
       bbResponse.openid = resp.openid;
       bbResponse.accessToken = resp.accessToken;
       bbResponse.refreshToken = resp.refreshToken;
       bbResponse.expiration = resp.expiration;
       
       bbResponse.name = resp.name;
       bbResponse.iconurl = resp.iconurl;
       bbResponse.unionGender = resp.unionGender;
       bbResponse.gender = resp.gender;
                                                       
       bbResponse.originalResponse = resp.originalResponse;

       completion(bbResponse,error);
    }];
}

@end
