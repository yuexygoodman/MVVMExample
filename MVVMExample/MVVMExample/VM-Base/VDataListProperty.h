//
//  VDataListProperty.h
//  MVVMExample
//
//  Created by 岳潇洋 on 2018/8/23.
//  Copyright © 2018年 岳潇洋. All rights reserved.
//

#import "VProperty.h"
#import <UIKit/UIKit.h>
#import "VSelectBehavior.h"

@interface VDataListProperty : VProperty

@property(weak,nonatomic)UITableView * tableView;

@property(assign,nonatomic)CGFloat cellHeight;

@property(strong,nonatomic)NSString * cellNib;

@property(assign,nonatomic)UITableViewCellSelectionStyle cellSelectionStyle;

@property(assign,nonatomic)UITableViewCellEditingStyle cellEditStyle;

@property(strong,nonatomic)VSelectBehavior * select;

@property(strong,nonatomic)VSelectBehavior *edit;

@end
