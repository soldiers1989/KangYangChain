//
//  WLNHomeCtr.m
//  KangYangChain
//
//  Created by furao on 2018/9/27.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHomeCtr.h"
#import "WLNHandle.h"

@interface WLNHomeCtr ()<UITableViewDelegate,UITableViewDataSource,WLNReqstProtocol,Interface>
{
    NSArray *_secitonArrs;
    
}
@property (nonatomic, strong) UITableView *tab;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, assign) id <Interface> pro;

@end

@implementation WLNHomeCtr

- (void)viewDidLoad {
    [super viewDidLoad];

  
    self.title = @"首页".Intl;

    self.tab.delegate = self;
    self.tab.dataSource = self;
    self.tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.dataArr = [NSMutableArray array];

    _secitonArrs = @[@[@""],@[@"",@"",@"",@""],@[@"",@"",@"",@""]];

    [self.tab registerClass:WLNHomeCountCell.class forCellReuseIdentifier:@"WLNHomeCountCell"];
    [self.tab registerClass:WLNHomeNewCell.class forCellReuseIdentifier:@"WLNHomeNewCell"];
    [self.tab registerClass:WLNHomeHotCell.class forCellReuseIdentifier:@"WLNHomeHotCell"];

    
    WLNHomeHeadView *view = [[WLNHomeHeadView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth, 150)];

    self.tab.tableHeaderView = view;
 
    NSString *str =  [NSBundle currentLanguage];

    UIImage *image;
    
    if ([str isEqualToString:@"en"]) {
        
        image = [UIImage imageNamed:@"chinese"];
        
    }else{
        image = [UIImage imageNamed:@"english"];
        
    }
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStyleDone target:self action:@selector(changeLangage)];
    

    
}
- (void)changeLangage{
    
    [SVProgressHUD showErrorWithStatus:@"此功能尚未映射完成"];
    
   NSString *str =  [NSBundle currentLanguage];
    
    if ([str isEqualToString:@"en"]) {
        
        [DAConfig setUserLanguage:@"zh-Hans"];

    }else{
        
        [DAConfig setUserLanguage:@"en"];

    }

    
    
}
/**
 网络请求回调
 */
- (void)result:(id)data sel:(NSString *)sel{
    
    NSLog(@"result:%@ -- sel:%@",data,sel);
    
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView fr_willDisplayCell:cell forRowAtIndexPath:indexPath];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 0 ? 0: 40;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    NSArray *leftArr = @[@"",@"最新行情",@"热门帖子"];
    NSArray *rightArr = @[@"",@"New",@"Hot"];
    
    WLNHomeSectionHeadView *view = [[WLNHomeSectionHeadView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth, 40)];
    view.leftLab.text = leftArr[section];
    view.rightLab.text = rightArr[section];
    return view;
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return nil;
    }
    if (section == 1) {
        return @"最新行情";
    }
    return @"热门帖子";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_secitonArrs[section]count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _secitonArrs.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return [self count_tableView:tableView cellForRowAtIndexPath:indexPath];
    }else if (indexPath.section == 1){
        return [self new_tableView:tableView cellForRowAtIndexPath:indexPath];
    }else{
        return [self hot_tableView:tableView cellForRowAtIndexPath:indexPath];
        
    }
    
}
- (UITableViewCell *)count_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNHomeCountCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNHomeCountCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;;

    return cell;
    
}
- (UITableViewCell *)new_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    WLNHomeNewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNHomeNewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;;
    cell.moneyLab.text = @"¥565656.0";
    cell.bizhongLab.text = @"BTC";
    cell.bizhong2Lab.text = @"/USDT";
    cell.dealCountLab.text = @"成交量";
    cell.money2Lab.text = @"123.0";
    cell.waveLab.text = @"+1.56%";
    return cell;
    
}
- (UITableViewCell *)hot_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    WLNHomeHotCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNHomeHotCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;;
    cell.headImg.image = [UIImage imageNamed:@"Snip20181002_1"];
    cell.nameLab.text = @"拖鞋高手";
    cell.remarkLab.text = @"热爱生活";
    cell.contentImg.image = [UIImage imageNamed:@"Snip20181002_2"];
    cell.contentLab.text = @"加密货币加密货币加密货币加密货币加密";
    cell.ofLab.text = @"#肥宅#";
    cell.lookLab.text = @"浏览789次";
    cell.leftLab.text = @"0";
    cell.centerLab.text = @"123";
    cell.rightLab.text = @"456";
    return cell;
  
}

@end
