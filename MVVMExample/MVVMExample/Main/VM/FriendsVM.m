//
//  FriendsVM.m
//  MVVMExample
//
//  Created by 岳潇洋 on 2018/8/22.
//  Copyright © 2018年 岳潇洋. All rights reserved.
//

#import "FriendsVM.h"
#import "FriendModel.h"

@interface FriendVM()

@property(strong,nonatomic)Friend * friend;

@end

@interface FriendsVM()

@property(weak,nonatomic)id<IFriendModel> friendModel;

@property(weak,nonatomic)FriendVM * onrm;

@end

@implementation FriendsVM

//开始
- (void)start {
    [self.friendModel getFriendsWithHandler:^(NSArray<Friend *> *friends, NSError *err) {
        NSMutableArray * arr = [NSMutableArray new];
        for (Friend * friend in friends) {
            FriendVM * vm = [[FriendVM alloc] initWithFriend:friend];
            [arr addObject:vm];
        }
        self.friends = [arr copy];
    }];
}

//删除
- (void)rmFriend {
    if (self.onrm.friend.intimacy>50) {
        self.confirm = [NSString stringWithFormat:@"你跟%@的亲密度达到了%d，仍然要删除Ta吗？",self.onrm.friend.nickName,(int)self.onrm.friend.intimacy];
    }
    else {
        [self sureRM];
    }
}

//确定删除
- (void)sureRM {
    [self.friendModel deleteFriend:self.onrm.friend handler:^(NSError *err) {
        if (err) {
            self.rmError = err.description;
        }
        else{
            NSMutableArray * muti = [self.friends mutableCopy];
            [muti removeObject:self.onrm];
            self.friends = [muti copy];
        }
    }];
}

///MARK: 懒加载
- (id<IFriendModel>)friendModel {
    if (!_friendModel) {
        _friendModel=[FriendModel shared];
    }
    return _friendModel;
}

- (VMCommand *)rm {
    if (!_rm) {
        __weak typeof(self) weakSelf = self;
        _rm = [[VMCommand alloc] initWithBlock:^(id data) {
            NSInteger index = [data integerValue];
            weakSelf.onrm = self.friends[index];
            [weakSelf rmFriend];
        }];
    }
    return _rm;
}

- (VMCommand *)rm_hard {
    if (!_rm_hard) {
        __weak typeof(self) weakSelf = self;
        _rm_hard = [[VMCommand alloc] initWithBlock:^(id data) {
            [weakSelf onrm];
        }];
    }
    return _rm_hard;
}

@end
