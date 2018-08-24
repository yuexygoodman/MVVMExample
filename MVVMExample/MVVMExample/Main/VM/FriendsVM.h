//
//  FriendsVM.h
//  MVVMExample
//
//  Created by 岳潇洋 on 2018/8/22.
//  Copyright © 2018年 岳潇洋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FriendVM.h"
#import "VMCommand.h"
#import "IViewModel.h"

@interface FriendsVM : NSObject<IViewModel>

@property(strong,nonatomic)NSArray<FriendVM *> * friends;

@property(strong,nonatomic)VMCommand * rm;

@property(strong,nonatomic)NSString * confirm;

@property(strong,nonatomic)VMCommand * rm_hard;

@property(strong,nonatomic)NSString * rmError;

- (void)start;

@end
