//
//  LoginView.m
//  MVVMExample
//
//  Created by 岳潇洋 on 2018/8/8.
//  Copyright © 2018年 岳潇洋. All rights reserved.
//

#import "LoginView.h"

@interface LoginView()

@property(weak,nonatomic)UIViewController * vc;

@end

@implementation LoginView

///MARK: 初始化
- (id)initWithFrame:(CGRect)frame controller:(UIViewController *)vc {
    if ([self initWithFrame:frame]) {
        self.vc = vc;
        NSArray * arr=[[NSBundle mainBundle] loadNibNamed:@"LoginView" owner:self options:nil];
        UIView * view = arr.firstObject;
        if (view) {
            [self addSubview:view];
            view.frame=self.bounds;
            
            //初始化属性和行为
            [self logging];
            [self logErr];
            [self toMain];
            [self editEnabled];
        }
    }
    return self;
}

///MARK: 属性
- (VLoadingProperty *)logging {
    if (!_logging) {
        _logging= [VLoadingProperty new];
        _logging.superView=self;
    }
    return _logging;
}

- (VAlertProperty *)logErr {
    if (!_logErr) {
        _logErr = [VAlertProperty new];
        _logErr.vc = self.vc;
    }
    return _logErr;
}

- (VNavProperty *)toMain {
    if (!_toMain) {
        _toMain = [VNavProperty new];
        _toMain.nav = self.vc.navigationController;
    }
    return _toMain;
}

///MARK: 行为
- (VEditBehavior *)editEnabled {
    if (!_editEnabled) {
        _editEnabled = [[VEditBehavior alloc] initWithView:self];
    }
    return _editEnabled;
}

@end
