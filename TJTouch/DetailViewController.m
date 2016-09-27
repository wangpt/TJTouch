//
//  DetailViewController.m
//  TJTouch
//
//  Created by 王朋涛 on 16/9/21.
//  Copyright © 2016年 tao. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Preview Actions

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems
{
    
    // 生成UIPreviewAction
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"事件 1" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        if ([self.delegate respondsToSelector:@selector(detailViewController:DidSelectedItem:)]) {
            [self.delegate detailViewController:self DidSelectedItem:self.title];
        }
    }];
    
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"事件 2" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Action 2 selected");
    }];
    
    UIPreviewAction *action3 = [UIPreviewAction actionWithTitle:@"事件 3" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Action 3 selected");
    }];
    
    NSArray *actions = @[action1, action2, action3];
    UIPreviewActionGroup *group1 = [UIPreviewActionGroup actionGroupWithTitle:@"一组事件" style:UIPreviewActionStyleDefault actions:actions];
    NSArray *group = @[group1,action1,action2,action3];
    //当然你也可以反三个单独的action对象的数组，而不是group，具体效果，可以自己试一下
    
    return group;
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
