//
//  CAIContainerViewController.m
//  PDFReader
//
//  Created by liyufeng on 15/4/7.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "CAIContainerViewController.h"
#import "CAIPageContentViewController.h"

@interface CAIContainerViewController ()<UIPageViewControllerDataSource,UIPageViewControllerDelegate>

@property (nonatomic, assign)NSInteger pageNumber;

@property (nonatomic) CGPDFDocumentRef pdfDoc;


@end

@implementation CAIContainerViewController

- (void)awakeFromNib{
    [super awakeFromNib];
    
}

- (void)setFilePath:(NSString *)filePath{
    if (filePath) {
        _filePath = filePath;
        CFStringRef path = CFStringCreateWithCString (NULL, [filePath UTF8String], kCFStringEncodingUTF8);
        CFURLRef pdfURL = CFURLCreateWithFileSystemPath (NULL, path, kCFURLPOSIXPathStyle, 0);;
        self.pdfDoc = CGPDFDocumentCreateWithURL(pdfURL);
        CFRelease(pdfURL);
        CFRelease(path);
    }
    
}

- (void)setPdfDoc:(CGPDFDocumentRef)pdfDoc{
    if (_pdfDoc != NULL) {
        CGPDFDocumentRelease(_pdfDoc);
        _pdfDoc = NULL;
    }
    if (pdfDoc != NULL) {
        _pdfDoc = CGPDFDocumentRetain(pdfDoc);
    }
    self.pageNumber = CGPDFDocumentGetNumberOfPages(_pdfDoc);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    CAIPageViewController * pageViewController = (CAIPageViewController *)segue.destinationViewController;
    pageViewController.dataSource = self;
    pageViewController.delegate = self;
    self.pageViewController = pageViewController;
    
    CAIPageContentViewController * contentPage = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CAIPageContentViewController class])];
    contentPage.pageIndex = 1;
    contentPage.page =  CGPDFDocumentGetPage(self.pdfDoc,1);
    [self.pageViewController setViewControllers:@[contentPage] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:NULL];
}


#pragma mark - UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    CAIPageContentViewController *oldController = (CAIPageContentViewController *)viewController;
    NSInteger pageIndex = oldController.pageIndex;
    if (pageIndex>1) {
        CAIPageContentViewController * contentPage = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CAIPageContentViewController class])];
        contentPage.page =  CGPDFDocumentGetPage(self.pdfDoc,pageIndex-1);
        contentPage.pageIndex = pageIndex-1;
        return contentPage;
    }
    return nil;
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    CAIPageContentViewController *oldController = (CAIPageContentViewController *)viewController;
    NSInteger pageIndex = oldController.pageIndex;
    if (pageIndex<self.pageNumber) {
        CAIPageContentViewController * contentPage = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CAIPageContentViewController class])];
        contentPage.page = CGPDFDocumentGetPage(self.pdfDoc,pageIndex+1);
        contentPage.pageIndex = pageIndex+1;
        return contentPage;
    }
    return nil;
}

#pragma mark - UIPageViewControllerDelegate

#pragma mark - private

- (void)dealloc{
    if (_pdfDoc != NULL) {
        CGPDFDocumentRelease(_pdfDoc);
        _pdfDoc = NULL;
    }
}

@end
