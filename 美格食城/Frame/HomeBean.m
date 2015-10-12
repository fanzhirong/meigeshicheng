//
//  HomeBean.m
//  美格食城
//
//  Created by qf on 15/10/9.
//  Copyright (c) 2015年 fanzhirong. All rights reserved.
//

#import "HomeBean.h"
#import "ZJModelTool.h"
#import "ListBean.h"
#import "HeaderImage.h"
#import "HomeListBean.h"
#import "HomeDetailFirstBean.h"
#import "HomeDetailSecondBean.h"

@implementation HomeBean

-(id)init
{
    if (self = [super init]) {

    }
    return self;
}
+(HomeBean *)netDataToHomeBean:(NSDictionary *)dict
{
    HomeBean *bean = [[HomeBean alloc]init];
    [bean setValuesForKeysWithDictionary:dict];
    return bean;
}
+(NSArray *)netDataToHomeArray:(NSArray *)array
{
    NSMutableArray *arr = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        HomeBean *bean = [HomeBean netDataToHomeBean:dict];
        [arr addObject:bean];
    }
    return arr;
}
+(NSArray *)netdataToHomeArr:(id)object with:(NetType)netType
{
    NSError *error = nil;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:object options:NSJSONReadingMutableContainers error:&error];
    NSMutableString *str = dic[@"params"];
    [str stringByReplacingOccurrencesOfString:@"" withString:@"\\"];
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    //NSLog(@"%d----->>>>%@",netType,dict);
    NSMutableArray *array = [NSMutableArray array];
    switch (netType) {
        case CARTLIST:
        {
           //_tips = dict[@"tips"];
            NSArray *arr = dict[@"productList"];
            for (NSDictionary *dictionary in arr) {
                ListBean *bean = [[ListBean alloc]init];
                bean.image = dictionary[@"image"];
                bean.count = dictionary[@"count"];
                bean.shortName = dictionary[@"shortName"];
                bean.salesPrice = dictionary[@"salesPrice"];
                [array addObject:bean];
            }
        }
            break;
        case HOMELIST:
        {
            NSMutableArray *headImage = [NSMutableArray array];
            NSMutableArray *listImage = [NSMutableArray array];
            for (NSDictionary *dictionary in dict[@"bannerList"]) {
                HeaderImage *HeadBean = [[HeaderImage alloc]init];
                HeadBean.image = dictionary[@"image"];
                HeadBean.imageId = dictionary[@"id"];
                [headImage addObject:HeadBean];
            }
            [array addObject:headImage];
            for (NSDictionary *dictionary in dict[@"hotList"]) {
                HomeListBean *bean = [[HomeListBean alloc]init];
                bean.image = dictionary[@"image"];
                bean.imageId = dictionary[@"id"];
                bean.price = dictionary[@"price"];
                bean.title = dictionary[@"title"];
                [listImage addObject:bean];
            }
            [array addObject:listImage];
        }
            //NSLog(@"%@",dict[@"activityList"]);
            //NSLog(@"%@",dict[@"bannerList"]);
            //NSLog(@"%@",dict[@"hotList"]);
            //NSLog(@"%@",dict[@"themeList"]);
            break;
        case HOMEDETAILFIRST:
            for (NSDictionary *dictionary in dict[@"laterDetailList"]) {
                HomeDetailFirstBean *bean = [[HomeDetailFirstBean alloc]init];
                bean.flagImage = dictionary[@"flagImage"];
                bean.imageId = dictionary[@"id"];
                bean.image = dictionary[@"image"];
                bean.leftDesc = dictionary[@"leftDesc"];
                bean.rightDesc = dictionary[@"rightDesc"];
                bean.startSecond = dictionary[@"startSecond"];
                [array addObject:bean];
            }
            break;
        case HOMEDETAILSECOND:
            for (NSDictionary *dictionary in dict[@"nowDetailList"]) {
                HomeDetailSecondBean *bean = [[HomeDetailSecondBean alloc]init];
                bean.flagImage = dictionary[@"flagImage"];
                bean.imageId = dictionary[@"id"];
                bean.image = dictionary[@"image"];
                bean.leftDesc = dictionary[@"leftDesc"];
                bean.rightDesc = dictionary[@"rightDesc"];
                bean.endSecond = dictionary[@"endSecond"];
                [array addObject:bean];
            }
            break;
            
        default:
            break;
    }
    return array;
}

@end
