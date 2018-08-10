//
//  VBehavior.m
//  MVVMExample
//
//  Created by 岳潇洋 on 2018/8/6.
//  Copyright © 2018年 岳潇洋. All rights reserved.
//

#import "VBehavior.h"

@interface VBehavior()

@property(weak,nonatomic)VMCommand * command;

@end

@implementation VBehavior

- (void)attachTo:(VMCommand *)command {
    self.command = command;
}

- (void)invokeWithData:(id)data {
    if (self.command) {
        [self.command executeWithData:data];
    }
}

@end
