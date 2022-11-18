//
//  UIImage+EaseUI.m
//  EaseIMKit
//
//  Created by 杜洁鹏 on 2020/11/15.
//

#import "UIImage+EaseUI.h"
#import <objc/runtime.h>

@implementation UIImage (EaseUI)
+ (UIImage *)easeUIImageNamed:(NSString *)name {
    return [UIImage easeBundleImageNamed:name bundle:@"EaseIMKit"];
}

+ (UIImage *)easeBundleImageNamed:(NSString *)name bundle: (NSString *)bundle {
    NSString *path = [[NSBundle mainBundle] pathForResource:bundle ofType:@"bundle"];
    NSString *imagePath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png",name]];
    return [UIImage imageWithContentsOfFile:imagePath];
}
@end
