//
//  UIView+GSTheadCheck.m
//  iRCS
//
//  Created by frank weng on 16/6/6.
//  Copyright © 2016年 frank weng. All rights reserved.
//

#import "UIView+GSTheadCheck.h"

#ifdef GSAnalysis_ThreadCheck

@implementation UIView (GSTheadCheck)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleSEL:@selector(setNeedsLayout) withSEL:@selector(swizzled_setNeedsLayout)];
        [self swizzleSEL:@selector(setNeedsDisplay) withSEL:@selector(swizzled_setNeedsDisplay)];
        [self swizzleSEL:@selector(setNeedsDisplayInRect:) withSEL:@selector(swizzled_setNeedsDisplayInRect:)];
    });
}


-(void) swizzled_setNeedsLayout
{
    [self checkIsInMainThread];
    
    [self swizzled_setNeedsLayout];
}


-(void) swizzled_setNeedsDisplay
{
    [self checkIsInMainThread];
    
    [self swizzled_setNeedsDisplay];
}

-(void) swizzled_setNeedsDisplayInRect:(CGRect)rect
{
    [self checkIsInMainThread];
    
    [self swizzled_setNeedsDisplayInRect:rect];
}

-(void)checkIsInMainThread
{
    if(![[NSThread currentThread] isMainThread]){
        NSAssert(NO, @"the UI op is NOT in Main Thread!");
    }
}

@end


#endif