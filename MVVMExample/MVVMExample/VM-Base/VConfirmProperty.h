//
//  VConfirmProperty.h
//  MVVMExample
//
//  Created by 岳潇洋 on 2018/8/24.
//  Copyright © 2018年 岳潇洋. All rights reserved.
//

#import "VProperty.h"
#import <UIKit/UIKit.h>
#import "VBehavior.h"

@interface VConfirmProperty : VProperty

@property(weak,nonatomic)UIViewController * vc;

@property(weak,nonatomic)NSString * title;

@property(strong,nonatomic)VBehavior * sure;

@end
