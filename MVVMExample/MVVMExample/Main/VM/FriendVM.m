//
//  FriendVM.m
//  MVVMExample
//
//  Created by 岳潇洋 on 2018/8/22.
//  Copyright © 2018年 岳潇洋. All rights reserved.
//

#import "FriendVM.h"

@interface FriendVM()

@property(strong,nonatomic)Friend * friend;

@end
/**
 viewmodel与model之间的绑定并没有去实现，实在闲麻烦。
 */
@implementation FriendVM

- (id)initWithFriend:(Friend *)friend {
    if([self init]){
        self.friend=friend;
    }
    return self;
}

- (void)start {
    self.logo = self.friend.headImg;
    self.name = self.friend.nickName;
    self.signture = self.friend.signature;
}

@end
