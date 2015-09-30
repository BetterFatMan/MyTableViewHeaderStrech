//
//  ViewController.m
//  TableStrechingView
//
//  Created by line0 on 15/9/30.
//  Copyright © 2015年 zhanglei. All rights reserved.
//

#import "ViewController.h"
#import "TableStrechingView.h"


@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>
{
    TableStrechingView *_strechingView;
    UIButton *leftBtn;
    UIButton *rightBtn;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    _strechingView = [[TableStrechingView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_strechingView];
    _strechingView.strechingTable.delegate = self;
    _strechingView.strechingTable.dataSource = self;
    
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
        // 1、 设置导航栏的背景图片
    _strechingView.navigation_backgroundImageName = @"navigation_background";
    
        // 2、设置被拉伸图片view的高度
    _strechingView.stretchingImageHeight = 200;
    
        // 3、设置头部拉伸图片的名称
    _strechingView.stretchingImageName = @"icon_bg";
    
    
    
    
    leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 30)];
    [leftBtn setTitle:@"left" forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    rightBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 30)];
    [rightBtn setTitle:@"right" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)leftBtnClick {
    NSLog(@"leftClick");
}


-(void)rightBtnClick {
    NSLog(@"rightClick");
}



#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据---%ld", (long)indexPath.row];
    
    return cell;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat yOffset  = scrollView.contentOffset.y;
    CGFloat xOffset = (yOffset + _strechingView.stretchingImageHeight) / 2;
    
    if (yOffset < -_strechingView.stretchingImageHeight) {
        CGRect rect = _strechingView.topView.frame;
        rect.origin.y = 0;
        rect.size.height =  -yOffset ;
        rect.origin.x = xOffset;
        rect.size.width = scrollView.frame.size.width + fabs(xOffset) * 2;
        
        _strechingView.topView.frame = rect;
    }
    
    CGFloat alpha = (yOffset + _strechingView.stretchingImageHeight) / _strechingView.stretchingImageHeight;
    if(self.edgesForExtendedLayout == UIRectEdgeTop || self.edgesForExtendedLayout == UIRectEdgeAll){
        [self.navigationController.navigationBar setBackgroundImage:[_strechingView imageByApplyingAlpha:alpha image:_strechingView.navigation_background_image == nil?[_strechingView imageWithColor:[UIColor orangeColor]]:_strechingView.navigation_background_image] forBarMetrics:UIBarMetricsDefault];
    }
}

@end
