//
//  PinFootViewTableView.m
//  TestFootView
//
//  Created by Xinqi Chan on 4/21/15.
//  Copyright (c) 2015 Xinqi Chan. All rights reserved.
//

#import "PinFootViewTableView.h"

@implementation PinFootViewTableView{
    UIView * pingFootView;
}

-(void)reloadData{
    [super reloadData];
    if (pingFootView) {
        [self updatePinFootViewFrame];
    }
}

-(void)setPinFootView:(UIView*)pinFootView{
    pingFootView = pinFootView;
    [self addSubview:pingFootView];
    [self bringSubviewToFront:pingFootView];
    [self updatePinFootViewFrame];
}

- (void)updatePinFootViewFrame{
    if (self.contentSize.height > self.frame.size.height) {
        pingFootView.frame = CGRectMake(pingFootView.frame.origin.x, self.contentSize.height, pingFootView.frame.size.width, pingFootView.frame.size.height);
    }else{
        if (self.contentSize.height + pingFootView.frame.size.height > self.frame.size.height) {
            pingFootView.frame = CGRectMake(pingFootView.frame.origin.x, self.contentSize.height, pingFootView.frame.size.width, pingFootView.frame.size.height);
        }else{
            pingFootView.frame = CGRectMake(pingFootView.frame.origin.x, self.frame.size.height - pingFootView.frame.size.height, pingFootView.frame.size.width, pingFootView.frame.size.height);
        }
    }
    
    self.contentInset = UIEdgeInsetsMake(0, 0, pingFootView.frame.size.height, 0);
    
}

@end
