//
//  ViewController.m
//  TestFootView
//
//  Created by Xinqi Chan on 4/20/15.
//  Copyright (c) 2015 Xinqi Chan. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"

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
    
    NSArray * array = [[NSBundle mainBundle] loadNibNamed:@"MyView" owner:nil options:nil];
    MyView * v = [array lastObject];
    
    [v.btn addTarget:self action:@selector(ok) forControlEvents:UIControlEventTouchUpInside];
    
    [self.tableView setPingFootView:v];
    
    UIBarButtonItem * btn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(reloadMe)];
    self.navigationController.navigationBar.topItem.rightBarButtonItem = btn;
    
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

- (void)ok{
    NSLog(@"Ok");
}

- (void)reloadMe{
    [self.tableView reloadData];
}



@end
