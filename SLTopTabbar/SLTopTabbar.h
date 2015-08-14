//
//  SLTopTabbar.h
//  SLTopTabbar
//
//  Created by Kevin on 15/8/14.
//  Copyright (c) 2015年 石乐. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SLTopTabbarDelegate <NSObject>
@optional
- (void)itemSelectedWithIndex:(NSInteger)index;
@end

@interface SLTopTabbar : UIView

@property (nonatomic, weak)     id <SLTopTabbarDelegate>delegate;
@property (nonatomic, assign)   NSInteger   currentItemIndex;
@property (nonatomic, strong)   NSArray     *itemTitles;
@property (nonatomic, strong)   UIColor     *lineColor;
- (void)updateData;
@end
