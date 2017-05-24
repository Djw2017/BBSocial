# BBSocial

## Podfile

```ruby

platform :ios, '7.0'

target 'TargetName' do
pod 'BBSocial', 	:git => 'https://github.com/Djw2017/BBSocial.git'
end
```

## 初始化
依赖    UMengUShare：6.4.3版本，Masonry：1.0.2版本。

所以使用时，需要在“AppDelegate”引入 BBSocial.h”文件并且写入初始化key代码：

```
	[BBSocial setUmSocialAppkey:@"555555555555555555555"];
```

并且需要给分享的平台设置key值,

```
//设置微信的app的key和appSecret，redirectURL可为空
[BBSocial setPlaform:BBSocialPlatformType_WechatSession appKey:@"wx88888888888" appSecret:@"888888888888888888888" redirectURL:@"https://www.xxxxx.com"];
	    
//设置QQ的app的key和appSecret, redirectURL可为空
[BBSocial setPlaform:BBSocialPlatformType_QQ appKey:@"8888888888" appSecret:@"KKKKKKKKKKKKKK" redirectURL:@"https://www.xxxxx.com"];
	    
//设置微博的app的key和appSecret,redirectURL必须和微博后台设置一致
[BBSocial setPlaform:BBSocialPlatformType_Sina appKey:@"88888888" appSecret:@"DDDDDDDDDDDDDDDDDDDDD" redirectURL:@"http://sns.xxxxx.com/sina2/callback"];
```


### 直接分享单个平台，不使用UI界面
导入 “BBShare.h”

```
// 分享网页类型的数据,BBShareWebpageContent继承BBShareContent，目前分享类型仅支持网页、图片、纯文本
BBShareWebpageContent * content = [BBShareWebpageContent shareContentWithTitle:@"宝宝巴士首发,全球第一站！"
	                                                                     descr:@"精彩尽在宝宝巴士官方微博"
	                                                                 thBBImage:[UIImage imageNamed:@"pushToast"]];
content.webpageUrl = @"https://www.babybus.com";



[BBShare shareContent:content type:BBSharePlatformType_WechatSession result:^(id data, NSError *error) {
    NSLog(@"data====%@,error======%@",data,error);
}];
```


### 使用友盟UI界面进行分享
导入 #import "BBShareUIManager.h"

```
NSArray *ary = @[BBSHARE_TYPE_NUMBER(BBSharePlatformType_Sina),
                 BBSHARE_TYPE_NUMBER(BBSharePlatformType_QQ),
                 BBSHARE_TYPE_NUMBER(BBSharePlatformType_WechatTimeLine)];

[BBShareUIManager showUmengShareList:ary content:content result:^(id data, NSError *error) {
    NSLog(@"data====%@,error======%@",data,error);
}];
```

### 使用自定义UI界面进行分享
导入 #import "BBShareUIManager.h"

```
BBShareMenuItem *wechatTimeLineItem = [BBShareUIManager creatShareItemWithTitle:@"朋友圈"
                                                                        iconStr:@"share_WechatTimeline"
                                                                      shareType:BBSharePlatformType_WechatTimeLine];

BBShareMenuItem *wechatSessionItem = [BBShareUIManager creatShareItemWithTitle:@"微信好友"
	                                                            	   iconStr:@"share_WechatSession"
	                                                       			 shareType:BBSharePlatformType_WechatSession];

NSArray *shareList = @[wechatTimeLineItem,wechatSessionItem];

BBOtherMenuItem *collectItem = [BBShareUIManager creatOtherItemWithTitle:@"收藏"
	                                                         	 iconStr:@"share_collect"];

BBOtherMenuItem *reportItem = [BBShareUIManager creatOtherItemWithTitle:@"举报"
													            iconStr:@"share_report"];

NSArray *otherList = @[collectItem,reportItem];


[BBShareUIManager showCustomShareList:shareList withOtherList:otherList withContent:content shareResult:^(id data, NSError *error) {
    NSLog(@"data====%@,error======%@",data,error);
} clickOtherItemIndex:^(NSInteger otherIndex) {
	NSLog(@"%ld",(long)otherIndex);
}];
```