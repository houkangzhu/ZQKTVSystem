//
//  ZQMainLoginVC.m
//  ZQMusicPlayer
//
//  Created by 侯康柱 on 16/4/9.
//  Copyright © 2016年 HKZ. All rights reserved.
//

#import "ZQMainLoginVC.h"

@interface ZQMainLoginVC ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *registBtn;

@end

@implementation ZQMainLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setSubViews];
}

- (void)backAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)setSubViews {
    [self addDefaultBack];
    [ZQExtraUnit viewSetBorder:self.loginBtn border:1.0 borderColor:kThemeColor corner:6.0];
    [ZQExtraUnit viewSetBorder:self.registBtn border:1.0 borderColor:kThemeColor corner:6.0];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginAction:(id)sender {
}
- (IBAction)registAction:(id)sender {
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
