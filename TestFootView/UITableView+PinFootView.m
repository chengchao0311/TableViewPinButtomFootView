//
//  UITableView+PinFootView.m
//  TestFootView
//
//  Created by Xinqi Chan on 4/21/15.
//  Copyright (c) 2015 Xinqi Chan. All rights reserved.
//

#import "UITableView+PinFootView.h"
#import <objc/runtime.h>

@implementation UITableView (PinFootView)

static void * PinFVId = &PinFVId;

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        
        SEL originalSelector = @selector(reloadData);
        SEL swizzledSelector = @selector(xxxx_reloadData);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}


-(UIView *)pingFootView{
    return objc_getAssociatedObject(self,PinFVId);
}

-(void)setPingFootView:(UIView *)newPingFootView{
    if (!self.pingFootView) {
        objc_setAssociatedObject(self, PinFVId, newPingFootView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self addSubview:self.pingFootView];
        [self bringSubviewToFront:self.pingFootView];
        [self updatePinFootViewFrame];
    }
}


-(void)xxxx_reloadData{
    [self xxxx_reloadData];
    if (self.pingFootView) {
        [self updatePinFootViewFrame];
    }
}



- (void)updatePinFootViewFrame{
    if (self.contentSize.height > self.frame.size.height) {
        self.pingFootView.frame = CGRectMake(self.pingFootView.frame.origin.x, self.contentSize.height, self.frame.size.width, self.pingFootView.frame.size.height);
    }else{
        if (self.contentSize.height + self.pingFootView.frame.size.height > self.frame.size.height) {
            self.pingFootView.frame = CGRectMake(self.pingFootView.frame.origin.x, self.contentSize.height, self.frame.size.width, self.pingFootView.frame.size.height);
        }else{
            self.pingFootView.frame = CGRectMake(self.pingFootView.frame.origin.x, self.frame.size.height - self.pingFootView.frame.size.height, self.frame.size.width, self.pingFootView.frame.size.height);
        }
    }
    
    self.contentInset = UIEdgeInsetsMake(0, 0, self.pingFootView.frame.size.height, 0);

}



@end
