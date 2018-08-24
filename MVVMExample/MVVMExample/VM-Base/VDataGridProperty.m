//
//  VDataGridProperty.m
//  MVVMExample
//
//  Created by 岳潇洋 on 2018/8/23.
//  Copyright © 2018年 岳潇洋. All rights reserved.
//

#import "VDataGridProperty.h"
#import "V2MBinder.h"
#import "IViewModel.h"

@interface VDataGridProperty()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(weak,nonatomic)NSArray * datalist;

@end

@implementation VDataGridProperty

- (void)setValue:(id)value {
    NSAssert([value isKindOfClass:[NSArray class]], @"value is just support array type");
    [super setValue:value];
    [self.gridView reloadData];
}

- (NSArray *)datalist {
    return self.value;
}

- (void)setGridView:(UICollectionView *)gridView {
    _gridView = gridView;
    _gridView.delegate=self;
    _gridView.dataSource=self;
}

- (void)setItemNib:(NSString *)itemNib {
    _itemNib=itemNib;
    [self.gridView registerNib:[UINib nibWithNibName:_itemNib bundle:nil] forCellWithReuseIdentifier:_itemNib];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UICollectionViewCell * itemView = [collectionView dequeueReusableCellWithReuseIdentifier:self.itemNib forIndexPath:indexPath];
    [[V2MBinder shared] unBindView:itemView];
    if (self.select && itemView.gestureRecognizers.count == 0) {
        itemView.userInteractionEnabled=YES;
        UILongPressGestureRecognizer * longtap=[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(selected_item:)];
        [itemView addGestureRecognizer:longtap];
    }
    id<IViewModel> vm = self.datalist[indexPath.row];
    [[V2MBinder shared] bindView:itemView withVM:vm];
    [vm start];
    return itemView;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.datalist.count;
}

- (void)selected_item:(UIGestureRecognizer *)sender {
    NSIndexPath * indexPath=[self.gridView indexPathForCell:(UICollectionViewCell *)sender.view];
    if (self.select) {
        [self.select invokeWithData:@(indexPath.row)];
    }
}

@end
