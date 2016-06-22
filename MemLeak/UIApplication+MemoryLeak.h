//
//  UIApplication+MemoryLeak.h
//  MLeaksFinder
//
//  Created by 佘泽坡 on 5/11/16.
//  Copyright © 2016 zeposhe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GSCodeAnalysis.h"

#ifdef GSAnalysis_MemoryLeak

@interface UIApplication (MemoryLeak)

@end

#endif
