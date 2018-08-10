//
//  VAlertProperty.m
//  MVVMExample
//
//  Created by 岳潇洋 on 2018/8/8.
//  Copyright © 2018年 岳潇洋. All rights reserved.
//

#import "VAlertProperty.h"

@implementation VAlertProperty

- (void)setValue:(id)value {
    NSAssert(value==nil || [value isKindOfClass:[NSString class]], @"this property just support string value");
    [super setValue:value];
    if (value) {
        UIAlertController * alert=[UIAlertController alertControllerWithTitle:self.title message:value preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self.vc presentViewController:alert animated:YES completion:nil];
        _value=nil;
    }
}

@end
