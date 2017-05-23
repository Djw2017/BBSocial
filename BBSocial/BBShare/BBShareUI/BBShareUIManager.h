//
//  BBShareUIManager.h
//  BBShareSDK
//
//  Created by Dongjw on 17/5/14.
//  Copyright © 2017年 Babybus. All rights reserved.
//

#import "BBShare.h"
#import "BBShareUIConfig.h"

#import "BBShareMenuItem.h"
#import "BBOtherMenuItem.h"

#define BBSHARE_TYPE_NUMBER(type) [NSNumber numberWithInteger:type]

/**
 调用分享视图
 */
@interface BBShareUIManager : NSObject

#pragma mark 自定义分享UI
/**
 显示自定义分享菜单,包含两行。
 第一行为分享菜单栏，点击返回分享结果。
 第二行为自定义栏，点击返回索引。
 
 @param shareList 自定义分享按钮模型集合
 @param otherList 自定义其它按钮模型集合
 @param content 分享内容
 @param result 分享回调
 @param clickOtherIndex 点击第二栏中自定义图标索引
 */
+ (void)showCustomShareList:(NSArray <BBShareMenuItem *> *)shareList
              withOtherList:(NSArray <BBOtherMenuItem *> *)otherList
                withContent:(BBShareContent *)content
                shareResult:(BBSocialRequestCompletionHandler)result
        clickOtherItemIndex:(BBShareClickOtherItemHandler)clickOtherIndex;

/**
 创建分享菜单项
 
 @param title 标题
 @param iconStr 图标
 @param shareType 分享平台
 @return 单个分享菜单项
 */
+ (BBShareMenuItem *)creatShareItemWithTitle:(NSString *)title
                                     iconStr:(NSString *)iconStr
                                   shareType:(BBSocialPlatformType)shareType;

/**
 创建自定义菜单项
 
 @param title 标题
 @param iconStr 图标
 @return 单个自定义菜单项
 */
+ (BBOtherMenuItem *)creatOtherItemWithTitle:(NSString *)title
                                    iconStr:(NSString *)iconStr;




#pragma mark 友盟分享UI
/**
 * 显示友盟分享菜单
 *
 * @param shareList 预定于平台数组@see BBSocialPlatformType。
 * @param content   分享内容
 * @param result    分享内容
 */
+ (void)showUmengShareList:(NSArray *)shareList
                    content:(BBShareContent *)content
                     result:(BBSocialRequestCompletionHandler)result;



@end
