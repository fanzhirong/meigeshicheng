//
//  HomeBean.h
//  美格食城
//
//  Created by qf on 15/10/9.
//  Copyright (c) 2015年 fanzhirong. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum _NetType
{
    CARTLIST = 0,
    HOMELIST,
    HOMEDETAILFIRST,
    HOMEDETAILSECOND
}NetType;

@interface HomeBean : NSObject

@property (nonatomic,copy) NSString *tips;


+(HomeBean *)netDataToHomeBean:(NSDictionary *)dict;
+(NSArray *)netDataToHomeArray:(NSArray *)array;
+(NSArray *)netdataToHomeArr:(id)object with:(NetType)netType;
@end
