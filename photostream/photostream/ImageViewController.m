//
//  ImageViewController.m
//  photostream
//
//  Created by Johannes, Cory I [ITUIS] on 3/13/18.
//  Copyright © 2018 Johannes, Cory I [ITUIS]. All rights reserved.
//

//
//  FirstViewController.m
//  photostream
//
//  Created by Johannes, Cory I [ITUIS] on 3/5/18.
//  Copyright © 2018 Johannes, Cory I [ITUIS]. All rights reserved.
//

#import "ImageViewController.h"

@implementation ImageViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /*UIBarButtonItem *b = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertObject:atIndex:)];
    //TODO: make sure button segues back
    self.navigationItem.leftBarButtonItem = b;
    if(self.accessibilityValue){
        _tempLabel.text = self.accessibilityValue;
    }*/
    _tempLabel.text = @"Got here!!";
    self.view.backgroundColor = [[UIColor alloc]initWithRed:1 green:1 blue:1 alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
