//
//  PictViewController.h
//  Pict
//
//  Created by 子民 駱 on 9/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageView.h"

#define kPageNum 100

@interface PictViewController : UIViewController <UIScrollViewDelegate> {
    PageView *prevPage;
    PageView *currPage;
    PageView *nextPage;
    
    int currentPage;
}

@end
