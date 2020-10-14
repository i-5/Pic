//
//  PictViewController.m
//  Pict
//
//  Created by 子民 駱 on 9/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PictViewController.h"

@implementation PictViewController

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)pageLoad:(UIScrollView *)scrollView {
    currentPage = scrollView.contentOffset.x / scrollView.bounds.size.width;
    int pageWidth = self.view.frame.size.width;
    int pageHeight = self.view.frame.size.height;
    
    prevPage.frame = CGRectMake(pageWidth * (currentPage - 1),
                                0,
                                pageWidth,
                                pageHeight);
    if (currentPage > 0) {
        [prevPage setImage:[NSString stringWithFormat:@"%d", (currentPage - 1) % 10]];
        prevPage.hidden = NO;
    } else {
        prevPage.hidden = YES;
    }
    
    currPage.frame = CGRectMake(pageWidth * currentPage,
                                0,
                                pageWidth,
                                pageHeight);
    
    [currPage setImage:[NSString stringWithFormat:@"%d", currentPage % 10]];
    currPage.hidden = NO;
    
    nextPage.frame = CGRectMake(pageWidth * (currentPage + 1),
                                0,
                                pageWidth,
                                pageHeight);
    
    if (currentPage < (kPageNum - 1)) {
        [nextPage setImage:[NSString stringWithFormat:@"%d", (currentPage + 1) % 10]];
        nextPage.hidden = NO;
    } else {
        nextPage.hidden = YES;
    }
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width * kPageNum, self.view.frame.size.height);
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
    [scrollView release];
    
    scrollView.delegate = self;
    
    prevPage = [[PageView alloc] initWithFrame:self.view.bounds];
    [scrollView addSubview:prevPage];
    
    currPage = [[PageView alloc] initWithFrame:self.view.bounds];
    [scrollView addSubview:currPage];
    
    nextPage = [[PageView alloc] initWithFrame:self.view.bounds];
    [scrollView addSubview:nextPage];
    
    [self pageLoad:scrollView];
    
    /*
    for (int i = 0; i < kPageNum; i++) {
        PageView *page = [[PageView alloc] initWithFrame:self.view.bounds];
        [page setImage:[NSString stringWithFormat:@"%d.png", i]];
        page.frame = CGRectMake(self.view.frame.size.width * i,
                                0, 
                                self.view.frame.size.width, 
                                self.view.frame.size.height);
        [scrollView addSubview:page];
        [page release];
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(self.view.frame.size.width * i, 0, self.view.frame.size.width, self.view.frame.size.height);
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png", i]];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [scrollView addSubview:imageView];
        [imageView release];
         
    }
     */
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat position = scrollView.contentOffset.x / scrollView.bounds.size.width;
    CGFloat delta = position - (CGFloat)currentPage;
    
    if (fabs(delta) >= 1.0f) {
        [self pageLoad:scrollView];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [prevPage release];
    [currPage release];
    [nextPage release];
    
    [super dealloc];
}

@end
