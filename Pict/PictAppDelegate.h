//
//  PictAppDelegate.h
//  Pict
//
//  Created by 子民 駱 on 9/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PictViewController;

@interface PictAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet PictViewController *viewController;

@end
