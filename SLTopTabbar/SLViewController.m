
//
//  SLViewController.m
//  SLTopTabbar
//
//  Created by Kevin on 15/8/14.
//  Copyright (c) 2015年 石乐. All rights reserved.
//

#import "SLViewController.h"
#import "SLTopTabbarController.h"
@interface SLViewController ()

@end

@implementation SLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableViewController *oneViewController = [[UITableViewController alloc] init];
    oneViewController.title = @"用户";
    oneViewController.view.backgroundColor = [UIColor brownColor];
    
    UITableViewController *twoViewController = [[UITableViewController alloc] init];
    twoViewController.title = @"单音";
    twoViewController.view.backgroundColor = [UIColor purpleColor];
    
    UITableViewController *threeViewController = [[UITableViewController alloc] init];
    threeViewController.title = @"娱乐";
    threeViewController.view.backgroundColor = [UIColor orangeColor];
    
    UITableViewController *fourViewController = [[UITableViewController alloc] init];
    fourViewController.title = @"鬼畜";
    fourViewController.view.backgroundColor = [UIColor magentaColor];
    
    UITableViewController *fiveViewController = [[UITableViewController alloc] init];
    fiveViewController.title = @"生活";
    fiveViewController.view.backgroundColor = [UIColor yellowColor];
    
    UITableViewController *sixViewController = [[UITableViewController alloc] init];
    sixViewController.title = @"Cosplay";
    sixViewController.view.backgroundColor = [UIColor cyanColor];
    
    UITableViewController *sevenViewController = [[UITableViewController alloc] init];
    sevenViewController.title = @"翻唱及原创";
    sevenViewController.view.backgroundColor = [UIColor blueColor];
    
    UITableViewController *eightViewController = [[UITableViewController alloc] init];
    eightViewController.title = @"二次元音乐";
    eightViewController.view.backgroundColor = [UIColor greenColor];
    
    UITableViewController *ninghtViewController = [[UITableViewController alloc] init];
    ninghtViewController.title = @"三次元音乐";
    ninghtViewController.view.backgroundColor = [UIColor redColor];
    
    SLTopTabbarController *navTabBarController = [[SLTopTabbarController alloc] init];
    navTabBarController.subViewControllers = @[oneViewController, twoViewController, threeViewController, fourViewController, fiveViewController, sixViewController, sevenViewController, eightViewController, ninghtViewController];
    [navTabBarController addParentController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
