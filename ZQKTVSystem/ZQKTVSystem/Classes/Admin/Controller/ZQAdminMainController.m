//
//  ZQAdminMainController.m
//  ZQKTVSystem
//
//  Created by 侯康柱 on 16/4/23.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import "ZQAdminMainController.h"
#import "ZQUserInfoView.h"
#import "ZQImagePickerTool.h"
@interface ZQAdminMainController ()<UITableViewDataSource, UITableViewDelegate> {
    NSArray *_leftTbDataArr;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewWidth;
@property (weak, nonatomic) IBOutlet UIView *rightView;

@end

@implementation ZQAdminMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = NO;
    [self addDefaultBack];
    
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    _leftTbDataArr = @[@"个人信息", @"用户管理", @"歌曲库管理", @"推荐歌曲配置", @"新歌配置", @"分类配置"];
    
    [self setRightViewSubviews:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _leftTbDataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = _leftTbDataArr[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self setRightViewSubviews:indexPath.row];
}

- (void)setRightViewSubviews:(NSInteger)type {
    for (UIView *subView in self.rightView.subviews) {
        [subView removeFromSuperview];
    }
    
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:type inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
    
    [self.rightView layoutIfNeeded];
    [self.rightView layoutSubviews];
    
    
    if (type == 0) {
        ZQUserInfoView *view = [ZQUserInfoView createInfoView];
        view.user = [ZQAccountTools sharedZQAccountTools].currentAccount;
        view.frame = self.rightView.bounds;
        view.changeHeadBlock = ^(UIButton *sender) {
            [self setHeadActionToButton:sender];
        };
        view.exitAccountBlock = ^ {
            [self exitAccountAction];
        };
        [self.rightView addSubview:view];
        return;
    }
    
}

- (void)setHeadActionToButton:(UIButton *)sender {
    
    __showAlert(@"暂未实现");
//    [ZQImagePickerTool pickerImageInViewController:self allowEdit:YES heandleBlock:^(UIImage *image) {
//       
//        UIImage *zoomImg = [ZQExtraUnit zoomImage:image MinSize:100];
//        
//    }];

}

- (void)exitAccountAction {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"确定退出账户" message:nil delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert setButttonAction:^(UIAlertView *alertView, NSInteger buttonIndex) {
        if (buttonIndex != alertView.cancelButtonIndex) {
            
            [[ZQAccountTools sharedZQAccountTools] exitCurrentAccount];
            
            [self.navigationController popViewControllerAnimated:YES];
            
        }
    }];
    [alert show];
}

@end
