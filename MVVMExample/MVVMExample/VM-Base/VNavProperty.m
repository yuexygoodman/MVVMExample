//
//  VNavProperty.m
//  MVVMExample
//
//  Created by 岳潇洋 on 2018/8/8.
//  Copyright © 2018年 岳潇洋. All rights reserved.
//

#import "VNavProperty.h"

@implementation VNavProperty

- (void)setValue:(id)value {
    NSAssert([value isKindOfClass:[UIViewController class]], @"this property just support controller value");
    [super setValue:value];
    [self.nav pushViewController:value animated:YES];
}

@end
