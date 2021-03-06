//
//  WeiboModel.h
//  WXWeibo
//
//  Created by JayWon on 15/10/23.
//  Copyright (c) 2015年 JayWon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

/**
 created_at	string	微博创建时间
 id	int64	微博ID
 mid	int64	微博MID
 idstr	string	字符串型的微博ID
 text	string	微博信息内容
 source	string	微博来源
 favorited	boolean	是否已收藏，true：是，false：否
 truncated	boolean	是否被截断，true：是，false：否
 in_reply_to_status_id	string	（暂未支持）回复ID
 in_reply_to_user_id	string	（暂未支持）回复人UID
 in_reply_to_screen_name	string	（暂未支持）回复人昵称
 thumbnail_pic	string	缩略图片地址，没有时不返回此字段
 bmiddle_pic	string	中等尺寸图片地址，没有时不返回此字段
 original_pic	string	原始图片地址，没有时不返回此字段
 geo	object	地理信息字段 详细
 user	object	微博作者的用户信息字段 详细
 retweeted_status	object	被转发的原微博信息字段，当该微博为转发微博时返回 详细
 reposts_count	int	转发数
 comments_count	int	评论数
 attitudes_count	int	表态数
 mlevel	int	暂未支持
 visible	object	微博的可见性及指定可见分组信息。该object中type取值，0：普通微博，1：私密微博，3：指定分组微博，4：密友微博；list_id为分组的组号
 pic_ids	object	微博配图ID。多图时返回多图ID，用来拼接图片url。用返回字段thumbnail_pic的地址配上该返回字段的图片ID，即可得到多个图片url。
 ad	object array	微博流内的推广微博ID
 */
@interface WeiboModel : NSObject

@property(nonatomic, copy)NSString* created_at;
@property(nonatomic, assign)uint64_t id;            //生成的属性名为 _id，所以可以编译通过
@property(nonatomic, assign)uint64_t mid;
@property(nonatomic, copy)NSString* idstr;
@property(nonatomic, copy)NSString* text;
@property(nonatomic, copy)NSString* source;
@property(nonatomic, assign)BOOL favorited;
@property(nonatomic, assign)BOOL truncated;
@property(nonatomic, copy)NSString* thumbnail_pic;
@property(nonatomic, copy)NSString* bmiddle_pic;
@property(nonatomic, copy)NSString* original_pic;
@property(nonatomic, copy)NSDictionary* geo;
@property(nonatomic, strong)UserModel* user;
@property(nonatomic, strong)WeiboModel* retweeted_status;
@property(nonatomic, assign)int reposts_count;
@property(nonatomic, assign)int comments_count;
@property(nonatomic, assign)int attitudes_count;
@property(nonatomic, strong)NSArray* pic_ids;

@property(nonatomic, strong)NSArray* pic_urls;      //微博多图的url数组

@end
