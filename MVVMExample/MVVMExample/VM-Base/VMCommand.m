//
//  VMCommand.m
//  MVVMExample
//
//  Created by 岳潇洋 on 2018/8/6.
//  Copyright © 2018年 岳潇洋. All rights reserved.
//

#import "VMCommand.h"

@interface VMCommand()

@property(copy,nonatomic)void(^block)(id data);

@end

@implementation VMCommand

- (id)initWithBlock:(void (^)(id data))block {
    if (self = [self init]) {
        self.block = block;
    }
    return self;
}

- (void)executeWithData:(id)data {
    if (self.block) {
        self.block(data);
    }
}

@end
