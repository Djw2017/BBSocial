//
//  BBShareUIManager.m
//  BBShareSDK
//
//  Created by Dongjw on 17/5/14.
//  Copyright © 2017年 Babybus. All rights reserved.
//

#import <UShareUI/UShareUI.h>

#import "BBShareUIManager.h"

#import "BBShareView.h"

@implementation BBShareUIManager

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
        clickOtherItemIndex:(BBShareClickOtherItemHandler)clickOtherIndex {
  
    // 移除不支持分享的平台
    NSMutableArray *ary = [self removeisUnSupport:shareList];

    if ([shareList count] < 1 || [otherList count] < 1) {
        return;
    }
    
    // 弹出自定义分享UI界面
    BBShareView *shareView = [[BBShareView alloc] initWithFrame:CGRectZero withShareList:ary withOtherList:otherList];
    [shareView clickShareItem:^(BBSocialPlatformType shareType) {
        
        [shareView remove];
        
        // 点击第一行分享平台按钮回调
        [BBShare shareContent:content type:shareType result:^(id data, NSError *error) {
            result(data,error);
        }];
        
    } withClickOtherItem:^(NSInteger otherIndex) {
        [shareView remove];
        clickOtherIndex(otherIndex);
    } withCickCancel:^{
        [shareView remove];
    }];
    
    [shareView show];
}

/**
 创建自定义分享菜单项
 
 @param title 标题
 @param iconStr 图标
 @param shareType 分享平台
 @return 单个分享菜单项
 */
+ (BBShareMenuItem *)creatShareItemWithTitle:(NSString *)title
                                     iconStr:(NSString *)iconStr
                                   shareType:(BBSocialPlatformType)shareType {
    
    BBShareMenuItem *itemType = [[BBShareMenuItem alloc] initWithTitle:title
                                                                  icon:iconStr
                                                             shareType:shareType];
    return itemType;
}

/**
 创建自定义菜单项
 
 @param title 标题
 @param iconStr 图标
 @return 单个自定义菜单项
 */
+ (BBOtherMenuItem *)creatOtherItemWithTitle:(NSString *)title
                                     iconStr:(NSString *)iconStr {
    BBOtherMenuItem *itemType = [[BBOtherMenuItem alloc] initWithTitle:title
                                                                  icon:iconStr];
    return itemType;
}




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
                    result:(BBSocialRequestCompletionHandler)result {
    
    NSMutableArray *preDefinePlatforms = [self removeisUnSupport:shareList];
    
    [UMSocialUIManager setPreDefinePlatforms:preDefinePlatforms];
    //显示分享面板
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType,
                                                                             NSDictionary *userInfo) {
        
        // 根据获取的platformType确定所选平台进行下一步操作
        [BBShare shareContent:content type:(BBSocialPlatformType)platformType result:^(id data, NSError *error) {
            
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
    }];
}




#pragma mark - 
/**
 移除不支持分享的平台

 @param shareList 需要分享的平台
 @return 需要分享且已安装并的平台
 */
+ (NSMutableArray *)removeisUnSupport:(NSArray *)shareList {
    
    NSMutableArray *ary = [NSMutableArray array];
    
    for (int i = 0; i < shareList.count; i ++) {
        
        if ([shareList[i] isKindOfClass:[NSNumber class]]) {
            // 友盟界面分享，分享平台数组只包含类型
            BBSocialPlatformType type = (BBSocialPlatformType)[shareList[i] integerValue];
            if (![BBSocial isSupport:type]) {
                
                if (type == BBSocialPlatformType_Sina) {
                    [ary addObject:shareList[i]];
                }
            }else {
                [ary addObject:shareList[i]];
            }
            
        }else {
            // 自定义界面分享
            BBShareMenuItem *item = shareList[i];
            if (![BBSocial isSupport:item.shareType]) {
                if (item.shareType == BBSocialPlatformType_Sina) {
                    [ary addObject:shareList[i]];
                }
            }else {
                [ary addObject:shareList[i]];
            }
        }
    }
    return ary;
}

@end
