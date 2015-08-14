//
//  SLTopTabbarController.h
//  SLTopTabbar
//
//  Created by Kevin on 15/8/14.
//  Copyright (c) 2015年 石乐. All rights reserved.
//

#import <UIKit/UIKit.h>


@class SLTopTabbar;

@interface SLTopTabbarController : UIViewController
@property (nonatomic, assign)   BOOL        scrollAnimation;
@property (nonatomic, strong)   NSArray     *subViewControllers;
@property (nonatomic, strong)   UIColor     *navTabBarColor;           
@property (nonatomic, strong)   UIColor     *navTabBarLineColor;

- (void)addParentController:(UIViewController *)viewController;

@end
