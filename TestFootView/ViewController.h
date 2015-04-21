//
//  ViewController.h
//  TestFootView
//
//  Created by Xinqi Chan on 4/20/15.
//  Copyright (c) 2015 Xinqi Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kIsHttps 1

@interface ViewController : UIViewController<
UITableViewDataSource, UITableViewDelegate,
UIScrollViewDelegate
#ifdef kIsHttps
,
NSURLConnectionDelegate
#endif
  >

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *footView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topC;

@end

