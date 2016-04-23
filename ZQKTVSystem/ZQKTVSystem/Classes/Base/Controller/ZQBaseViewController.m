//
//  ZQBaseViewController.m
//  ZQMusicPlayer
//
//  Created by 侯康柱 on 16/4/2.
//  Copyright © 2016年 HKZ. All rights reserved.
//

#import "ZQBaseViewController.h"

@interface ZQBaseViewController ()

@property (nonatomic, strong) MBProgressHUD *HUD;

@end

@implementation ZQBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addDefaultBack {
    if (self.navigationController.navigationBarHidden) {
        UIButton *backBtn = [ZQExtraUnit createButtonWithTitle:@"返回" frame:CGRectMake(10, 10, 60, 40) nomImage:nil taget:self select:@selector(backAction)];
        [backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [backBtn setTitleColor:kWhiteColor forState:UIControlStateNormal];
        [self.view addSubview:backBtn];
        [self.view bringSubviewToFront:backBtn];
        
        return;
    }
    
    UIButton *backBtn = [ZQExtraUnit createButtonWithTitle:@"返回" frame:CGRectMake(10, 10, 60, 40) nomImage:nil taget:self select:@selector(backAction)];
    [backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backBtn setTitleColor:kWhiteColor forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
}

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
