//
//  V2MBinder.h
//  MVVMExample
//
//  Created by 岳潇洋 on 2018/8/6.
//  Copyright © 2018年 岳潇洋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VMCommand.h"
#import "VBehavior.h"
#import "VProperty.h"

@interface V2MBinder : NSObject

//单例
+ (instancetype)shared;

//绑定
- (void)bindView:(id)view withVM:(id)vm mappings:(NSDictionary *)mappings;

@end
