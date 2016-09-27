//
//  DetailViewController.h
//  TJTouch
//
//  Created by 王朋涛 on 16/9/21.
//  Copyright © 2016年 tao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DetailViewController;

@protocol DetailViewControllerDelegate <NSObject>
@optional
// 按钮点击
- (void)detailViewController:(DetailViewController *)detailVC DidSelectedItem:(NSString *)navTitle;
@required
// 返回按钮点击
- (void)detailViewControllerDidSelectedBackItem:(DetailViewController *)detailVC;
@end
@interface DetailViewController : UIViewController
@property (nonatomic , weak) id<DetailViewControllerDelegate>delegate;

@end
