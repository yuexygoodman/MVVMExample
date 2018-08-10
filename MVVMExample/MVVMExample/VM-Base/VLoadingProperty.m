//
//  VLoadingProperty.m
//  MVVMExample
//
//  Created by 岳潇洋 on 2018/8/8.
//  Copyright © 2018年 岳潇洋. All rights reserved.
//

#import "VLoadingProperty.h"
#import <UIKit/UIKit.h>

@implementation VLoadingProperty

- (void)setValue:(id)value {
    NSAssert([value isKindOfClass:[NSNumber class]], @"this property just support boolean value.");
    [super setValue:value];
    if ([value boolValue]) {
        UIActivityIndicatorView * indicator=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        indicator.tag=1000;
        [self.superView addSubview:indicator];
        indicator.center=self.superView.center;
        [indicator startAnimating];
    }
    else {
        UIActivityIndicatorView * indicator=[self.superView viewWithTag:1000];
        [indicator stopAnimating];
        [indicator removeFromSuperview];
    }
}

@end
