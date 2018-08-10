//
//  VBehavior.h
//  MVVMExample
//
//  Created by 岳潇洋 on 2018/8/6.
//  Copyright © 2018年 岳潇洋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VMCommand.h"

@interface VBehavior : NSObject

- (void)attachTo:(VMCommand *)command;

- (void)invokeWithData:(id)data;

@end
