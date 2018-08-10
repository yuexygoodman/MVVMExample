//
//  VTouchBehavior.m
//  MVVMExample
//
//  Created by 岳潇洋 on 2018/8/8.
//  Copyright © 2018年 岳潇洋. All rights reserved.
//

#import "VTouchBehavior.h"
#import <UIKit/UIKit.h>

@implementation VTouchBehavior

- (id)initWithControl:(UIControl*)control touchType:(UIControlEvents)type {
    if ([self init]) {
        [control addTarget:self action:@selector(touch:) forControlEvents:type];
    }
    return self;
}

- (void)touch:(id)sender {
    [self invokeWithData:nil];
}

@end
