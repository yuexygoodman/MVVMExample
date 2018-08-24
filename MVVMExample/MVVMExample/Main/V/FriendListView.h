//
//  FriendListView.h
//  MVPExample
//
//  Created by Good Man on 2018/6/22.
//  Copyright © 2018年 Good Man. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VDataListProperty.h"
#import "VAlertProperty.h"
#import "VConfirmProperty.h"
#import "VSelectBehavior.h"

@interface FriendListView : UITableView

- (id)initWithController:(UIViewController *)viewController;

@property(strong,nonatomic)VDataListProperty * datalist;

@property(strong,nonatomic)VAlertProperty * rmError;

@property(strong,nonatomic)VConfirmProperty * confirm;

@end
