//
//  SGMiddleBtn.m
//  MyTabBar
//
//  Created by admin on 2018/8/3.
//  Copyright © 2018年 尚钢. All rights reserved.
//

#import "SGMiddleBtn.h"
#import "UIView+Extension.h"
@implementation SGMiddleBtn

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addView];
    }
    return self;
}

-(void)setImage:(UIImage *)image forState:(UIControlState)state{
    switch (state) {
        case UIControlStateNormal:{
            CGSize size = image.size;
            _btnIcon.frame = CGRectMake(0, 0, size.width, size.height);
            _btnIcon.centerX = self.width/2;
            _btnIcon.image = image;
        }
            break;
        case UIControlStateSelected:{
            _btnIcon.highlightedImage = image;
        }
            break;
        default:
            break;
    }

}

-(void)setTitle:(NSString *)title forState:(UIControlState)state{
    _btnTitelLabel.text = title;
}

-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    _btnIcon.highlighted  = selected;
    if (selected) {
        _btnTitelLabel.textColor = [UIColor blueColor];
    }else{
        _btnTitelLabel.textColor = [UIColor grayColor];
    }
}

#pragma mark - 添加视图
- (void)addView{
    [self addSubview:self.btnIcon];
    [self addSubview:self.btnTitelLabel];
    _btnTitelLabel.frame = CGRectMake(0, self.height-18, self.width, 16);
}

- (UIImageView *)btnIcon{
    if (!_btnIcon) {
        _btnIcon = [UIImageView new];
    }
    return _btnIcon;
}

- (UILabel *)btnTitelLabel{
    if (!_btnTitelLabel) {
        _btnTitelLabel = [UILabel new];
        _btnTitelLabel.font = [UIFont systemFontOfSize:11];
        _btnTitelLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _btnTitelLabel;
}

@end
