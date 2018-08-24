//
//  LogViewController.m
//  MVVMExample
//
//  Created by 岳潇洋 on 2018/8/9.
//  Copyright © 2018年 岳潇洋. All rights reserved.
//

#import "LogViewController.h"
#import "LoginVM.h"
#import "LoginView.h"
#import "V2MBinder.h"

@interface LogViewController ()
@property (strong,nonatomic) LoginView * loginView;
@property (strong,nonatomic) LoginVM * vm;
@end

@implementation LogViewController

///MARK: 懒加载view,viewmodel

- (LoginVM *)vm {
    if (!_vm) {
        _vm= [LoginVM new];
    }
    return _vm;
}

- (LoginView *)loginView {
    if (!_loginView) {
        _loginView = [[LoginView alloc] initWithFrame:self.view.bounds controller:self];
    }
    return _loginView;
}

///MARK: 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.loginView];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [[V2MBinder shared] registerMappings:@{
                                               @"accountField.text":@"account",
                                               @"pwdField.text":@"password",
                                               @"loginBtn.touch":@"login",
                                               @"logging":@"logging",
                                               @"logErr":@"logErr",
                                               @"toMain":@"main"
                                               } betweenView:LoginView.class andVM:LoginVM.class];
    });
    [[V2MBinder shared]
     bindView:self.loginView
     withVM:self.vm];
    [self.vm start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
