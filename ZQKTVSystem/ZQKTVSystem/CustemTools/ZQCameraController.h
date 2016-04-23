//
//  ZQCameraController.h
//  ZQKTVSystem
//
//  Created by 侯康柱 on 16/4/23.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ZQCameraControllerDelegate;

@interface ZQCameraController : UIViewController

@property (nonatomic, assign) id<ZQCameraControllerDelegate> delegate;
//@property (nonatomic, strong) void(^didCamareBlcok)(ZQCameraController *controller,UIImage *image);

@end


@protocol ZQCameraControllerDelegate <NSObject>

- (void)cameraController:(ZQCameraController *)camaraVC didImage:(UIImage *)image;

- (void)cameraControllerCancel:(ZQCameraController *)camaraVC;
@end