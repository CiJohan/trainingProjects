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
@property (nonatomic) float fullNum;
@property (nonatomic) BOOL isDec;
@property (nonatomic) int j;
@property (nonatomic) int operation;

@end

@implementation ViewController

- (IBAction)number:(id)sender{
    if(_isDec){
        _decNum = _decNum + [sender currentTitle].intValue/(10.0*_j);
        _j *= 10;
        [self editOutput:1];
    }else{
        _decNum = (_decNum * 10)+[sender currentTitle].intValue;
        [self editOutput:1];
    }
}

-(void)editOutput:(int)code{
    switch(code){
        case 1://number pressed
            _currNum.text = [[NSString alloc]initWithFormat:@"%g",_decNum];
            break;
        case 2://add
            break;
        case 3://sub
            break;
        case 4://mul
            break;
        case 5://div
            break;
        default:
            break;
    }
}

- (IBAction)makeDecimal:(id)sender {
    if(!_isDec){
        _isDec = YES;
    }
    
}

- (IBAction)clear:(id)sender {
    _isDec = NO;
    _j = 1;
    _decNum = 0.0;
    if ([_currNum.text isEqualToString:@"0"]) {
        _history.text = @"";
        _operation = 0;
        _fullNum = 0;
    }else{
        _currNum.text = @"0";
    }
}

-(void)doOperation{
    float c = _decNum;
    
    switch(_operation){
        case 0:
        case 1:
            _fullNum += c;
            _isDec = NO;
            _j = 1;
            _decNum = 0.0;
            break;
        case 2:
            _fullNum -= c;
            _isDec = NO;
            _j = 1;
            _decNum = 0.0;
            break;
        case 3:
            _fullNum *= c;
            _isDec = NO;
            _j = 1;
            _decNum = 0.0;
            break;
        case 4:
            _fullNum /= c;
            _isDec = NO;
            _j = 1;
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
    [self makeDecimal:self];
    if(_decNum != 0){
        _decNum = sinf(_decNum);
        //_currNum.text = [[NSString alloc]initWithFormat:@"%g",_decNum];
        _history.text = [[NSString alloc]initWithFormat: @"%@sin(%@) ", _history.text, _currNum.text];
        _currNum.text = @"";
    }else{
        _fullNum = sinf(_fullNum);
        //_currNum.text = [[NSString alloc]initWithFormat:@"%g",_decNum];
        _history.text = [[NSString alloc]initWithFormat: @"%@sin(%g) ", _history.text, _fullNum];
        _currNum.text = @"";
    }
    [self equals:self];
}

- (IBAction)cos:(id)sender {
    [self makeDecimal:self];
    if(_decNum != 0){
    _decNum = cosf(_decNum);
    _history.text = [[NSString alloc]initWithFormat: @"%@cos(%@) ", _history.text, _currNum.text];
    _currNum.text = @"";
    }else{
        _fullNum = cosf(_fullNum);
        _history.text = [[NSString alloc]initWithFormat: @"%@cos(%g) ", _history.text, _fullNum];
        _currNum.text = @"";
    }
    [self equals:self];
}

- (IBAction)sqrt:(id)sender {
    [self makeDecimal:self];
    if(_decNum != 0){
    _decNum = sqrtf(_decNum);
    _history.text = [[NSString alloc]initWithFormat: @"%@sqrt(%@) ", _history.text, _currNum.text];
    _currNum.text = @"";
    }else{
        _fullNum = sqrtf(_fullNum);
        _history.text = [[NSString alloc]initWithFormat: @"%@sqrt(%g) ", _history.text, _fullNum];
        _currNum.text = @"";
    }
    [self equals:self];
}

- (IBAction)pi:(id)sender {
    [self makeDecimal:self];
    if(_decNum != 0){
        _decNum = _decNum * M_PI;
        _history.text = [[NSString alloc]initWithFormat: @"%@%g * π ", _history.text, _decNum];
        _currNum.text = @"";
    }else{
        _decNum = M_PI;
        _history.text = [[NSString alloc]initWithFormat: @"%@π ", _history.text];
        _currNum.text = @"";
    }
    [self equals:self];
}

- (IBAction)equals:(id)sender {
    [self doOperation];
    _operation = 0;
    _history.text = [[NSString alloc] initWithFormat:@"%@%@ = %g ",_history.text,_currNum.text, _fullNum];
    _currNum.text = [[NSString alloc]initWithFormat:@"%g",_fullNum];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _history.text = @"";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
