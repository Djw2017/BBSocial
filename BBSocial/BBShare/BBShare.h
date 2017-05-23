//
//  BBShare.h
//  BBShareSDK
//
//  Created by Dongjw on 17/5/14.
//  Copyright © 2017年 Babybus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "BBSocial.h"

@interface BBShare : NSObject

/**
 直接分享,目前仅支持QQ、微信、微博，如需集成其它平台，请直接pod,例如：
 # 集成Facebook/Messenger
 pod ‘UMengUShare/Social/Facebook'
 
 详见：http://dev.umeng.com/social/ios/quick-integration#1_2
 
 此接口不需要弹出分享界面直接进行分享（除微信、QQ、Pinterest平台外，这些平台会调用客户端进行分享），。
 
 @param content 内容对象
 @param type 平台类型
 @param result 返回事件
 */
+ (void)shareContent:(BBShareContent *)content
                type:(BBSocialPlatformType)type
              result:(BBSocialRequestCompletionHandler)result;


@end
