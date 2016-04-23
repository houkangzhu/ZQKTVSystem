//
//  ZQImagePickerTool.m
//  ZQKTVSystem
//
//                            _ooOoo_
//                           o8888888o
//                           88" . "88
//                           (| -_- |)
//                            O\ = /O
//                        ____/`---'\____
//                      .   ' \\| |// `.
//                       / \\||| : |||// \
//                     / _||||| -:- |||||- \
//                       | | \\\ - /// | |
//                     | \_| ''\---/'' | |
//                      \ .-\__ `-` ___/-. /
//                   ___`. .' /--.--\ `. . __
//                ."" '< `.___\_<|>_/___.' >'"".
//               | | : `- \`.;`\ _ /`;.`/ - ` : | |
//                 \ \ `-. \_ __\ /__ _/ .-` / /
//         ======`-.____`-.___\_____/___.-`____.-'======
//                            `=---='
//         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//                   佛祖保佑           永无BUG
//         .............................................
//
//  Created by 侯康柱 on 16/4/23.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import "ZQImagePickerTool.h"
#import "ZQCameraController.h"

@interface ZQImagePickerTool ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate, ZQCameraControllerDelegate>

@property (nonatomic, strong) UIViewController *showVC;
@property (nonatomic, assign) BOOL allowEdit;

@property (nonatomic, strong) void(^selectIMGBlock)(UIImage *didselectImg);

@end

@implementation ZQImagePickerTool

- (instancetype)initInVC:(UIViewController *)showVC {
    if (self = [super init]) {
        self.showVC = showVC;
    }
    return self;
}

- (void)showActionSheet {
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"上传头像" delegate:nil cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"从相册", @"拍照", nil];
    [sheet setButttonAction:^(UIActionSheet *actionSheet, NSInteger buttonIndex) {
        if (buttonIndex == 0) {
            ///相册
            [self LocalPhoto];
        }
        if (buttonIndex == 1) {
            ///拍照
            [self takePhoto];
        }
    }];
    
    [sheet showInView:self.showVC.view];
}


- (void)LocalPhoto {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    //设置选择后的图片可被编辑
    picker.allowsEditing = self.allowEdit;
    
    [self.showVC presentViewController:picker animated:YES completion:NULL];
}

- (void)takePhoto {
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        
        picker.delegate = self;
        //设置拍照后的图片可被编辑
        picker.allowsEditing = self.allowEdit;
        picker.sourceType = sourceType;
        [self.showVC presentViewController:picker animated:YES completion:NULL];
    }else
    {
        __showAlert(@"模拟其中无法打开照相机,请在真机中使用");
    }
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *seledImg = nil;
    if (self.allowEdit) {
        seledImg = [info objectForKey:UIImagePickerControllerEditedImage];
    }
    else {
        seledImg = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
  
    if (self.selectIMGBlock) {
        self.selectIMGBlock(seledImg);
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}


- (void)tackPhotoNew {
    ZQCameraController *camare = [[ZQCameraController alloc] init];
    camare.delegate = self;
    [self.showVC presentViewController:camare animated:YES completion:nil];
}

- (void)cameraController:(ZQCameraController *)camaraVC didImage:(UIImage *)image {
    
}

- (void)cameraControllerCancel:(ZQCameraController *)camaraVC {
    
}


+ (void)pickerImageInViewController:(UIViewController *)vc allowEdit:(BOOL)edit heandleBlock:(void (^)(UIImage *))handler {
    
    ZQImagePickerTool *tool = [[ZQImagePickerTool alloc] initInVC:vc];
    tool.selectIMGBlock = handler;
    
    [tool showActionSheet];
//    UIImage
    
}

@end
