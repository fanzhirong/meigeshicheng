//
//  HomeViewController.h
//  美格食城
//
//  Created by qf on 15/10/8.
//  Copyright (c) 2015年 fanzhirong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeBean.h"

#define ListPath (@"http://app.gegejia.com/yangege/appNative/cart/list")
#define ListBody (@"os=1&params=%7B%22id%22%3A%22159224%22%2C%22type%22%3A1%7D&sign=DFF88FBAC934AB0F&version=1.8")

#define HomeListPath (@"http://app.gegejia.com/yangege/appNative/resource/homeList")
#define HomeListBody (@"os=1&params=%7B%22type%22%3A%22123456%22%7D&sign=6E381FB9756AC30D&version=1.8")

#define HomeDetailFirstPath (@"http://app.gegejia.com/yangege/appNative/resource/homeDetail")
#define HomeDetailFirstBody (@"os=1&params=%7B%22type%22%3A%223%22%2C%22laterList%22%3A%5B1981%2C1194%2C1852%2C1646%2C1660%2C882%2C1964%2C1389%2C1968%2C1973%2C572%2C1965%2C1967%2C213%2C1116%2C1977%2C1963%2C1571%2C1639%2C1966%5D%2C%22accountId%22%3A%22159224%22%7D&sign=5612CC33E067B13F&version=1.8")

#define HomeDetailSecondPath (@"http://app.gegejia.com/yangege/appNative/resource/homeDetail")
#define HomeDetailSecondBody (@"os=1&params=%7B%22type%22%3A%222%22%2C%22nowList%22%3A%5B1976%2C1955%2C1400%2C1672%2C1599%2C1980%2C1953%2C1426%2C212%2C1952%2C1920%2C1160%2C1054%2C1867%2C1982%2C526%2C1776%2C1959%2C906%2C1972%5D%2C%22accountId%22%3A%22159224%22%7D&sign=CA2A2B923BB3F66A&version=1.8")

@interface HomeViewController : UIViewController

@end
