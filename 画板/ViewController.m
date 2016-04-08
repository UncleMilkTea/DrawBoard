//
//  ViewController.m
//  画板
//
//  Created by 侯玉昆 on 16/3/4.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISlider *slider;

@property (weak, nonatomic) IBOutlet UIButton *redBtn;

@property (weak, nonatomic) IBOutlet DrawView *drawView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self slider:self.slider];
    
    [self clickColorBtn:self.redBtn];
    
    }
//! 保存
- (IBAction)save:(id)sender {
    
   UIImage *image = [_drawView screenShot];
    
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    
}
//! 橡皮
- (IBAction)earser:(id)sender {
    
    [self.drawView easer];
    
}
//回退
- (IBAction)back:(id)sender {
    
    [self.drawView back];
    
}
//! 清屏
- (IBAction)clearScreen:(id)sender {
    
    [self.drawView clearScreen];
    
}
//! 颜色按钮
- (IBAction)clickColorBtn:(UIButton *)sender {
    
    self.drawView.lineColor = sender.backgroundColor;
    
}
//! 滑动条
- (IBAction)slider:(id)sender {
    
    self.drawView.lineWidth = _slider.value;
    
}

//隐藏状态栏
- (BOOL)prefersStatusBarHidden{
    
    return YES;
}

@end
