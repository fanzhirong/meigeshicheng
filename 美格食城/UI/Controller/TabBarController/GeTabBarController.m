//
//  GeTabBarController.m
//  美格食城
//
//  Created by qf on 15/10/8.
//  Copyright (c) 2015年 fanzhirong. All rights reserved.
//

#import "GeTabBarController.h"

@interface GeTabBarController ()

@end

@implementation GeTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setGeGeTabBar];
}
#pragma mark ----默认显示第一页
-(void)setGeGeTabBar
{
    UITabBarItem *item = [self.tabBar.items objectAtIndex:0];
    NSMutableDictionary * dic=[NSMutableDictionary dictionary];
    UIColor *geTabItemColorv = [[UIColor alloc]initWithRed:230/255.0f green:52/255.0f blue:38/255.0f alpha:1.0f];
    dic[NSForegroundColorAttributeName]=geTabItemColorv;
    item.selectedImage = [[UIImage imageNamed:@"tabBarHomeSelected@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [item setTitleTextAttributes:dic forState:UIControlStateSelected];
}
#pragma mark ----页面切换
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    NSMutableDictionary * dic=[NSMutableDictionary dictionary];
    UIColor *geTabItemColorv = [[UIColor alloc]initWithRed:230/255.0f green:52/255.0f blue:38/255.0f alpha:1.0f];
    dic[NSForegroundColorAttributeName]=geTabItemColorv;
    switch (item.tag%100) {
        case 1:
        {
            item.selectedImage = [[UIImage imageNamed:@"tabBarHomeSelected@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            [item setTitleTextAttributes:dic forState:UIControlStateSelected];
          }
            break;
        case 2:
            item.selectedImage = [[UIImage imageNamed:@"tabBarMallSelected@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            [item setTitleTextAttributes:dic forState:UIControlStateSelected];
            break;
        case 3:
            item.selectedImage = [[UIImage imageNamed:@"tabBarCartSelected@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            [item setTitleTextAttributes:dic forState:UIControlStateSelected];
            break;
        case 4:
            item.selectedImage = [[UIImage imageNamed:@"tabBarUserSelected@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            [item setTitleTextAttributes:dic forState:UIControlStateSelected];
            break;
            
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
