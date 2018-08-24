//
//  VConfirmProperty.m
//  MVVMExample
//
//  Created by 岳潇洋 on 2018/8/24.
//  Copyright © 2018年 岳潇洋. All rights reserved.
//

#import "VConfirmProperty.h"

@implementation VConfirmProperty

- (VBehavior *)sure {
    if (!_sure) {
        _sure = [VBehavior new];
    }
    return _sure;
}

- (void)setValue:(id)value {
    NSAssert(value==nil || [value isKindOfClass:[NSString class]], @"this property just support string value");
    [super setValue:value];
    if (value) {
        __weak typeof(self) weakSelf=self;
        UIAlertController * alert=[UIAlertController alertControllerWithTitle:self.title message:value preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self.sure invokeWithData:nil];
            weakSelf.value=nil;
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            weakSelf.value=nil;
        }]];
        [self.vc presentViewController:alert animated:YES completion:nil];
    }
}

@end
