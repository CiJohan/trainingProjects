//
//  SecondViewController.m
//  photostream
//
//  Created by Johannes, Cory I [ITUIS] on 3/5/18.
//  Copyright © 2018 Johannes, Cory I [ITUIS]. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

/*-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSString* sent = @"Recent working!!";
    UIViewController *controller = (UIViewController*)[[segue destinationViewController] topViewController];
    [controller setAccessibilityValue:sent];
    controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    controller.navigationItem.leftItemsSupplementBackButton = YES;
}*/

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"reccell"];
    
    //UIImage *myImage = [UIImage imageNamed:@"string"];
    
    //[cell.backgroundView provideImageData:(__bridge void * _Nonnull)(myImage) bytesPerRow:64 origin:64 :64 size:64 :64 userInfo:nil];
    
    cell.textLabel.text = @"Recent cell";
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
