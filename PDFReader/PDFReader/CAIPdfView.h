//
//  CAIPdfView.h
//  PDFReader
//
//  Created by liyufeng on 15/4/7.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CAIPdfView : UIView

@property (nonatomic)CGPDFDocumentRef pdfDoc;
@property (nonatomic,assign)NSInteger pageIndex;

@property (nonatomic)CGPDFPageRef page;
@property (nonatomic, assign)CGFloat scale;

@end
