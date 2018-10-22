//
//  NSObject+Function.h
//  KangYangChain
//
//  Created by edz on 2018/10/16.
//  Copyright © 2018 furao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Function)

typedef NS_ENUM(NSInteger, TAB_FRAME_TYPE) {
    
    CUT_TOPDOWN = 0,
    CUT_TOP,         
    CUT_DOWN,
    
};

/**
 属性
 */
@property (nonatomic, strong) UITableView *tab;


/**
 方法
 */

- (User *)userModel;

- (void)push:(UIViewController *)vc;

- (void)tabType:(TAB_FRAME_TYPE)type;

@end

NS_ASSUME_NONNULL_END
