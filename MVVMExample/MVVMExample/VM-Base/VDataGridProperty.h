//
//  VDataGridProperty.h
//  MVVMExample
//
//  Created by 岳潇洋 on 2018/8/23.
//  Copyright © 2018年 岳潇洋. All rights reserved.
//

#import "VProperty.h"
#import <UIKit/UIKit.h>
#import "VSelectBehavior.h"

@interface VDataGridProperty : VProperty

@property(weak,nonatomic)UICollectionView * gridView;

@property(strong,nonatomic)NSString * itemNib;

@property(strong,nonatomic)VSelectBehavior * select;

@end
