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

- (void)ok{
    NSLog(@"Ok");
}

- (void)reloadMe{
    [self.tableView reloadData];
}



@end
