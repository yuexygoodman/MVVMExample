//
//  LoginView.h
//  MVVMExample
//
//  Created by 岳潇洋 on 2018/8/8.
//  Copyright © 2018年 岳潇洋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VLoadingProperty.h"
#import "VAlertProperty.h"
#import "VNavProperty.h"
#import "VEditBehavior.h"

@interface LoginView : UIView
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (strong,nonatomic) VLoadingProperty * logging;
@property (strong,nonatomic) VAlertProperty * logErr;
@property (strong,nonatomic) VNavProperty * toMain;
@property (strong,nonatomic) VEditBehavior * editEnabled;

- (id)initWithFrame:(CGRect)frame controller:(UIViewController *)vc;
@end
