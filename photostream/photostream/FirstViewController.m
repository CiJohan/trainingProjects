//
//  FirstViewController.m
//  photostream
//
//  Created by Johannes, Cory I [ITUIS] on 3/5/18.
//  Copyright © 2018 Johannes, Cory I [ITUIS]. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) NSString* url;
@end

@implementation FirstViewController

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"popcell"];
    
    //UIImage *myImage = [UIImage imageNamed:@"string"];
    //[cell.backgroundView provideImageData:(__bridge void * _Nonnull)(myImage) bytesPerRow:64 origin:64 :64 size:64 :64 userInfo:nil];
    cell.textLabel.text = @"Popular Cell";
    
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _url = [NSString stringWithFormat:@"https://photostream.iastate.edu/api"];
    //496a9bc27cd797590abe
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSString* sent = @"Popular working!!";
    UIViewController *controller = (UIViewController*)[[segue destinationViewController] topViewController];
    [controller setAccessibilityValue:sent];
    controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    controller.navigationItem.leftItemsSupplementBackButton = YES;
}*/

@end
