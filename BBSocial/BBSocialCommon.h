//
//  BBSocialCommon.h
//  BBShareSDK
//
//  Created by Dongjw on 17/5/15.
//  Copyright © 2017年 Babybus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <UMSocialCore/UMSocialPlatformConfig.h>

#import "BBSocialPlatformConfig.h"

/**
 分享通用工具类
 */
@interface BBSocialCommon : NSObject

#pragma mark - image
/**
 * 缩放图片
 *
 * @param img  图片
 * @param size 要缩放的大小
 *
 * @return 缩放后的图片
 */
+ (UIImage *)scaleImage:(UIImage *)img toSize:(CGSize)size;

/**
 * 缩放图片数据
 *
 * @param imgData 图片数据
 * @param size    缩放目标大小
 *
 * @return 缩放后的图片数据
 */
+ (NSData *)scaleToSizeWithImageData:(NSData *)imgData size:(CGSize)size;

/**
 从宝宝巴士分享平台转换为友盟分享平台
 
 @param bbShareType 宝宝巴士平台类型
 @return 友盟平台类型
 */
+ (UMSocialPlatformType)umSocialTypeWithBBShareType:(BBSocialPlatformType)bbShareType;

/**
 获取当前控制器
 
 @return 当前控制器
 */
+ (UIViewController *)getCurrentViewController;

@end
