//
//  ViewController.m
//  TestFootView
//
//  Created by Xinqi Chan on 4/20/15.
//  Copyright (c) 2015 Xinqi Chan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    CGFloat oldY;
    CGFloat count;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.translucent = NO;
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    UIView * v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 200)];
    [v setBackgroundColor:[UIColor redColor]];
    [v setAlpha:0.5];
    
    [self.tableView setPinFootView:v];
    count = 2;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"@%li",(long)indexPath.row];
    
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    CGFloat currentOffset = scrollView.contentOffset.y;
//    CGFloat maxmumOffset = scrollView.contentSize.height - scrollView.frame.size.height;
//    CGFloat resultOffSet = maxmumOffset - currentOffset;
//    NSLog(@"%f",resultOffSet);
//
//    if (resultOffSet < 0) {
//        if (maxmumOffset > 0) {
//                self.footView.frame = CGRectMake(self.footView.frame.origin.x,  self.tableView.frame.size.height + resultOffSet, self.footView.frame.size.width, self.footView.frame.size.height);
//        }else{
//            CGFloat overHeight = self.tableView.contentSize.height + self.footView.frame.size.height - self.tableView.frame.size.height;
//            if (overHeight > 0) {
//                self.footView.frame = CGRectMake(self.footView.frame.origin.x,  self.tableView.frame.size.height + resultOffSet + self.tableView.frame.size.height - self.tableView.contentSize.height - self.footView.frame.size.height + overHeight, self.footView.frame.size.width, self.footView.frame.size.height);
//            }else{
//                self.footView.frame = CGRectMake(self.footView.frame.origin.x,  self.tableView.frame.size.height + resultOffSet + self.tableView.frame.size.height - self.tableView.contentSize.height - self.footView.frame.size.height, self.footView.frame.size.width, self.footView.frame.size.height);
//            }
//            
//        }
//    }else{
//        if (self.footView.frame.origin.y != self.tableView.frame.size.height) {
//                self.footView.frame = CGRectMake(self.footView.frame.origin.x,  self.tableView.frame.size.height, self.footView.frame.size.width, self.footView.frame.size.height);
//        }
//    }
}



@end
