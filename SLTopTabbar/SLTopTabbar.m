//
//  SLTopTabbar.m
//  SLTopTabbar
//
//  Created by Kevin on 15/8/14.
//  Copyright (c) 2015年 石乐. All rights reserved.
//

#import "SLTopTabbar.h"
#define SLColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define TOPTABBARHEIGHT 44
#define TOPTABBARBOTTOM 5
#define SCREEN_WIDTH                    ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT                   ([UIScreen mainScreen].bounds.size.height)

@interface SLTopTabbar ()
@property (nonatomic,strong)  UIScrollView *toptabbarView;
@property (nonatomic,strong)  UIView *toptabbarbottom;
@property (nonatomic,strong)  NSMutableArray  *items;
@property (nonatomic,assign)  CGFloat itemWidth;
@end

@implementation SLTopTabbar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.items = [[NSMutableArray alloc]init];
        CGFloat toptabbarview_width =  SCREEN_WIDTH;
        _toptabbarView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, toptabbarview_width, TOPTABBARHEIGHT)];
        _toptabbarView.showsHorizontalScrollIndicator = NO;
        [self addSubview:_toptabbarView];
        //[self viewShowShadow:self shadowRadius:10 shadowOpacity:10];
    }
    return self;
}


- (void)showLineWithButtonWidth:(CGFloat)width
{
    _toptabbarbottom = [[UIView alloc] initWithFrame:CGRectMake(0, TOPTABBARHEIGHT - TOPTABBARBOTTOM, width, TOPTABBARBOTTOM)];
    _toptabbarbottom.backgroundColor = [UIColor blueColor];
    [_toptabbarView addSubview:_toptabbarbottom];
}

- (CGFloat)contentWidthAndAddNavTabBarItemsWithButtonsWidth:(CGFloat )width
{
    CGFloat buttonX = 0;
    for (NSInteger index = 0; index < [_itemTitles count]; index++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(buttonX, 0, width, TOPTABBARHEIGHT);
        [button setTitle:_itemTitles[index] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(itemPressed:) forControlEvents:UIControlEventTouchUpInside];
        [_toptabbarView addSubview:button];
        
        [_items addObject:button];
        buttonX += width;
    }
    
    [self showLineWithButtonWidth:width];
    return buttonX;
}

- (void)itemPressed:(UIButton *)button
{
    NSInteger index = [_items indexOfObject:button];
    [_delegate itemSelectedWithIndex:index];
}


- (CGFloat)getButtonWidthWithTitles:(NSArray *)titles;
{
    CGFloat width;
    if (titles.count<4) {
        width=self.window.frame.size.width/titles.count;
    }else
    {
        width=100;
    }
    return width;
}

//- (void)viewShowShadow:(UIView *)view shadowRadius:(CGFloat)shadowRadius shadowOpacity:(CGFloat)shadowOpacity
//{
//    view.layer.shadowRadius = shadowRadius;
//    view.layer.shadowOpacity = shadowOpacity;
//}



- (void)setCurrentItemIndex:(NSInteger)currentItemIndex
{
    _currentItemIndex = currentItemIndex;
    UIButton *button = _items[currentItemIndex];
    CGFloat flag = SCREEN_WIDTH;
    
    if (button.frame.origin.x + button.frame.size.width > flag)
    {
        CGFloat offsetX = button.frame.origin.x + button.frame.size.width - flag;
        if (_currentItemIndex < [_itemTitles count] - 1)
        {
            offsetX = offsetX + 40.0f;
        }
        
        [_toptabbarView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    }
    else
    {
        [_toptabbarView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    
    [UIView animateWithDuration:0.5f animations:^{
        self.toptabbarbottom.frame = CGRectMake(button.frame.origin.x , self.toptabbarbottom.frame.origin.y, self.itemWidth , self.toptabbarbottom.frame.size.height);
    }];
}

- (void)updateData
{
    
    self.itemWidth = [self getButtonWidthWithTitles:_itemTitles];
    if (self.itemWidth)
    {
        CGFloat contentWidth = [self contentWidthAndAddNavTabBarItemsWithButtonsWidth:self.itemWidth];
        _toptabbarView.contentSize = CGSizeMake(contentWidth, 0);
    }
}

- (void)itemPressedWithIndex:(NSInteger)index
{
    [_delegate itemSelectedWithIndex:index];
}



@end
