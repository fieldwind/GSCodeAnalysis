//
//  UITabBarController+MemoryLeak.h
//  MLeaksFinder
//
//  Created by zeposhe on 12/12/15.
//  Copyright © 2015 zeposhe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GSCodeAnalysis.h"

#ifdef GSAnalysis_MemoryLeak

@interface UITabBarController (MemoryLeak)

@end

#endif
