//
//  HomeViewController.m
//  美格食城
//
//  Created by qf on 15/10/8.
//  Copyright (c) 2015年 fanzhirong. All rights reserved.
//

#import "HomeViewController.h"
#import <AFNetworking.h>
@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView *table;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setViews];
    [self setTable];
}
#pragma mark ----设置navigation tabar
-(void)setViews
{
     self.view.backgroundColor = [UIColor whiteColor];
    
    UIColor *navigationBarColor = [[UIColor alloc]initWithRed:246/255.0f green:91/255.0f blue:78/255.0f alpha:1.0f];
    self.navigationController.navigationBar.barTintColor = navigationBarColor;
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(50, 20, ScreenWidth-100, 44)];
    label.text = @"格格家";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:20];
    self.navigationItem.titleView=label;
    
    UIButton *button = [[UIButton alloc]init];
    button.frame = CGRectMake(ScreenWidth-50, 20, 40, 44);
    [button setImage:[UIImage imageNamed:@"homeViewSearch_icon@2x"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = rightButton;
    
}
#pragma mark ----切换到搜索页面
-(void)click:(UIButton *)button
{
    //..........
}

#pragma mark ----创建内容表
-(void)setTable
{
    _table = [[UITableView alloc]init];
    _table.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight-64-44);
    _table.delegate = self;
    _table.dataSource = self;
    [self.view addSubview:_table];
    
   // _table registerNib:<#(UINib *)#> forCellReuseIdentifier:<#(NSString *)#>
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identy = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identy];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identy];
    }
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
