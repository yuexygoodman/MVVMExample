//
//  FriendGridView.m
//  MVPExample
//
//  Created by Good Man on 2018/6/22.
//  Copyright © 2018年 Good Man. All rights reserved.
//

#import "FriendGridView.h"
#import "FriendViewItem.h"

@interface FriendGridView()

@property(weak,nonatomic)UIViewController * viewController;

@end

@implementation FriendGridView

///MARK: 初始化
- (id)initWithController:(UIViewController *)viewController {
    UICollectionViewFlowLayout * layout=[UICollectionViewFlowLayout new];
    layout.itemSize=CGSizeMake(70, 90);
    layout.minimumLineSpacing=10;
    layout.minimumInteritemSpacing=10;
    if (self=[self initWithFrame:CGRectZero collectionViewLayout:layout]) {
        _viewController=viewController;
        self.backgroundColor=[UIColor whiteColor];
    }
    return self;
}

///MARK: 属性

- (VDataGridProperty *)datalist {
    if (!_datalist) {
        _datalist = [VDataGridProperty new];
        _datalist.gridView = self;
        _datalist.itemNib = @"FriendViewItem";
        _datalist.select = [VSelectBehavior new];
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
