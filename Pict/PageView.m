//
//  PageView.m
//  Pict
//
//  Created by 子民 駱 on 9/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PageView.h"

@implementation PageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:imageView];
        
        self.delegate = self;
        self.minimumZoomScale = 1.0;
        self.maximumZoomScale = 2.0;
    }
    return self;
}

- (void)adjustScrollView:(BOOL)animate {
    [self setZoomScale:self.minimumZoomScale animated:animate];
}

- (void)setImage:(NSString *)image {
    NSString *path = [[NSBundle mainBundle] pathForResource:image ofType:@"png"];
    imageView.image = [UIImage imageWithContentsOfFile:path];
    
    [self adjustScrollView:NO];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return imageView;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if ([touch tapCount] > 1) {
        [self adjustScrollView:YES];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc {
    [imageView release];
    [super dealloc];
}

@end
