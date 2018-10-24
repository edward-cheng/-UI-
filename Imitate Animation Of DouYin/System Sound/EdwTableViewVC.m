//
//  EdwTableViewVC.m
//  Imitate Animation Of DouYin
//
//  Created by EdwardCheng on 2018/10/24.
//  Copyright © 2018年 EdwardCheng. All rights reserved.
//

#import "EdwTableViewVC.h"
#import "EdwTableViewCell.h"
#import <MediaPlayer/MediaPlayer.h>

@interface EdwTableViewVC ()

@end

@implementation EdwTableViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = [UIScreen mainScreen].bounds.size.height;
    self.tableView.pagingEnabled = YES;
    
    //添加这个将不会出现系统声音的UI
    MPVolumeView *volumeView = [[MPVolumeView alloc] initWithFrame:CGRectMake(-1000, -2000, 0.01, 0.01)];
    [self.view addSubview:volumeView];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EdwTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EdwTableViewCell"];
    
    if (!cell) {
        cell = [[EdwTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"EdwTableViewCell"];
    }
    cell.lab.text = [NSString stringWithFormat:@"使用真机调节音量大小%ld",(long)indexPath.row];
    return cell;
}

@end
