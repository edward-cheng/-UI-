//
//  ViewController.m
//  Imitate Animation Of DouYin
//
//  Created by EdwardCheng on 2018/10/24.
//  Copyright © 2018年 EdwardCheng. All rights reserved.
//

#import "ViewController.h"
#import "EdwPlayerProgressView.h"
#import "EdwVideoLanternView.h"
#import "EdwVideoMusicView.h"

@interface ViewController ()
@property (strong, nonatomic) EdwPlayerProgressView *progressView;
@property (nonatomic, assign) CGFloat progress;

@property (strong, nonatomic) EdwVideoLanternView *lanternView;
@property (strong, nonatomic) EdwVideoMusicView *musicView;
@property (weak, nonatomic) IBOutlet UITextField *musicTextField;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    _progressView = [[EdwPlayerProgressView alloc]init];
    _progressView.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:_progressView];
    [_progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).mas_offset(10);
        make.right.mas_equalTo(self.view).mas_offset(-10);
        make.top.mas_equalTo(self.view).mas_offset(70);
        make.height.mas_equalTo(2);
    }];
    
    _lanternView = [[EdwVideoLanternView alloc]init];
    [self.view addSubview:_lanternView];
    [_lanternView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).mas_offset(10);
        make.width.mas_equalTo(200);
        make.top.mas_equalTo(150);
        make.height.mas_equalTo(20);
    }];
    
    _musicView = [[EdwVideoMusicView alloc]init];
    [self.view addSubview:_musicView];
    [_musicView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    NSString *text = @"忘情水 - 刘德华";
    self.lanternView.text = text;
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}
//播放
- (IBAction)play:(UIButton *)sender {
    [self startTimer];
}

- (void)startTimer{
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES
                                               block:^(NSTimer * _Nonnull timer) {
                                                   self.progress += 0.1;
                                                   
                                                   if (self.progress >= 1.0) {
                                                       self.progress = 0;
                                                   }
                                                   self.progressView.playingProgress = self.progress;
                                               }];
}

//缓存中
- (IBAction)burffer:(UIButton *)sender {
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
    [self.progressView startBurfferAnimate];
}

//更换音乐
- (IBAction)changeMusicName:(UIButton *)sender {
    _lanternView.text = self.musicTextField.text;
}

//开始
- (IBAction)didClickStart:(UIButton *)sender {
    [_lanternView startOrResumeAnimate];
    [_musicView startOrResumeAnimate];
}

//暂停
- (IBAction)didClickPause:(UIButton *)sender {
    [_lanternView pauseAnimate];
    [_musicView pauseAnimate];
}

//继续
- (IBAction)didClickResume:(UIButton *)sender {
    [_lanternView resumeAnimate];
    [_musicView resumeAnimate];
}

//停止
- (IBAction)didClickStop:(UIButton *)sender {
    [_lanternView stopAnimate];
    [_musicView stopAnimate];
}

-(void)dealloc{
    NSLog(@"释放 - %@",[self class]);
}
@end
