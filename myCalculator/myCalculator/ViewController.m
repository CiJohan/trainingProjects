//
//  ViewController.m
//  myCalculator
//
//  Created by Johannes, Cory I [ITUIS] on 3/2/18.
//  Copyright © 2018 Johannes, Cory I [ITUIS]. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *history;
@property (weak, nonatomic) IBOutlet UILabel *currNum;
@property (nonatomic) float decNum;
@property (nonatomic) int wholeNum;
@property (nonatomic) float fullNum;
@property (nonatomic) BOOL isDec;
@property (nonatomic) int j;
@property (nonatomic) int operation;

@end

@implementation ViewController




- (IBAction)thenNine:(id)sender{
    if(_isDec){
        _decNum = _decNum + 9/(10.0*_j);
        _j *= 10;
        _currNum.text = [[NSString alloc]initWithFormat:@"%g", _decNum];
    }else{
        _wholeNum = (_wholeNum * 10)+9;
        _currNum.text = [[NSString alloc]initWithFormat:@"%i",_wholeNum];
    }
}

- (IBAction)thenEight:(id)sender{
    if(_isDec){
        _decNum = _decNum + 8/(10.0*_j);
        _j *= 10;
        _currNum.text = [[NSString alloc]initWithFormat:@"%g", _decNum];
    }else{
        _wholeNum = (_wholeNum * 10)+8;
        _currNum.text = [[NSString alloc]initWithFormat:@"%i",_wholeNum];
    }
}

- (IBAction)thenSeven:(id)sender{
    if(_isDec){
        _decNum = _decNum + 7/(10.0*_j);
        _j *= 10;
        _currNum.text = [[NSString alloc]initWithFormat:@"%g", _decNum];
    }else{
        _wholeNum = (_wholeNum * 10)+7;
        _currNum.text = [[NSString alloc]initWithFormat:@"%i",_wholeNum];
    }
}

- (IBAction)thenSix:(id)sender{
    if(_isDec){
        _decNum = _decNum + 6/(10.0*_j);
        _j *= 10;
        _currNum.text = [[NSString alloc]initWithFormat:@"%g", _decNum];
    }else{
        _wholeNum = (_wholeNum * 10)+6;
        _currNum.text = [[NSString alloc]initWithFormat:@"%i",_wholeNum];
    }
}

- (IBAction)thenFive:(id)sender{
    if(_isDec){
        _decNum = _decNum + 5/(10.0*_j);
        _j *= 10;
        _currNum.text = [[NSString alloc]initWithFormat:@"%g", _decNum];
    }else{
        _wholeNum = (_wholeNum * 10)+5;
        _currNum.text = [[NSString alloc]initWithFormat:@"%i",_wholeNum];
    }
}

- (IBAction)thenFour:(id)sender{
    if(_isDec){
        _decNum = _decNum + 4/(10.0*_j);
        _j *= 10;
        _currNum.text = [[NSString alloc]initWithFormat:@"%g", _decNum];
    }else{
        _wholeNum = (_wholeNum * 10)+4;
        _currNum.text = [[NSString alloc]initWithFormat:@"%i",_wholeNum];
    }
}

- (IBAction)thenThree:(id)sender{
    if(_isDec){
        _decNum = _decNum + 3/(10.0*_j);
        _j *= 10;
        _currNum.text = [[NSString alloc]initWithFormat:@"%g", _decNum];
    }else{
        _wholeNum = (_wholeNum * 10)+3;
        _currNum.text = [[NSString alloc]initWithFormat:@"%i",_wholeNum];
    }
}

- (IBAction)thenTwo:(id)sender{
    if(_isDec){
        _decNum = _decNum + 2/(10.0*_j);
        _j *= 10;
        _currNum.text = [[NSString alloc]initWithFormat:@"%g", _decNum];
    }else{
        _wholeNum = (_wholeNum * 10)+2;
        _currNum.text = [[NSString alloc]initWithFormat:@"%i",_wholeNum];
    }
}

- (IBAction)thenOne:(id)sender{
    if(_isDec){
        _decNum = _decNum + 1/(10.0*_j);
        _j *= 10;
        _currNum.text = [[NSString alloc]initWithFormat:@"%g", _decNum];
    }else{
        _wholeNum = (_wholeNum * 10)+1;
        _currNum.text = [[NSString alloc]initWithFormat:@"%i",_wholeNum];
    }
}

- (IBAction)thenZero:(id)sender{
    if(_isDec){
        _decNum = _decNum + 0/(10.0*_j);
        _j *= 10;
        _currNum.text = [[NSString alloc]initWithFormat:@"%g", _decNum];
    }else{
        _wholeNum = (_wholeNum * 10)+0;
        _currNum.text = [[NSString alloc]initWithFormat:@"%i",_wholeNum];
    }
}

- (IBAction)makeDecimal:(id)sender {
    if(!_isDec){
        _isDec = YES;
        _decNum += _wholeNum;
        _currNum.text = [[NSString alloc]initWithFormat:@"%@.",_currNum.text];
    }
    
}

- (IBAction)clear:(id)sender {
    _isDec = NO;
    _j = 1;
    _wholeNum = 0;
    _decNum = 0.0;
    if ([_currNum.text isEqualToString:@"0"]) {
        _history.text = @"";
        _operation = 0;
    }else{
        _currNum.text = @"0";
    }
}

-(void)doOperation{
    float c = _wholeNum + _decNum;
    switch(_operation){
        case 0:
        case 1:
            _fullNum += c;
            _isDec = NO;
            _j = 1;
            _wholeNum = 0;
            _decNum = 0.0;
            break;
        case 2:
            _fullNum -= c;
            _isDec = NO;
            _j = 1;
            _wholeNum = 0;
            _decNum = 0.0;
            break;
        case 3:
            _fullNum *= c;
            _isDec = NO;
            _j = 1;
            _wholeNum = 0;
            _decNum = 0.0;
            break;
        case 4:
            _fullNum /= c;
            _isDec = NO;
            _j = 1;
            _wholeNum = 0;
            _decNum = 0.0;
            break;
        default:
            break;
    }
}

- (IBAction)add:(id)sender {
    [self doOperation];
    _operation = 1;
    _history.text = [[NSString alloc]initWithFormat: @"%@%@ + ", _history.text, _currNum.text];
    _currNum.text = @"0";
}

- (IBAction)subtract:(id)sender {
    [self doOperation];
    _operation = 2;
    _history.text = [[NSString alloc]initWithFormat: @"%@%@ - ", _history.text, _currNum.text];
    _currNum.text = @"0";
}

- (IBAction)multiply:(id)sender {
    [self doOperation];
    _operation = 3;
    _history.text = [[NSString alloc]initWithFormat: @"%@%@ * ", _history.text, _currNum.text];
    _currNum.text = @"0";
}

- (IBAction)divide:(id)sender {
    [self doOperation];
    _operation = 4;
    _history.text = [[NSString alloc]initWithFormat: @"%@%@ / ", _history.text, _currNum.text];
    _currNum.text = @"0";
}

- (IBAction)sin:(id)sender {
    
}

- (IBAction)cos:(id)sender {
    
}

- (IBAction)sqrt:(id)sender {
    
}

- (IBAction)pi:(id)sender {
    
}

- (IBAction)equals:(id)sender {
    [self doOperation];
    _history.text = [[NSString alloc] initWithFormat:@"%@%@ = ",_history.text,_currNum.text];
    _currNum.text = [[NSString alloc]initWithFormat:@"%g",_fullNum];
    _fullNum = 0;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _isDec = NO;
    _history.text = @"";
    _j = 1;
    _operation = 0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
