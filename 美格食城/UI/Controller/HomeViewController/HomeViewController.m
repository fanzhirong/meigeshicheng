//
//  HomeViewController.m
//  美格食城
//
//  Created by qf on 15/10/8.
//  Copyright (c) 2015年 fanzhirong. All rights reserved.
//
#import <UIImageView+WebCache.h>
#import "HomeViewController.h"
#import "NetWorking.h"

#import "HomeDetailTableViewCell.h"
#import "ScrollViewLib.h"
#import "HeaderImage.h"
#import "HomeListBean.h"
@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView *table;
@property (nonatomic,strong)NSMutableArray *imageArr;
@property (nonatomic,strong)NSMutableArray *detailFirst;
@property (nonatomic,strong)NSMutableArray *detailSecond;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self setViews];
    [self setTable];
    [self requestData];
}
#pragma mark ----初始化数据对象
-(void)initData
{
    _imageArr = [NSMutableArray array];
    _detailFirst = [NSMutableArray array];
    _detailSecond = [NSMutableArray array];
}
#pragma mark ----下载网络数据
-(void)requestData
{
    //获取List
    NSString *pathString = [NSString stringWithFormat:@"%@?%@",ListPath,ListBody];
   [NetWorking getNetWorkData:pathString sucess:^(id object) {
    
       //self.dataArray = (NSMutableArray *)[HomeBean netdataToHomeArr:object with:CARTLIST];
       //[_table reloadData];
   } fail:^(NSError *error) {
      
   }];
    
    pathString = [NSString stringWithFormat:@"%@?%@",HomeListPath,HomeListBody];
    [NetWorking getNetWorkData:pathString sucess:^(id object) {
      _imageArr = (NSMutableArray *)[HomeBean netdataToHomeArr:object with:HOMELIST];
     [self setTableHeader];
    } fail:^(NSError *error) {
        
    }];
    pathString = [NSString stringWithFormat:@"%@?%@",HomeDetailFirstPath,HomeDetailFirstBody];
    [NetWorking getNetWorkData:pathString sucess:^(id object) {
      _detailFirst = (NSMutableArray *)[HomeBean netdataToHomeArr:object with:HOMEDETAILFIRST];
        [_table reloadData];
    } fail:^(NSError *error) {
        
    }];

    pathString = [NSString stringWithFormat:@"%@?%@",HomeDetailSecondPath,HomeDetailSecondBody];
    [NetWorking getNetWorkData:pathString sucess:^(id object) {
    _detailSecond = (NSMutableArray *)[HomeBean netdataToHomeArr:object with:HOMEDETAILSECOND];
        //[_table reloadData];
    } fail:^(NSError *error) {
        
    }];

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
    CGRect rect =CGRectMake(0, 0, ScreenWidth, ScreenHeight-50);
    _table = [[UITableView alloc]initWithFrame:rect style:UITableViewStylePlain];
    _table.delegate = self;
    _table.dataSource = self;
    [self.view addSubview:_table];
    
    [_table registerNib:[UINib nibWithNibName:@"HomeDetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"HomeDetailCell"];
    
}
-(void)setTableHeader
{
    UIImageView *headerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 285)];
    
    headerImageView.userInteractionEnabled = YES;
    
    headerImageView.backgroundColor = [UIColor colorWithRed:250/256.0 green:238/256.0 blue:225/256.0 alpha:1];
    
    ScrollViewLib *svc = [[ScrollViewLib alloc]init];
    
    NSMutableArray *photoArray = [NSMutableArray array];
    for (HeaderImage *bean in _imageArr[0]) {
        [photoArray addObject:bean.image];
    }
    
    //设置是否是用网络图片
    svc.isNotLocalImage = YES;
    
    //必须设置的图片数组
    svc.photoArray = photoArray;
    
    svc.pageControlHeight = 30;
    
    //必须写在view.frame设置之前
    svc.scrollViewFrame = CGRectMake(0, 0, headerImageView.frame.size.width, 140);
    
    svc.view.frame = CGRectMake(0, 0, headerImageView.frame.size.width, headerImageView.frame.size.height);
    
    [headerImageView addSubview:svc.view];
    
    [self addChildViewController:svc];
    
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(5, 142, headerImageView.frame.size.width-20, 16);
    label.text = @"今日最热";
    label.font = [UIFont systemFontOfSize:14];
    [headerImageView addSubview:label];
    
    NSArray *listArr = _imageArr[1];
    UIScrollView *scroll = [[UIScrollView alloc]init];
    scroll.frame = CGRectMake(0, 160, headerImageView.frame.size.width, 120);
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.showsVerticalScrollIndicator = NO;
    scroll.contentSize = CGSizeMake(80*(listArr.count), 120);
    scroll.pagingEnabled = YES;
    scroll.contentOffset = CGPointMake(0, 0);
    [headerImageView addSubview:scroll];
    for (int i = 0; i < listArr.count; i++) {
        HomeListBean *bean = listArr[i];
        UIButton *button = [[UIButton alloc]init];
        button.frame = CGRectMake(5+i*75, 0, 70, 120);
        button.layer.cornerRadius = 5;
        button.clipsToBounds = YES;
        [button setBackgroundColor:[UIColor whiteColor]];
        [scroll addSubview:button];
        
        UIImageView *listView = [[UIImageView alloc]init];
        listView.frame = CGRectMake(0, 0, 70, 70);
        listView.clipsToBounds = YES;
        [listView setImageWithURL:[NSURL URLWithString:bean.image]];
        [button addSubview:listView];
        
        UILabel *title = [[UILabel alloc]init];
        title.frame = CGRectMake(0, 70, 70, 30);
        title.text = bean.title;
        title.font = [UIFont systemFontOfSize:10];
        title.textAlignment =NSTextAlignmentCenter;
        title.lineBreakMode = NSLineBreakByTruncatingTail;
        title.numberOfLines = 2;
        [button addSubview:title];
        
        UILabel *pLabel = [[UILabel alloc]init];
        pLabel.frame = CGRectMake(0, 100, 70, 14);
        pLabel.font = [UIFont systemFontOfSize:12];
        pLabel.textColor = [UIColor redColor];
        NSString *str = [NSString stringWithFormat:@"¥%@",bean.price];
        pLabel.text = str;
        pLabel.textAlignment = NSTextAlignmentCenter;
        [button addSubview:pLabel];
    }
    
    
    
    self.table.tableHeaderView = headerImageView;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        static NSString *identy = @"HomeDetailCell";
        HomeDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identy];
        if (!cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"HomeDetailTableViewCell" owner:self options:nil]firstObject];
        }
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *str = [user objectForKey:@"currentSelected"];
    NSInteger sflag = [str integerValue];
    if (sflag == 201) {
        [cell setCellData:self.detailFirst[indexPath.row]];
    }
    else
    {
        [cell setCellData:self.detailSecond[indexPath.row]];
    }
        return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSArray *arr = @[@"今日特卖",@"即将开抢"];
    UIView *headView = [[UIView alloc]init];
    headView.backgroundColor = [UIColor whiteColor];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *str = [user objectForKey:@"currentSelected"];
    NSInteger sflag = [str integerValue];
    for (int i=0; i<2; i++) {
        UIButton *button = [[UIButton alloc]init];
        button.frame = CGRectMake(0+ScreenWidth/2*i, 0, ScreenWidth/2,38);
        [button setTitle:arr[i] forState:UIControlStateNormal];
        button.tag = 201+i;
        if (sflag == 0) {
        if (button.tag == 201 ) {
           [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [button setEnabled:NO];
            [button setSelected:YES];
        }
        else
        {
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [button setSelected:NO];
            [button setEnabled:YES];
        }
        }
        [button addTarget:self action:@selector(clickDetail:) forControlEvents:UIControlEventTouchUpInside];
        [headView addSubview:button];
        
        UIImageView *headImage = [[UIImageView alloc]init];
        headImage.tag = 101+i;
        if (sflag == 0) {
        if (headImage.tag == 101) {
            headImage.backgroundColor = [UIColor redColor];
        }
        else
        {
            headImage.backgroundColor = [UIColor grayColor];
        }
        }
        headImage.frame = CGRectMake(0+ScreenWidth/2*i, 38, ScreenWidth/2, 2);
        [headView addSubview:headImage];
        if (sflag != 0) {
            if (button.tag == sflag) {
                [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                [button setSelected:YES];
                [button setEnabled:NO];
            }
            else
            {
                [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                [button setSelected:NO];
                [button setEnabled:YES];
            }
            if (headImage.tag == (sflag-200+100)) {
                headImage.backgroundColor = [UIColor redColor];
            }
            else
            {
                headImage.backgroundColor = [UIColor grayColor];
            }
        }
    }
    return headView;
}
#pragma mark ----切换详情页开关
-(void)clickDetail:(UIButton *)button
{
    
    UIButton *buttonOther = nil;
    UIImageView *bImage = nil;
    UIImageView *oImage = nil;
    if (button.tag == 201) {
        buttonOther = (UIButton *)[self.view viewWithTag:202];
        bImage = (UIImageView *)[self.view viewWithTag:101];
        oImage = (UIImageView *)[self.view viewWithTag:102];
    }
    else
    {
        buttonOther = (UIButton *)[self.view viewWithTag:201];
        bImage = (UIImageView *)[self.view viewWithTag:102];
        oImage = (UIImageView *)[self.view viewWithTag:101];
    }
    [buttonOther setSelected:button.selected];
    [button setSelected:!button.selected];
    if (button.selected) {
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [bImage setBackgroundColor:[UIColor redColor]];
        [oImage setBackgroundColor:[UIColor grayColor]];
        [button setEnabled:NO];
        [buttonOther setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [buttonOther setEnabled:YES];
        [self setDetailContent:button.tag];
    }
    
}

#pragma mark ----切换详情页
-(void)setDetailContent:(NSInteger)flag
{
    //保存按键的现场环境到本地
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setObject:[NSString stringWithFormat:@"%ld", (long)flag] forKey:@"currentSelected"];
    [user synchronize];
    //刷新数据
    [_table reloadData];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *str = [user objectForKey:@"currentSelected"];
    NSInteger sflag = [str integerValue];
    if (sflag == 201) {
        return _detailFirst.count;
    }
    else
    {
        return _detailSecond.count;
    }
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 170;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
