//
//  UIViewController+Set.m
//  KangYangChain
//
//  Created by edz on 2018/10/26.
//  Copyright © 2018 furao. All rights reserved.
//

#import "UIViewController+Set.h"

@implementation UIViewController (Set)
- (void)push:(UIViewController *)vc title:(NSString *)title{

    vc.hidesBottomBarWhenPushed = YES;
    
    vc.title = title;
    
    UIViewController *mine = (UIViewController *)self;
    
    [mine.navigationController pushViewController:vc animated:YES];
    
}
- (void)push:(UIViewController *)vc box:(id)box title:(NSString *)title{
    
    vc.hidesBottomBarWhenPushed = YES;
    
    vc.title = title;
    
    vc.box = box;
    
    UIViewController *mine = (UIViewController *)self;
    
    [mine.navigationController pushViewController:vc animated:YES];
    
}
- (void)push:(UIViewController *)vc box:(id)box{
    
    vc.hidesBottomBarWhenPushed = YES;
    
    vc.box = box;
    
    UIViewController *mine = (UIViewController *)self;
    
    [mine.navigationController pushViewController:vc animated:YES];
    
}
- (void)push:(UIViewController *)vc{
   
    vc.hidesBottomBarWhenPushed = YES;
    
    UIViewController *mine = (UIViewController *)self;
    
    [mine.navigationController pushViewController:vc animated:YES];
    
    
}
- (id)box{
    return  objc_getAssociatedObject(self, @selector(box));
    
}
- (void)setBox:(id)box{
    
    objc_setAssociatedObject(self, @selector(box), box, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
-(void)setTab:(UITableView *)tab{
    
    objc_setAssociatedObject(self, @selector(tab), tab, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (UITableView *)tab{
    
    UITableView *tableview =  objc_getAssociatedObject(self, @selector(tab));
    tableview.backgroundColor = maingray;
    if (tableview == nil) {
        self.tab = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        self.tab.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableview = objc_getAssociatedObject(self, @selector(tab));
        
    }
    
    return tableview;
    
}
- (void)setType:(TAB_FRAME_TYPE)type{
    
    objc_setAssociatedObject(self, @selector(type), @(type), OBJC_ASSOCIATION_ASSIGN);

}
- (TAB_FRAME_TYPE)type{
    
    return [objc_getAssociatedObject(self, @selector(type)) integerValue];
    
    
}

- (CGRect)resetTabFrame{
    
    CGRect frame;
    
    if (self.type == CUT_TOPDOWN) {
        
        frame = CGRectMake(0, 0, DEVICEWidth, DEVICEHEIGHT - 49 - 64);
        
    }else if(self.type == CUT_TOP){
        
        frame = CGRectMake(0, 0, DEVICEWidth, DEVICEHEIGHT - 64);
        
    }else {
        frame = CGRectMake(0, 0, DEVICEWidth, DEVICEHEIGHT - 49 );
        
    }
    
    return frame;
    
}
- (void)tabType:(TAB_FRAME_TYPE)type{
 
    self.type = type;
    
    self.tab.frame = [self resetTabFrame];
    
    [self.view addSubview:self.tab];
    
    
}
- (void)customPop{
    
    if (self == nil) {
        return;
    }
    if (![self isKindOfClass:[UIViewController class]]) {
        
        return;
        
    }
    UIViewController *vc = (UIViewController *)self;
    
    
    [vc.view endEditing:YES];
    
    if ([vc.navigationController.viewControllers.firstObject isEqual:self]) {
        
        [vc dismissViewControllerAnimated:YES completion:nil];
        
    }else{
        [vc.navigationController popViewControllerAnimated:YES];
    }
    
}
- (CGRect)resetEmptyFrame{
    
    
    return CGRectMake(0 , 50, 130, 130);
    
}
- (void)emptyShow{
    
    NSLog(@"添加缺省图");
    
//    WLNEmptyView *view = [[WLNEmptyView alloc]initWithFrame:[self resetEmptyFrame]];
//    if (!self.tab) {
//        return;
//    }
//    self.tab.tableFooterView = view;
//    
    
}
- (void)removeEmptyShow{
    
    NSLog(@"移除缺省图");
    
    if (!self.tab) {
        return;
    }
    self.tab.tableFooterView = nil;
    
    
    
}


@end
