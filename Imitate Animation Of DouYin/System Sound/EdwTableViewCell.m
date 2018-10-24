//
//  EdwTableViewCell.m
//  Imitate Animation Of DouYin
//
//  Created by EdwardCheng on 2018/10/24.
//  Copyright © 2018年 EdwardCheng. All rights reserved.
//

#import "EdwTableViewCell.h"
#import "EdwVideoSoundSlider.h"

@interface EdwTableViewCell ()
@property (nonatomic, strong) EdwVideoSoundSlider *slider;
@end

@implementation EdwTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}

- (void)initUI{
    _lab = [[UILabel alloc]init];
    _lab.numberOfLines = 0;
    [self.contentView addSubview:_lab];
    
    _slider = [[EdwVideoSoundSlider alloc]init];
    _slider.backgroundColor = [UIColor blackColor];
    _slider.hidden = YES;
    [self.contentView addSubview:_slider];
    [self systemSound];
    
    [_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(20);
        make.left.mas_equalTo(self.contentView).offset(20);
        make.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(50);
    }];
    
    [_slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.contentView);
        make.width.mas_equalTo(self.contentView).offset(20);
        make.height.mas_equalTo(1);
    }];
    
}

//监听系统声音
- (void)systemSound{
    //监听系统声音
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(volumeChanged:) name:@"AVSystemController_SystemVolumeDidChangeNotification" object:nil];
}

//系统声音改变
-(void)volumeChanged:(NSNotification *)notification
{
    float volume = [[[notification userInfo] objectForKey:@"AVSystemController_AudioVolumeNotificationParameter"] floatValue];
    [_slider setValue:volume animate:YES];
    NSLog(@"系统声音= %f",volume);
}

@end
