//
//  BBShare.m
//  BBShareSDK
//
//  Created by Dongjw on 17/5/14.
//  Copyright © 2017年 Babybus. All rights reserved.
//

#import <UMSocialCore/UMSocialCore.h>

#import "BBShare.h"

@implementation BBShare

/**
 直接分享,此接口不需要弹出分享界面直接进行分享（除微信、QQ、Pinterest平台外，这些平台会调用客户端进行分享）。

 @param content 内容对象
 @param type 平台类型
 @param result 返回事件
 */
+ (void)shareContent:(BBShareContent *)content
                type:(BBSocialPlatformType)type
              result:(BBSocialRequestCompletionHandler)result {

    UMSocialMessageObject *messageObject = [BBShareContent umSocialMessageObjectWithBBShareContent:content];
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:(UMSocialPlatformType)type
                                        messageObject:messageObject
                                currentViewController:[BBSocialCommon getCurrentViewController]
                                           completion:^(id data, NSError *error) {

       if (result) {
           if (error) {
                result(nil,error);
           }else{
               if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                   UMSocialShareResponse *resp = data;
                   //分享结果消息
                   if (!resp.message) {
                       result(@"share success",error);
                   }else {
                       result(resp.message,error);
                   }
               }else{
                    result(data,error);
               }
               
           }
       }
    }];
}

@end
