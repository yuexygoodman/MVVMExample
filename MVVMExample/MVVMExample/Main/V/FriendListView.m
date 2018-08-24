//
//  FriendListView.m
//  MVPExample
//
//  Created by Good Man on 2018/6/22.
//  Copyright © 2018年 Good Man. All rights reserved.
//

#import "FriendListView.h"

@interface FriendListView()

@property(weak,nonatomic)UIViewController * viewController;

@end

@implementation FriendListView

///MARK: 初始化
- (id)initWithController:(UIViewController *)viewController {
    if (self=[self initWithFrame:CGRectZero style:UITableViewStylePlain]) {
        _viewController=viewController;
    }
    return self;
}

///MARK: 属性

- (VDataListProperty *)datalist {
    if (!_datalist) {
        _datalist = [VDataListProperty new];
        _datalist.tableView = self;
        _datalist.cellNib = @"FriendViewCell";
        _datalist.cellHeight = 80;
        _datalist.cellSelectionStyle = UITableViewCellSelectionStyleNone;
        _datalist.cellEditStyle = UITableViewCellEditingStyleDelete;
        _datalist.select = [VSelectBehavior new];
        _datalist.edit = [VSelectBehavior new];
    }
    return _datalist;
}

- (VAlertProperty *)rmError {
    if (!_rmError) {
        _rmError = [VAlertProperty new];
        _rmError.vc = self.viewController;
        _rmError.title = @"删除错误";
    }
    return _rmError;
}

- (VConfirmProperty *)confirm {
    if (!_confirm) {
        _confirm = [VConfirmProperty new];
        _confirm.vc = self.viewController;
        _confirm.title = @"再次确认";
    }
    return _confirm;
}

@end
