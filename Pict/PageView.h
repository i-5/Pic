//
//  PageView.h
//  Pict
//
//  Created by 子民 駱 on 9/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageView : UIScrollView <UIScrollViewDelegate> {
    UIImageView *imageView;
}

- (void)setImage:(NSString *)image;

@end
