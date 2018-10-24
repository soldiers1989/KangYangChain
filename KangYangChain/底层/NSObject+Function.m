//
//  NSObject+Function.m
//  KangYangChain
//
//  Created by edz on 2018/10/16.
//  Copyright © 2018 furao. All rights reserved.
//

#import "NSObject+Function.h"


@implementation NSObject (Function)

- (void)push:(UIViewController *)vc{
    if (vc == nil) {
        return;
    }
    if (![self isKindOfClass:[UIViewController class]]) {
        
        return;
        
    }
    
    UIViewController *mine = (UIViewController *)self;
        
    [mine.navigationController pushViewController:vc animated:YES];
        
    
    
    
}

- (User *)userModel{
    
    NSUserDefaults *de =[NSUserDefaults standardUserDefaults];
    NSMutableDictionary *dic = [de objectForKey:@"log"];
    User *model = [[User alloc]initWithDictionary:dic];
    return model;
    
}

-(void)setTab:(UITableView *)tab{
    
    objc_setAssociatedObject(self, @selector(tab), tab, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
- (UITableView *)tab{
    
    UITableView *tableview =  objc_getAssociatedObject(self, @selector(tab));
    tableview.backgroundColor = maingray;
    if (tableview == nil) {
        self.tab = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableview = objc_getAssociatedObject(self, @selector(tab));
        
    }
    
    return tableview;
 
}
- (void)tabType:(TAB_FRAME_TYPE)type{
    
    if ([self isKindOfClass:UIViewController.class]) {
        UIViewController *vc = (UIViewController*)self;
        [vc.view addSubview:self.tab];
    }else{
        return;
    }
    
    
    CGRect frame;
    
    if (type == CUT_TOPDOWN) {
        
        frame = CGRectMake(0, 0, DEVICEWidth, DEVICEHEIGHT - 49 - 64);
        
    }else if(type == CUT_TOP){
        
        frame = CGRectMake(0, 0, DEVICEWidth, DEVICEHEIGHT - 64);

    }else {
        frame = CGRectMake(0, 0, DEVICEWidth, DEVICEHEIGHT - 49 );

    }
    self.tab.frame = frame;


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
@end
