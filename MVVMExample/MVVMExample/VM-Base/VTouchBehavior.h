//
//  VTouchBehavior.h
//  MVVMExample
//
//  Created by 岳潇洋 on 2018/8/8.
//  Copyright © 2018年 岳潇洋. All rights reserved.
//

#import "VBehavior.h"
#import <UIKit/UIKit.h>

@interface VTouchBehavior : VBehavior

- (id)initWithControl:(UIControl *)control touchType:(UIControlEvents)type;

@end
