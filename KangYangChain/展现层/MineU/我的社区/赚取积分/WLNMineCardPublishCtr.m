//
//  WLNMineCardPublishCtr.m
//  KangYangChain
//
//  Created by furao on 2018/10/11.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMineCardPublishCtr.h"
#import "HXPhotoPicker.h"

@interface WLNMineCardPublishCtr ()
<
UITableViewDelegate,
UITableViewDataSource,
WLNReqstProtocol>
{
    NSMutableArray *_selectArrs;
    WLNMineCardPublishPicCell *_picCell;
}
@end

@implementation WLNMineCardPublishCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发社区贴".Intl;
    
    _selectArrs = [NSMutableArray array];
    self.tab.delegate = self;
    self.tab.dataSource = self;
    
    [self tabType:1];
    
    [self.tab registerClass:WLNMineCardPublishPicCell.class forCellReuseIdentifier:@"WLNMineCardPublishPicCell"];
    
}
- (void)result:(id)data sel:(NSString *)sel{
    
}
- (void)faild:(id)data sel:(NSString *)sel{
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return section == 0 ? 0.1 : 50;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc]init];
    view.layer.masksToBounds = YES;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.layer.cornerRadius = 7;
    
    button.frame = CGRectMake(DEVICEWidth - 100, 10, 90, 40);
    
    button.backgroundColor = mainblue;
    [button setTitle:@"发布" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(publishAction) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return 100;
    }else{
        return [_picCell jugeHeight:_selectArrs.count] < 100 ? 100 : [_picCell jugeHeight:_selectArrs.count];
        
    }
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return [self title_tableView:tableView cellForRowAtIndexPath:indexPath];
    }else{
        return [self pic_tableView:tableView cellForRowAtIndexPath:indexPath];
    }
    
    
}
- (UITableViewCell *)title_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"df"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"df"];
    }
    
    return cell;
    
    
}
- (UITableViewCell *)pic_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    WLNMineCardPublishPicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNMineCardPublishPicCell"];
    
    
    cell.imgArrs = _selectArrs;
    
    cell.forwarder = self;
    
    
   
    
    return cell;
    
}
- (void)didSelectPhotos:(NSMutableArray *)photos{
    
    
    NSLog(@"%@",photos);
    
    [_selectArrs addObjectsFromArray:photos];
    [self.tab reloadData];
    
    
    
}
- (void)addAciton{
    
    NSLog(@"吊起系统相册");

    
    
    
}
- (void)publishAction{
    
    
    if (_selectArrs.count == 0) {
        [SVProgressHUD showErrorWithStatus:@"请选择图片"];
        return;
    }
    NSMutableDictionary *dic = @{}.mutableCopy;
    
    
    UIImage *image =  _selectArrs.firstObject;
    
    
    dic[@"image1"] = [image zipImage];;
    dic[@"content"] = @"fdsafasfdasfdsa";
    dic[@"token"] = self.userModel.token;
    
    
    [self routeTargetName:Handle actionName:@"publishCard:" param:dic];
    
    
}
@end
