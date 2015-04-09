//
//  CAIPageContentViewController.m
//  PDFReader
//
//  Created by liyufeng on 15/4/7.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "CAIPageContentViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <QuartzCore/CALayer.h>

@interface CAIPageContentViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentWith;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentHeight;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation CAIPageContentViewController

- (void)awakeFromNib{
    [super awakeFromNib];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.contentHeight.constant = self.view.bounds.size.height;
    self.contentWith.constant = self.view.bounds.size.width;
    self.pdfView.page = self.page;
}

- (void)setPage:(CGPDFPageRef)page{
    if (_page != NULL) {
        CGPDFPageRelease(_page);
        _page = NULL;
    }
    if (page != NULL) {
        _page = CGPDFPageRetain(page);
    }
}

@end
