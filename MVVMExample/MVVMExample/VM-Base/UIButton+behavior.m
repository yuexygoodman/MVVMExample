//
//  UIButton+behavior.m
//  MVVMExample
//
//  Created by 岳潇洋 on 2018/8/8.
//  Copyright © 2018年 岳潇洋. All rights reserved.
//

#import "UIButton+behavior.h"
#import <objc/runtime.h>

const char kBehaviorTouchKey;

@implementation UIButton (behavior)

- (VTouchBehavior *)touch {
    VTouchBehavior * touch=objc_getAssociatedObject(self, &kBehaviorTouchKey);
    if (!touch) {
        touch = [[VTouchBehavior alloc] initWithControl:self touchType:UIControlEventTouchUpInside];
        objc_setAssociatedObject(self, &kBehaviorTouchKey, touch, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return touch;
}

- (void)setTouch:(VTouchBehavior *)touch {
    return;
}

@end
