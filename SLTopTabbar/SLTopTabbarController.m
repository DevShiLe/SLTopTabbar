//
//  SLTopTabbarController.m
//  SLTopTabbar
//
//  Created by Kevin on 15/8/14.
//  Copyright (c) 2015年 石乐. All rights reserved.
//

#import "SLTopTabbarController.h"
#import "SLTopTabbar.h"

#define SLColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define TOPTABBARHEIGHT 44
#define TOPTABBARBOTTOM 5
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define STATUS_BAR_HEIGHT 20.0
@interface SLTopTabbarController () <UIScrollViewDelegate, SLTopTabbarDelegate>
@property (nonatomic,assign)  NSInteger currentindex;
@property (nonatomic,copy)  NSMutableArray  *titles;
@property (nonatomic,strong)  SLTopTabbar *navTabBar;
@property (nonatomic,strong)  UIScrollView *mainView;
@end

@implementation SLTopTabbarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setviewinit];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (void)setviewinit
{
    [self viewinit];
    
    [_subViewControllers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
        
        UIViewController *viewController = (UIViewController *)_subViewControllers[idx];
        viewController.view.frame = CGRectMake(idx * SCREEN_WIDTH, 0, SCREEN_WIDTH, _mainView.frame.size.height);
        [_mainView addSubview:viewController.view];
        [self addChildViewController:viewController];
    }];
}

- (void)viewinit
{
    _currentindex = 1;
    _navTabBarColor = [UIColor whiteColor];
    _titles = [[NSMutableArray alloc] initWithCapacity:_subViewControllers.count];
    for (UIViewController *viewController in _subViewControllers)
    {
        [_titles addObject:viewController.title];
    }
    _navTabBar = [[SLTopTabbar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, TOPTABBARHEIGHT)];
    _navTabBar.delegate = self;
    _navTabBar.backgroundColor = _navTabBarColor;
    _navTabBar.lineColor = _navTabBarLineColor;
    _navTabBar.itemTitles = _titles;
    [_navTabBar updateData];
    
    _mainView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, _navTabBar.frame.origin.y + _navTabBar.frame.size.height, SCREEN_WIDTH, SCREEN_HEIGHT - _navTabBar.frame.origin.y - _navTabBar.frame.size.height - STATUS_BAR_HEIGHT - TOPTABBARHEIGHT)];
    _mainView.delegate = self;
    _mainView.pagingEnabled = YES;
    _mainView.showsHorizontalScrollIndicator = NO;
    _mainView.contentSize = CGSizeMake(SCREEN_WIDTH * _subViewControllers.count, 0);
    [self.view addSubview:_mainView];
    [self.view addSubview:_navTabBar];
}




- (void)addParentController:(UIViewController *)viewController
{
    if ([viewController respondsToSelector:@selector(edgesForExtendedLayout)])
    {
        viewController.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    [viewController addChildViewController:self];
    [viewController.view addSubview:self.view];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _currentindex = scrollView.contentOffset.x / SCREEN_WIDTH;
    _navTabBar.currentItemIndex = _currentindex;
}

- (void)itemSelectedWithIndex:(NSInteger)index
{
    [_mainView setContentOffset:CGPointMake(index * SCREEN_WIDTH, 0) animated:_scrollAnimation];
}

@end
