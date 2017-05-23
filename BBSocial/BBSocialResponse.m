//
//  BBSocialResponse.m
//  BBSocial
//
//  Created by Dongjw on 17/5/23.
//  Copyright © 2017年 Babybus. All rights reserved.
//

#import "BBSocialResponse.h"

@implementation BBSocialResponse

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
