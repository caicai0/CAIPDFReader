//
//  CAIPageContentViewController.h
//  PDFReader
//
//  Created by liyufeng on 15/4/7.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CAIPdfView.h"

@interface CAIPageContentViewController : UIViewController

@property (weak, nonatomic) IBOutlet CAIPdfView *pdfView;
@property (nonatomic, assign)NSInteger pageIndex;
@property (nonatomic)CGPDFPageRef page;
@property (nonatomic)CGPDFDocumentRef pdfDoc;

@end
