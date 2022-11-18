//
//  EMMsgExtGifBubbleView.m
//  ChatDemo-UI3.0
//
//  Created by XieYajie on 2019/2/14.
//  Copyright © 2019 XieYajie. All rights reserved.
//

#import "EMMsgExtGifBubbleView.h"
#import "EaseEmoticonGroup.h"

@implementation EMMsgExtGifBubbleView

- (instancetype)initWithDirection:(EMMessageDirection)aDirection
                             type:(EMMessageType)aType
                        viewModel:(EaseChatViewModel *)viewModel
{
    self = [super initWithDirection:aDirection type:aType viewModel:viewModel];
    if (self) {
        self.gifView = [[EaseAnimatedImgView alloc] init];
        [self addSubview:self.gifView];
        [self.gifView Ease_makeConstraints:^(EaseConstraintMaker *make) {
            make.edges.equalTo(self);
            make.width.height.lessThanOrEqualTo(@100);
        }];
        self.imgView = [[UIImageView alloc] init];
        [self addSubview:self.imgView];
        [self.imgView Ease_makeConstraints:^(EaseConstraintMaker *make) {
            make.edges.equalTo(self).inset(20);
            make.width.height.lessThanOrEqualTo(@50);
        }];
    }
    
    return self;
}

#pragma mark - Setter

- (void)setModel:(EaseMessageModel *)model
{
    EMMessageType type = model.type;
    [self.gifView setHidden: YES];
    self.gifView.animatedImage = nil;
    [self.imgView setHidden: YES];
    if (type == EMMessageTypeExtGif) {
        [self.gifView setHidden: NO];
        NSString *localeLanguageCode = [[NSLocale currentLocale] objectForKey:NSLocaleLanguageCode];;
        NSString *name = [(EMTextMessageBody *)model.message.body text];
        if ([localeLanguageCode isEqualToString:@"zh"] && [name containsString:@"Example"]) {
            name = [name stringByReplacingOccurrencesOfString:@"Example" withString:@"示例"];
        }
        if ([localeLanguageCode isEqualToString:@"en"] && [name containsString:@"示例"]) {
            name = [name stringByReplacingOccurrencesOfString:@"示例" withString:@"Example"];
        }
        EaseEmoticonGroup *group = [EaseEmoticonGroup getGifGroup];
        for (EaseEmoticonModel *model in group.dataArray) {
            if ([model.name isEqualToString:name]) {
                NSString *path = [[NSBundle mainBundle] pathForResource:@"EaseIMKit" ofType:@"bundle"];
                NSString *gifPath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.gif",model.original]];
                NSData *imageData = [NSData dataWithContentsOfFile:gifPath];
                self.gifView.animatedImage = [EaseAnimatedImg animatedImageWithGIFData:imageData];
                break;
            }
        }
    }
    if (type == EMMessageTypeExtCodeImage) {
        [self.imgView setHidden: NO];
        NSString *name = model.message.ext[MSG_EXT_GIF_ID];
        EaseEmoticonGroup *group = [EaseEmoticonGroup getShakenGroup];
        for (EaseEmoticonModel *model in group.dataArray) {
            if ([model.eId isEqualToString:name]) {
                self.imgView.image = [UIImage easeBundleImageNamed:model.imgName bundle:model.name];
                break;
            }
        }
    }
}

@end
