//
//  LoginVM.m
//  MVVMExample
//
//  Created by 岳潇洋 on 2018/8/2.
//  Copyright © 2018年 岳潇洋. All rights reserved.
//

#import "LoginVM.h"
#import "LoginModel.h"

@interface LoginVM()

@property(weak,nonatomic)id<ILoginModel> loginModel;

@end

@implementation LoginVM

///MARK: 开始
- (void)start {
    NSString * account = nil;
    NSString * pwd = nil;
    [self getLastAccount:&account pwd:&pwd];
    self.account = account;
    self.password = pwd;
}

///MARK: 内部方法

//取出上次登陆成功的账号
- (void)getLastAccount:(NSString **)account pwd:(NSString **)pwd {
    *account=[[NSUserDefaults standardUserDefaults] objectForKey:@"last_account"];
    *pwd=[[NSUserDefaults standardUserDefaults] objectForKey:@"last_pwd"];
}

//缓存当前登陆成功的账号
- (void)setLastAccount:(NSString *)account pwd:(NSString *)pwd {
    [[NSUserDefaults standardUserDefaults] setObject:account forKey:@"last_account"];
    [[NSUserDefaults standardUserDefaults] setObject:pwd forKey:@"last_pwd"];
}

//验证账号
- (BOOL)validateAccount:(NSString *)account error:(NSString **)err {
    if (!account)return NO;
    NSRegularExpression * regular=[NSRegularExpression regularExpressionWithPattern:@"^[0-9]{11}$" options:0 error:nil];
    if ([regular numberOfMatchesInString:account options:0 range:NSMakeRange(0, account.length)]>0) {
        return YES;
    }
    else{
        *err=@"请输入11数字作为账号！";
        return NO;
    }
}

//验证密码
- (BOOL)validatePwd:(NSString *)pwd error:(NSString **)err {
    if (!pwd)return NO;
    NSRegularExpression * regular=[NSRegularExpression regularExpressionWithPattern:@"^[^\u4e00-\u9fa5]{6,11}$" options:0 error:nil];
    if ([regular numberOfMatchesInString:pwd options:0 range:NSMakeRange(0, pwd.length)]>0) {
        return YES;
    }
    else {
        *err=@"请输入6-11位非汉字字符作为密码！";
        return NO;
    }
}

//登陆
- (void)log_in {
    NSString * err=nil;
    if (![self validateAccount:self.account error:&err] || ![self validatePwd:self.password error:&err]) {
        self.logErr = err;
    }
    else {
        self.logging=YES;
        [self.loginModel loginToServer:self.account pwd:self.password handler:^(NSError *err) {
            self.logging=NO;
            if (err) {
                self.logErr = err.description;
            }
            else{
                self.logErr = nil;
                self.main = [MainViewController new];
            }
        }];
    }
}

//MARK: 懒加载

- (id<ILoginModel>)loginModel {
    if (!_loginModel) {
        _loginModel=[LoginModel shared];//如果想切换底层的登陆模块，修改这里
    }
    return _loginModel;
}

- (VMCommand *)login {
    if (!_login) {
        typeof(self) weakSelf = self;
        _login = [[VMCommand alloc] initWithBlock:^(id data) {
            [weakSelf log_in];
        }];
    }
    return _login;
}

@end
