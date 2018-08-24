//
//  FriendVM.h
//  MVVMExample
//
//  Created by 岳潇洋 on 2018/8/22.
//  Copyright © 2018年 岳潇洋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Friend.h"
#import "IViewModel.h"

@interface FriendVM : NSObject<IViewModel>

@property(strong,nonatomic)UIImage * logo;

@property(strong,nonatomic)NSString * name;

@property(strong,nonatomic)NSString * signture;

- (id)initWithFriend:(Friend *)friend;

- (void)start;

@end
