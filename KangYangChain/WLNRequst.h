//
//  WLNRequst.h
//  KangYangChain
//
//  Created by furao on 2018/10/7.
//  Copyright © 2018年 furao. All rights reserved.
//



//192.168.0.106/index/user/setAvatar
#define Address_Domain "http://kyl.wlnxx.top"
#define BaseUrl Address_Domain"/adminServer/public/index.php/"





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

#define CardDetail @BaseUrl"/index/community/userArticleDetail"

#define CommentList @BaseUrl"/index/community/userArticleCommentList"

#define ProblemList @BaseUrl"/index/community/agreeUserArticle"

#define HeadUpdate @BaseUrl"/index/user/setAvatar"

#define NameSet @BaseUrl"/index/user/setNickname"

#define GHBInfo @BaseUrl"/index/ghb/info"

#define GHBLog @BaseUrl"/index/ghb/log"

#define GHBCharge @BaseUrl"/index/pay/recharge"

#define UserInfo @BaseUrl"/index/user/info"


