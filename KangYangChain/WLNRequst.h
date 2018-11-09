//
//  WLNRequst.h
//  KangYangChain
//
//  Created by furao on 2018/10/7.
//  Copyright © 2018年 furao. All rights reserved.
//




//#define Address_Domain "http://kyl.wlnxx.top"

#define Address_Domain "http://kylvue.cpyu8.com"

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

#define ProblemList @BaseUrl"/index/community/questionList"

#define HeadUpdate @BaseUrl"/index/user/setAvatar"

#define NameSet @BaseUrl"/index/user/setNickname"

#define GHBInfo @BaseUrl"/index/ghb/info"

#define GHBLog @BaseUrl"/index/ghb/log"

#define GHBCharge @BaseUrl"/index/pay/recharge"

#define UserInfo @BaseUrl"/index/user/info"

#define Comment @BaseUrl"/index/community/commentUserArticle"

#define MyCardList @BaseUrl"/index/community/userPublishArticleList"

#define MyCardDelete @BaseUrl"/index/community/delUserArticle"

#define NewsCategory @BaseUrl"/index/community_article/cate"

#define NewsList @BaseUrl"/index/community_article/articleList"

#define NewDetailHtml @BaseUrl"/index/community_article/articleDetailContent"

#define ShequHome @BaseUrl"/index/community/index"

#define AgreeOrder @BaseUrl"/index/contract/bill.html" //合约账单

#define CloseAgreeLog @BaseUrl"/index/contract/close_log.html" //平仓记录

#define CreateAgree @BaseUrl"/index/contract/receive.html" //建仓

#define HoldAgreeLog @BaseUrl"/index/contract/position" //持仓记录

#define AgreeTradeList @BaseUrl"/index/contract/index.html"   //合约交易列表

#define CionChooseList @BaseUrl"/index/contract/changedate.html" //币种选择列表

#define AgreeAccount @BaseUrl"/index/contract/account.html" //合约账户

#define CloseAgree @BaseUrl"/index/contract/close.html" //平仓

#define YingSunSet @BaseUrl"/index/contract/changenum.html" //调整止盈止损

#define BBAcount @BaseUrl"/home/Coinassets/assets" //币币账户

#define BBTypeList @BaseUrl"/home/Coinassets/coin" //所有币种

#define WeituoAllHisList @BaseUrl"/home/Coincoin/page1" //全部历史委托记录



