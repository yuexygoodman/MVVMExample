//
//  VMCommand.h
//  MVVMExample
//
//  Created by 岳潇洋 on 2018/8/6.
//  Copyright © 2018年 岳潇洋. All rights reserved.
//

#import <Foundation/Foundation.h>
//用于ViewModel层
@interface VMCommand : NSObject

- (id)initWithBlock:(void(^)(id data)) block;

- (void)executeWithData:(id)data;

@end
