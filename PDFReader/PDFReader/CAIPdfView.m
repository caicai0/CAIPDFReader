//
//  CAIPdfView.m
//  PDFReader
//
//  Created by liyufeng on 15/4/7.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "CAIPdfView.h"

@implementation CAIPdfView

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setup];
}

- (void)setup{
    CATiledLayer *tiledLayer = (CATiledLayer *)[self layer];
    tiledLayer.levelsOfDetail = 4;
    tiledLayer.levelsOfDetailBias = 3;
    tiledLayer.tileSize = CGSizeMake(512.0, 512.0);
//    self.myScale = scale;
}

+ (Class)layerClass
{
    return [CATiledLayer class];
}

- (void)setPage:(CGPDFPageRef)page{
    if (_page != NULL) {
        CGPDFPageRelease(_page);
        _page = NULL;
    }
    if (page != NULL) {
        _page = CGPDFPageRetain(page);
        [self setNeedsDisplay];
    }
}
- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)context{
    [super drawLayer:layer inContext:context];
    CGPDFPageRef page = self.page;
    if( page == NULL ) return;
    
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 0.0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextConcatCTM(context, CGPDFPageGetDrawingTransform(page, kCGPDFMediaBox, self.bounds, 0, true));
    
    CGContextDrawPDFPage(context, page);
    CGContextRestoreGState(context);
}

- (void)dealloc{
    if (_page != NULL) {
        CGPDFPageRelease(_page);
        _page = NULL;
    }
}

@end
