//
//  V2MBinder.m
//  MVVMExample
//
//  Created by 岳潇洋 on 2018/8/6.
//  Copyright © 2018年 岳潇洋. All rights reserved.
//

#import "V2MBinder.h"

@interface V2MBinder()

@property(strong,nonatomic)NSMutableDictionary * bindings;

@property(strong,nonatomic)NSMutableDictionary * mappings;

- (NSDictionary *)mappingsWithView:(id)view vm:(id)vm;

@end

@interface V2MBinding:NSObject
@property(weak,nonatomic)id view;
@property(weak,nonatomic)id vm;
@property(strong,nonatomic)NSDictionary * mappings;
@end

@implementation V2MBinding

- (NSDictionary *)mappings {
    return [[V2MBinder shared] mappingsWithView:self.view vm:self.vm];
}

@end

@implementation V2MBinder

+ (instancetype)shared {
    static dispatch_once_t onceToken;
    static V2MBinder * ST_V2MBinder;
    dispatch_once(&onceToken, ^{
        if (!ST_V2MBinder) {
            ST_V2MBinder = [V2MBinder new];
            ST_V2MBinder.bindings = [NSMutableDictionary new];
            ST_V2MBinder.mappings = [NSMutableDictionary new];
        }
    });
    return ST_V2MBinder;
}

+ (NSUUID *)uuid {
   return [NSUUID UUID];
}

- (void)registerMappings:(NSDictionary *)mappings betweenView:(Class)viewClass andVM:(Class)vmClass {
    NSString *key = [NSString stringWithFormat:@"%@-%@",NSStringFromClass(viewClass),NSStringFromClass(vmClass)];
    [self.mappings setObject:mappings forKey:key];
}

- (NSDictionary *)mappingsWithView:(id)view vm:(id)vm {
    NSString *key = [NSString stringWithFormat:@"%@-%@",NSStringFromClass([view class]),NSStringFromClass([vm class])];
    return [self.mappings objectForKey:key];
}

- (void)unBind:(id)obj {
    if (!obj)return;
    NSMutableArray * identifiers = [NSMutableArray new];
    for (NSString * identifier in self.bindings.allKeys) {
        V2MBinding * binding=self.bindings[identifier];
        if (binding.view==obj || binding.vm==obj) {
            NSDictionary * mappings = binding.mappings;
            for (NSString * key in mappings) {
                id obj=[binding.view valueForKeyPath:key];
                if (![obj isKindOfClass:[VBehavior class]]) {
                    [binding.view removeObserver:self forKeyPath:key context:(__bridge void * _Nullable)(identifier)];
                    [binding.vm removeObserver:self forKeyPath:mappings[key] context:(__bridge void * _Nullable)(identifier)];
                }
            }
            [identifiers addObject:identifier];
        }
    }
    for (NSString * identifier in identifiers) {
        [self.bindings removeObjectForKey:identifier];
    }
}

- (void)bindView:(id)view withVM:(id)vm {
    NSUUID * identifier =  [V2MBinder uuid];
    NSDictionary * mappings =[self mappingsWithView:view vm:vm];
    if (mappings.count==0)return;
    NSMutableDictionary * mutiMappings = [[self mappingsWithView:view vm:vm] mutableCopy];
    for (NSString * key in mappings.allKeys) {
        id obj=[view valueForKeyPath:key];
        if ([obj isKindOfClass:[VBehavior class]]) {
            [obj attachTo:[vm valueForKeyPath:mappings[key]]];
        }
        else {
            NSString * keypath = key;
            if ([obj isKindOfClass:[VProperty class]]) {
                keypath = [NSString stringWithFormat:@"%@.value",keypath];
                [mutiMappings removeObjectForKey:key];
                [mutiMappings setObject:mappings[key] forKey:keypath];
            }
            [view addObserver:self forKeyPath:keypath options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld|NSKeyValueObservingOptionInitial context:(__bridge void * _Nullable)(identifier)];
            [vm addObserver:self forKeyPath:mappings[key] options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld|NSKeyValueObservingOptionInitial context:(__bridge void * _Nullable)(identifier)];
        }
    }
    [self registerMappings:mutiMappings betweenView:[view class] andVM:[vm class]];
    V2MBinding * binding = [V2MBinding new];
    binding.view = view;
    binding.vm = vm;
    [self.bindings setObject:binding forKey:identifier];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSUUID * identifier = (__bridge NSUUID *)(context);
    V2MBinding * binding=[self.bindings objectForKey:identifier];
    id newVal = change[NSKeyValueChangeNewKey]==[NSNull null]?nil:change[NSKeyValueChangeNewKey];
    if (binding.view == object) {
        id val = [binding.vm valueForKeyPath:binding.mappings[keyPath]];
        if ([val isEqual:newVal] || (val==nil && newVal==nil))return;
        [binding.vm setValue:newVal forKeyPath:binding.mappings[keyPath]];
    }
    else {
        NSInteger index=[binding.mappings.allValues indexOfObject:keyPath];
        NSString * key = binding.mappings.allKeys[index];
        id val = [binding.view valueForKeyPath:key];
        if ([val isEqual:newVal] || (val==nil && newVal==nil))return;
        [binding.view setValue:newVal forKeyPath:key];
    }
}

@end
