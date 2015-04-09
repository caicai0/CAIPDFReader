//
//  ViewController.m
//  PDFReader
//
//  Created by liyufeng on 15/4/7.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "ViewController.h"
#import "CAIContainerViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clicked:(id)sender {
    CAIContainerViewController * controller = [[UIStoryboard storyboardWithName:@"CAIReader" bundle:nil] instantiateViewControllerWithIdentifier:@"CAIContainerViewController"];
    NSString *filepath = [[NSBundle mainBundle]pathForResource:@"123" ofType:@"pdf"];
    controller.filePath = filepath;
    [self presentViewController:controller animated:YES completion:NULL];
}

@end
