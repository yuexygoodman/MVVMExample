//
//  VEditBehavior.m
//  MVVMExample
//
//  Created by 岳潇洋 on 2018/8/8.
//  Copyright © 2018年 岳潇洋. All rights reserved.
//

#import "VEditBehavior.h"
#import <UIKit/UIKit.h>

@implementation VEditBehavior

- (id)initWithView:(UIView *)view {
    if ([self init]) {
        view.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [view addGestureRecognizer:tap];
    }
    return self;
}

- (void)tap:(UITapGestureRecognizer *)sender {
    [sender.view endEditing:YES];
    [self invokeWithData:nil];
}

@end
