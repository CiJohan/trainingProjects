//
//  ViewController.m
//  myCalculator
//
//  Created by Johannes, Cory I [ITUIS] on 3/2/18.
//  Copyright © 2018 Johannes, Cory I [ITUIS]. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *currNum;
@property (nonatomic) float decNum;
@property (nonatomic) int wholeNum;
@property (nonatomic) BOOL isDec;
@property (nonatomic) int j;
@property (nonatomic) NSString* history;

@end

@implementation ViewController




- (IBAction)thenNine:(id)sender{
    if(_isDec){
        _decNum = _decNum + 9/(10.0*_j);
        _j++;
        _currNum.text = [[NSString alloc]initWithFormat:@"%i.%f",_wholeNum, _decNum];
    }else{
        _wholeNum = (_wholeNum * 10)+9;
        _currNum.text = [[NSString alloc]initWithFormat:@"%i",_wholeNum];
    }
}

- (IBAction)thenEight:(id)sender{
    if(_isDec){
        _decNum = _decNum + 8/(10.0*_j);
        _j++;
        _currNum.text = [[NSString alloc]initWithFormat:@"%i.%f",_wholeNum, _decNum];
    }else{
        _wholeNum = (_wholeNum * 10)+8;
        _currNum.text = [[NSString alloc]initWithFormat:@"%i",_wholeNum];
    }
}

- (IBAction)thenSeven:(id)sender{
    if(_isDec){
        _decNum = _decNum + 7/(10.0*_j);
        _j++;
        _currNum.text = [[NSString alloc]initWithFormat:@"%i.%f",_wholeNum, _decNum];
    }else{
        _wholeNum = (_wholeNum * 10)+7;
        _currNum.text = [[NSString alloc]initWithFormat:@"%i",_wholeNum];
    }
}

- (IBAction)thenSix:(id)sender{
    if(_isDec){
        _decNum = _decNum + 6/(10.0*_j);
        _j++;
        _currNum.text = [[NSString alloc]initWithFormat:@"%i.%f",_wholeNum, _decNum];
    }else{
        _wholeNum = (_wholeNum * 10)+6;
        _currNum.text = [[NSString alloc]initWithFormat:@"%i",_wholeNum];
    }
}

- (IBAction)thenFive:(id)sender{
    if(_isDec){
        _decNum = _decNum + 5/(10.0*_j);
        _j++;
        _currNum.text = [[NSString alloc]initWithFormat:@"%i.%f",_wholeNum, _decNum];
    }else{
        _wholeNum = (_wholeNum * 10)+5;
        _currNum.text = [[NSString alloc]initWithFormat:@"%i",_wholeNum];
    }
}

- (IBAction)thenFour:(id)sender{
    if(_isDec){
        _decNum = _decNum + 4/(10.0*_j);
        _j++;
        _currNum.text = [[NSString alloc]initWithFormat:@"%i.%f",_wholeNum, _decNum];
    }else{
        _wholeNum = (_wholeNum * 10)+4;
        _currNum.text = [[NSString alloc]initWithFormat:@"%i",_wholeNum];
    }
}

- (IBAction)thenThree:(id)sender{
    if(_isDec){
        _decNum = _decNum + 3/(10.0*_j);
        _j++;
        _currNum.text = [[NSString alloc]initWithFormat:@"%i.%f",_wholeNum, _decNum];
    }else{
        _wholeNum = (_wholeNum * 10)+3;
        _currNum.text = [[NSString alloc]initWithFormat:@"%i",_wholeNum];
    }
}

- (IBAction)thenTwo:(id)sender{
    if(_isDec){
        _decNum = _decNum + 2/(10.0*_j);
        _j++;
        _currNum.text = [[NSString alloc]initWithFormat:@"%i.%f",_wholeNum, _decNum];
    }else{
        _wholeNum = (_wholeNum * 10)+2;
        _currNum.text = [[NSString alloc]initWithFormat:@"%i",_wholeNum];
    }
}

- (IBAction)thenOne:(id)sender{
    if(_isDec){
        _decNum = _decNum + 3/(10.0*_j);
        _j++;
        _currNum.text = [[NSString alloc]initWithFormat:@"%i.%f",_wholeNum, _decNum];
    }else{
        _wholeNum = (_wholeNum * 10)+3;
        _currNum.text = [[NSString alloc]initWithFormat:@"%i",_wholeNum];
    }
}

- (IBAction)thenZero:(id)sender{
    if(_isDec){
        _decNum = _decNum + 2/(10.0*_j);
        _j++;
        _currNum.text = [[NSString alloc]initWithFormat:@"%i.%f",_wholeNum, _decNum];
    }else{
        _wholeNum = (_wholeNum * 10)+2;
        _currNum.text = [[NSString alloc]initWithFormat:@"%i",_wholeNum];
    }
}

- (IBAction)makeDecimal:(id)sender {
    if(!_isDec){
        _isDec = YES;
        _currNum.text = [[NSString alloc]initWithFormat:@"%@.",_currNum.text];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _isDec = NO;
    _j = 1;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
