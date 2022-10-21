//
//  EaseExtFuncModel.m
//  EaseIMKit
//
//  Created by 娜塔莎 on 2020/12/7.
//  Copyright © 2020 djp. All rights reserved.
//

#import "EaseExtFuncModel.h"
#import "UIColor+EaseUI.h"

@implementation EaseExtFuncModel

- (instancetype)init
{
    if (self = [super init]) {
        _iconBgColor = [UIColor clearColor];
        _viewBgColor = [UIColor colorWithHexString:@"#F8F8F8"];
        _fontColor = [UIColor colorWithHexString:@"#7E7E7E"];
        _font = [UIFont systemFontOfSize:12];
        _collectionViewSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 265);
    }
    return self;
}

- (void)setIconBgColor:(UIColor *)iconBgColor
{
    if (iconBgColor) {
        _iconBgColor = iconBgColor;
    }
}

- (void)setViewBgColor:(UIColor *)viewBgColor
{
    if (viewBgColor) {
        _viewBgColor = viewBgColor;
    }
}

- (void)setFontColor:(UIColor *)fontColor
{
    if (fontColor) {
        _fontColor = fontColor;
    }
}

- (void)setFont:(UIFont*)font
{
    if (font) {
        _font = font;
    }
}

- (void)setCollectionViewSize:(CGSize)collectionViewSize
{
    _collectionViewSize = collectionViewSize;
}

@end
