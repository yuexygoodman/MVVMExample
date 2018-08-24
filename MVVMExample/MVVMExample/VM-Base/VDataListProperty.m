//
//  VDataListProperty.m
//  MVVMExample
//
//  Created by 岳潇洋 on 2018/8/23.
//  Copyright © 2018年 岳潇洋. All rights reserved.
//

#import "VDataListProperty.h"
#import "V2MBinder.h"
#import "IViewModel.h"

@interface VDataListProperty()<UITableViewDelegate,UITableViewDataSource>

@property(weak,nonatomic)NSArray * datalist;

@end

@implementation VDataListProperty

- (void)setValue:(id)value {
    NSAssert([value isKindOfClass:[NSArray class]], @"value is just support array type");
    [super setValue:value];
    [self.tableView reloadData];
}

- (NSArray *)datalist {
    return self.value;
}

- (void)setTableView:(UITableView *)tableView {
    _tableView=tableView;
    _tableView.delegate=self;
    _tableView.dataSource=self;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:self.cellNib];
    [[V2MBinder shared] unBindView:cell];
    if (cell==nil) {
        NSArray * arr = [[NSBundle mainBundle] loadNibNamed:self.cellNib owner:nil options:nil];
        cell = arr.firstObject;
        cell.selectionStyle=self.cellSelectionStyle;
    }
    id<IViewModel> vm = self.datalist[indexPath.row];
    [[V2MBinder shared] bindView:cell withVM:vm];
    [vm start];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datalist.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.select) {
        [self.select invokeWithData:@(indexPath.row)];
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.cellEditStyle != UITableViewCellEditingStyleNone;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.cellEditStyle;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.edit) {
        [self.edit invokeWithData:@(indexPath.row)];
    }
}

@end
