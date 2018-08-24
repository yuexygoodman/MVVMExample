//
//  MainViewController.m
//  MVPExample
//
//  Created by Good Man on 2018/6/22.
//  Copyright © 2018年 Good Man. All rights reserved.
//

#import "MainViewController.h"
#import "FriendListView.h"
#import "FriendGridView.h"
#import "V2MBinder.h"
#import "FriendsVM.h"

@interface MainViewController ()

@property(strong,nonatomic)FriendListView * listView;

@property(strong,nonatomic)FriendGridView * gridView;

@property(strong,nonatomic)FriendsVM * vm;

@end

@implementation MainViewController

///MARK: 懒加载view,viewmodel

- (FriendsVM *)vm {
    if (!_vm) {
        _vm = [FriendsVM new];
    }
    return _vm;
}

- (FriendListView *)listView {
    if (!_listView) {
        _listView = [[FriendListView alloc] initWithController:self];
        _listView.frame=self.view.bounds;
        _listView.hidden=YES;
    }
    return _listView;
}

- (FriendGridView *)gridView {
    if (!_gridView) {
        _gridView = [[FriendGridView alloc] initWithController:self];
        _gridView.frame=self.view.bounds;
    }
    return _gridView;
}

///MARK: 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"我的朋友";
    [self configUI];
    
    [[V2MBinder shared] registerMappings:@{
                                           @"datalist":@"friends",
                                           @"rmError":@"rmError",
                                           @"confirm":@"confirm",
                                           @"datalist.edit":@"rm",
                                           @"confirm.sure":@"rm_hard"
                                           } betweenView:FriendListView.class andVM:FriendsVM.class];
    [[V2MBinder shared] registerMappings:@{
                                           @"datalist":@"friends",
                                           @"rmError":@"rmError",
                                           @"confirm":@"confirm",
                                           @"datalist.select":@"rm",
                                           @"confirm.sure":@"rm_hard"
                                           } betweenView:FriendGridView.class andVM:FriendsVM.class];
    [[V2MBinder shared] bindView:self.listView withVM:self.vm];
    [self.vm start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

///MARK: 组织子视图
- (void)configUI {
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"Grid" style:UIBarButtonItemStylePlain target:self action:@selector(toChangeLayout:)];

    [self.view addSubview:self.listView];
    [self.view addSubview:self.gridView];
}

///MARK: 用户事件
- (void)toChangeLayout:(id)sender {
    self.listView.hidden=!self.listView.hidden;
    self.gridView.hidden=!self.gridView.hidden;
    self.navigationItem.rightBarButtonItem.title=self.listView.hidden?@"List":@"Grid";
    [[V2MBinder shared] unBindView:self.listView.hidden?self.listView:self.gridView];
    [[V2MBinder shared] bindView:self.listView.hidden?self.gridView:self.listView withVM:self.vm];
    [self.vm start];
}

@end
