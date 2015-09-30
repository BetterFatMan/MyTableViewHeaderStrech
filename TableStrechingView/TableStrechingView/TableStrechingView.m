//
//  TableStrechingView.m
//  TableStrechingView
//
//  Created by line0 on 15/9/30.
//  Copyright © 2015年 zhanglei. All rights reserved.
//

#import "TableStrechingView.h"


@interface TableStrechingView ()


@end

@implementation TableStrechingView

-(UIImage *)navigation_background_image{
    if(!_navigation_background_image){
        if(self.navigation_backgroundImageName){
            _navigation_background_image = [UIImage imageNamed:self.navigation_backgroundImageName];
        }
    }
    return _navigation_background_image;
}

-(void)setStretchingImageHeight:(CGFloat)stretchingImageHeight{
    _stretchingImageHeight = stretchingImageHeight;
    self.strechingTable.contentInset = UIEdgeInsetsMake(stretchingImageHeight , 0, 0, 0);
    self.topView.frame = CGRectMake(0, 0, self.strechingTable.frame.size.width, stretchingImageHeight);
}

- (void)setStretchingImageName:(NSString *)stretchingImageName{
    _stretchingImageName = stretchingImageName;
    self.topView.image = [UIImage imageNamed:stretchingImageName];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.strechingTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame)) style:UITableViewStylePlain];
        [self addSubview:self.strechingTable];
        self.strechingTable.backgroundColor = [UIColor clearColor];
            // 设置内边距(让cell往下移动一段距离)
        self.strechingTable.contentInset = UIEdgeInsetsMake(_stretchingImageHeight , 0, 0, 0);
        
        
        UIImageView *topView = [[UIImageView alloc] init];
        topView.frame = CGRectMake(0, 0, self.strechingTable.frame.size.width, 0);
        [self addSubview:topView];
        self.topView = topView;
        [self bringSubviewToFront:self.strechingTable];
    }
    return self;
}

    //设置图片透明度
- (UIImage *)imageByApplyingAlpha:(CGFloat)alpha  image:(UIImage*)image
{
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, image.size.width, image.size.height);
    
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    
    CGContextSetAlpha(ctx, alpha);
    
    CGContextDrawImage(ctx, area, image.CGImage);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (UIImage *)imageWithColor:(UIColor *)color
{
        // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
        // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
        // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
        // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
        // 渲染上下文
    CGContextFillRect(context, rect);
        // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
        // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}

@end
