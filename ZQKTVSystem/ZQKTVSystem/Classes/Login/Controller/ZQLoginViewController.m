//
//  ZQLoginViewController.m
//  ZQMusicPlayer
//
//  Created by 侯康柱 on 16/4/9.
//  Copyright © 2016年 HKZ. All rights reserved.
//

#import "ZQLoginViewController.h"

@interface ZQLoginViewController ()
@property (weak, nonatomic) IBOutlet ZQLineView *userNameLine;
@property (weak, nonatomic) IBOutlet ZQLineView *pswLine;
@property (weak, nonatomic) IBOutlet UITextField *usreNameTF;
@property (weak, nonatomic) IBOutlet UITextField *pswTF;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@end

@implementation ZQLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.userNameLine.lineColor = kWhiteColor;
    self.pswLine.lineColor = kWhiteColor;
    [ZQExtraUnit viewSetCorners:self.loginBtn cornersSize:6.0f];
    
    [self addDefaultBack];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginAction:(id)sender {
    if (stringIsEmpty(self.usreNameTF.text)) {
        __showAlert(@"用户名不能为空");
        return;
    }
    if (stringIsEmpty(self.pswTF.text)) {
        __showAlert(@"密码不能为空！");
        return;
    }
    
    ///模拟延时效果
    __showHUD;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        __hidenHUD;
        [self canLogin];
    });
}

- (void)canLogin {
    NSString *userName = self.usreNameTF.text;
    NSString *pswStr = [self.pswTF.text MD5Hash];
    ZQUserModel *model = [ZQFMDBTool qureyUserWithUserName:userName];
    if (!model) {
        __showAlert(@"用户不存在！");
        return;
    }
    if (![model.passWord isEqualToString:pswStr]) {
        __showAlert(@"密码不正确！");
        return;
    }
    
    [ZQAlertView showTitle:@"登录成功！"];
    
    [[ZQAccountTools sharedZQAccountTools] loginWithUser:model];
    [self.navigationController popToRootViewControllerAnimated:YES];
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
