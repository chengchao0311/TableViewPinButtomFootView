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
    int index;
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
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, self.footView.frame.size.height, 0);
    
    self.footView.alpha = 0.5;
    oldY = self.footView.frame.origin.y;
    count = 2;
    index = 0;
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
    if (indexPath.row == count-1) {
        [self performSelector:@selector(setFootViewY) withObject:nil afterDelay:0.1];
    }
    
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat currentOffset = scrollView.contentOffset.y;
    CGFloat maxmumOffset = scrollView.contentSize.height - scrollView.frame.size.height;
    CGFloat resultOffSet = maxmumOffset - currentOffset;
    NSLog(@"%f",resultOffSet);

    if (resultOffSet < 0) {
        if (maxmumOffset > 0) {
                self.footView.frame = CGRectMake(self.footView.frame.origin.x,  self.tableView.frame.size.height + resultOffSet, self.footView.frame.size.width, self.footView.frame.size.height);
        }else{
            CGFloat overHeight = self.tableView.contentSize.height + self.footView.frame.size.height - self.tableView.frame.size.height;
            if (overHeight > 0) {
                self.footView.frame = CGRectMake(self.footView.frame.origin.x,  self.tableView.frame.size.height + resultOffSet + self.tableView.frame.size.height - self.tableView.contentSize.height - self.footView.frame.size.height + overHeight, self.footView.frame.size.width, self.footView.frame.size.height);
            }else{
                self.footView.frame = CGRectMake(self.footView.frame.origin.x,  self.tableView.frame.size.height + resultOffSet + self.tableView.frame.size.height - self.tableView.contentSize.height - self.footView.frame.size.height, self.footView.frame.size.width, self.footView.frame.size.height);
            }
            
        }
    }else{
        if (self.footView.frame.origin.y != self.tableView.frame.size.height) {
                self.footView.frame = CGRectMake(self.footView.frame.origin.x,  self.tableView.frame.size.height, self.footView.frame.size.width, self.footView.frame.size.height);
        }
    }
}


-(void)setFootViewY{
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, self.footView.frame.size.height, 0);
    if (self.tableView.contentSize.height < self.tableView.frame.size.height) {
        if (self.tableView.contentSize.height + self.footView.frame.size.height > self.tableView.frame.size.height) {
            self.footView.frame = CGRectMake(self.footView.frame.origin.x, self.tableView.contentSize.height, self.footView.frame.size.width , self.footView.frame.size.height);
        }else{
            self.footView.frame = CGRectMake(self.footView.frame.origin.x, self.tableView.frame.size.height - self.footView.frame.size.height, self.footView.frame.size.width, self.footView.frame.size.height);
        }
    }else{
    }
}

@end
