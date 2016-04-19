//
//  ZQRegisteViewController.m
//  ZQMusicPlayer
//
//  Created by 侯康柱 on 16/4/9.
//  Copyright © 2016年 HKZ. All rights reserved.
//

#import "ZQRegisteViewController.h"

@interface ZQRegisteViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UISegmentedControl *userTypeSC;
@property (weak, nonatomic) IBOutlet UIButton *registeBtn;

@end

@implementation ZQRegisteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)registeAction:(id)sender {
    if (stringIsEmpty(self.userNameTF.text)) {
        
        return;
    }
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
