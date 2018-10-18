
//
//  WLNConfig.h
//  KangYangChain
//
//  Created by furao on 2018/10/13.
//  Copyright © 2018年 furao. All rights reserved.
//

#ifndef WLNConfig_h
#define WLNConfig_h

#define DEVICEWidth [UIScreen mainScreen].bounds.size.width  //设备尺寸
#define DEVICEHEIGHT [UIScreen mainScreen].bounds.size.height  //设备尺寸
#define maingray rgba(245,245,245,1)
#define rgba(r,g,b,a) [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a] //宏定义颜色
#define weakSelf(type)  __weak typeof(type) weak##type = type
#define DELEGATES @"delegate"
#define URLS @"urldfkaljfdklajflkdsajflsdajfdklsfjdklsafhdsjkafhdajkfhjsk"

#define OrderStatusArr  @[@"匹配中",@"交易中",@"完成",@"冻结",@"可卖出",@"去支付",@"收益中"]

#endif /* WLNConfig_h */
