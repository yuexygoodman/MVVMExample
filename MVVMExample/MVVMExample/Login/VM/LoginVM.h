//
//  LoginVM.h
//  MVVMExample
//
//  Created by 岳潇洋 on 2018/8/2.
//  Copyright © 2018年 岳潇洋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VMCommand.h"
#import "MainViewController.h"

@interface LoginVM : NSObject

@property(assign,nonatomic)BOOL logging;//正在登陆

@property(strong,nonatomic)MainViewController *main;//登陆成功后有效

@property(strong,nonatomic)NSString * logErr;//登陆失败错误

@property(strong,nonatomic)NSString * account;//输入账号

@property(strong,nonatomic)NSString * password;//输入密码

@property(strong,nonatomic)VMCommand * login;//登陆操作

- (void)start;

@end
