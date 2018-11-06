//
//  WLNRequst.h
//  KangYangChain
//
//  Created by furao on 2018/10/7.
//  Copyright © 2018年 furao. All rights reserved.
//


//#define baseurl ""

#define Address_Domain "http://kyl.wlnxx.top"
#define BaseUrl Address_Domain"/adminServer/public/index.php/"

//#define BaseUrl "http://kylvue.cpyu8.com/adminServer/public/index.php/"
//#define BaseUrl "http://kyl.linkhb.com/adminServer/public/index.php/"

#define Getcode  @BaseUrl"/index/login/send_verification_code"

#define Register @BaseUrl"/index/login/register"

#define ForGet @BaseUrl"/index/login/forget"

#define Logurl @BaseUrl"/index/login/login"

#define fdsfdsf @BaseUrl"/index/login/test_login"

#define BuyInfo @BaseUrl"/index/match/buyinfo.html"

#define BuyGHB @BaseUrl"/index/match/buy"



#define MatchList @BaseUrl"/index/match/list"

#define MatchInfo @BaseUrl"/index/match/info"

#define LockAction @BaseUrl"/index/ghb/lock_order" //执行锁仓

#define LockcConfig @BaseUrl"/index/ghb/config"  //锁仓配置

#define LockList @BaseUrl"/index/ghb/lock_index"  //锁仓列表

#define PayGHB @BaseUrl"/index/match/pay"  //排单支付

#define YaoqingList @BaseUrl"/index/userqrcode/list"

#define OutLog @BaseUrl"/index/login/logout"

#define UpdateTicker @"http://bs.getcai.com/api/v1/exchange/ticker"


/**
 社区
 */
#define CommunityList @BaseUrl"/index/community_article/cate"

#define PublishCard @BaseUrl"/index/community/userPublishArticle"

#define CardList @BaseUrl"/index/community/userArticleList"




