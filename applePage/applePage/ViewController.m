//
//  ViewController.m
//  applePage
//
//  Created by liyufeng on 15/4/9.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "ViewController.h"
#import "RootViewController.h"

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
    RootViewController * controller = [[UIStoryboard storyboardWithName:@"pdf" bundle:nil] instantiateViewControllerWithIdentifier:@"RootViewController"];
    controller.filePath = [[NSBundle mainBundle]pathForResource:@"input_pdf" ofType:@"pdf"];
    [self presentViewController:controller animated:YES completion:nil];
}


@end
