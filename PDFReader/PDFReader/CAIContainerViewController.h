//
//  CAIContainerViewController.h
//  PDFReader
//
//  Created by liyufeng on 15/4/7.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CAIPageViewController.h"

@interface CAIContainerViewController : UIViewController

@property (nonatomic, strong)CAIPageViewController * pageViewController;
@property (nonatomic, strong)NSString * filePath;

@end
