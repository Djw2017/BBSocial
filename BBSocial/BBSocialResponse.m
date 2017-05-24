//
//  BBSocialResponse.m
//  BBSocial
//
//  Created by Dongjw on 17/5/23.
//  Copyright © 2017年 Babybus. All rights reserved.
//

#import "BBSocialResponse.h"

#import <UMSocialCore/UMSocialCore.h>

@implementation BBSocialResponse

@end




@implementation BBSocialShareResponse

+ (BBSocialShareResponse *)shareResponseWithUMResponse:(id)response {
    
    UMSocialShareResponse *resp = response;
    BBSocialShareResponse *bbResponse =  [[BBSocialShareResponse alloc] init];
    bbResponse.uid = resp.uid;
    bbResponse.openid = resp.openid;
    bbResponse.refreshToken = resp.refreshToken;
    bbResponse.expiration = resp.expiration;
    bbResponse.accessToken = resp.accessToken;
    bbResponse.unionId = resp.unionId;
    bbResponse.message = resp.message;
    
    return bbResponse;
}

@end




@implementation BBSocialUserInfoResponse

- (NSString *)description {
    
    return [NSString stringWithFormat:@"uid: %@,    openid: %@, accessToken: %@,    refreshToken: %@,   expiration: %@, name: %@,   iconurl: %@,    unionGender: %@,  gender: %@,   originalResponse: %@",
            self.uid,
            self.openid,
            self.accessToken,
            self.refreshToken,
            self.expiration,
            self.name,
            self.iconurl,
            self.unionGender,
            self.gender,
            self.originalResponse];
}

@end
