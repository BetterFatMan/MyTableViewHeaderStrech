//
//  TableStrechingView.h
//  TableStrechingView
//
//  Created by line0 on 15/9/30.
//  Copyright © 2015年 zhanglei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableStrechingView : UIView

@property(nonatomic, strong) UITableView *strechingTable;

/** 顶部拉伸的图片 */
@property (nonatomic, weak) UIImageView *topView;

/**
 *  导航栏背景图片名称
 */
@property(nonatomic,copy)NSString* navigation_backgroundImageName;

/**
 *  头部被拉伸图片控件的高度
 */
@property (nonatomic, assign) CGFloat stretchingImageHeight;

/**
 *  头部被拉伸图片名称
 */
@property (nonatomic, copy) NSString *stretchingImageName;

/** 导航栏背景图片 */
@property (nonatomic, strong) UIImage *navigation_background_image;


- (UIImage *)imageByApplyingAlpha:(CGFloat)alpha  image:(UIImage*)image;
- (UIImage *)imageWithColor:(UIColor *)color;

@end
