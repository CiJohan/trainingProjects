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
        [self editOutput:1 routing:0];
    }else{
        _decNum = (_decNum * 10)+[sender currentTitle].intValue;
        [self editOutput:1 routing:0];
    }
}

-(void)editOutput:(int)code routing:(int)p{
    switch(code){
        case 1://number pressed
            // TODO - learn difference _currName and self.currName
            //_currNum.text = [[NSString alloc]initWithFormat:@"%g",_decNum];
            _currNum.text = @(_decNum).stringValue;
            break;
        case 2://add
            _history.text = [[NSString alloc]initWithFormat: @"%@%@ + ", _history.text, _currNum.text];
            _currNum.text = @"0";
            break;
        case 3://sub
            _history.text = [[NSString alloc]initWithFormat: @"%@%@ - ", _history.text, _currNum.text];
            _currNum.text = @"0";
            break;
        case 4://mul
            _history.text = [[NSString alloc]initWithFormat: @"%@%@ * ", _history.text, _currNum.text];
            _currNum.text = @"0";
            break;
        case 5://div
            _history.text = [[NSString alloc]initWithFormat: @"%@%@ / ", _history.text, _currNum.text];
            _currNum.text = @"0";
            break;
        case 6://sin
            if(p == 0){
                _history.text = [[NSString alloc]initWithFormat: @"%@sin(%@) ", _history.text, _currNum.text];
                _currNum.text = @"";
            }else{
                _history.text = [[NSString alloc]initWithFormat: @"%@sin(%g) ", _history.text, _fullNum];
                _currNum.text = @"";
            }
            break;
        case 7://cos
            if(p == 0){
                _history.text = [[NSString alloc]initWithFormat: @"%@cos(%@) ", _history.text, _currNum.text];
                _currNum.text = @"";
            }else{
                _history.text = [[NSString alloc]initWithFormat: @"%@cos(%g) ", _history.text, _fullNum];
                _currNum.text = @"";
            }
            break;
        case 8://sqrt
            if(p == 0){
                _history.text = [[NSString alloc]initWithFormat: @"%@sqrt(%@) ", _history.text, _currNum.text];
                _currNum.text = @"";
            }else{
                _history.text = [[NSString alloc]initWithFormat: @"%@sqrt(%g) ", _history.text, _fullNum];
                _currNum.text = @"";
            }
            break;
        case 9://pi
            if(p == 0){
                _history.text = [[NSString alloc]initWithFormat: @"%@%g * π ", _history.text, _decNum];
                _currNum.text = @"";
            }else{
                _currNum.text = @"";
                _history.text = [[NSString alloc]initWithFormat: @"%@%@π ", _history.text, _currNum.text];
            }
            break;
        case 10:
            _history.text = [[NSString alloc] initWithFormat:@"%@%@ = ",_history.text,_currNum.text];
            //_currNum.text = [[NSString alloc]initWithFormat:@"%g",_fullNum];
            _currNum.text = @(_fullNum).stringValue;
        default:
            break;
    }
}

- (IBAction)makeDecimal:(id)sender {
    if(!_isDec){
        _isDec = YES;
        _currNum.text = [NSString stringWithFormat:@"%g.",_decNum];
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
        if(_operation == 0 && _history.text != @""){
            _history.text = [[NSString alloc]initWithFormat: @"%@%@ ", _history.text, _currNum.text];
        }
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
    [self editOutput:2 routing:0];
}

- (IBAction)subtract:(id)sender {
    [self doOperation];
    _operation = 2;
    [self editOutput:3 routing:0];
}

- (IBAction)multiply:(id)sender {
    [self doOperation];
    _operation = 3;
    [self editOutput:4 routing:0];
}

- (IBAction)divide:(id)sender {
    [self doOperation];
    _operation = 4;
    [self editOutput:5 routing:0];
}

- (IBAction)sin:(id)sender {
    [self makeDecimal:self];
    if(_decNum != 0){
        _decNum = sinf(_decNum);
        //_currNum.text = [[NSString alloc]initWithFormat:@"%g",_decNum];
        [self editOutput:6 routing:0];
    }else{
        //_currNum.text = [[NSString alloc]initWithFormat:@"%g",_decNum];
        [self editOutput:6 routing:1];
        _fullNum = sinf(_fullNum);
    }
    [self equals:self];
}

- (IBAction)cos:(id)sender {
    [self makeDecimal:self];
    if(_decNum != 0){
        _decNum = cosf(_decNum);
        [self editOutput:7 routing:0];
    }else{
        [self editOutput:7 routing:1];
        _fullNum = cosf(_fullNum);
    }
    [self equals:self];
}

- (IBAction)sqrt:(id)sender {
    [self makeDecimal:self];
    if(_decNum != 0){
        _decNum = sqrtf(_decNum);
        [self editOutput:8 routing:0];
    }else{
        [self editOutput:8 routing:1];
        _fullNum = sqrtf(_fullNum);
    }
    [self equals:self];
}

- (IBAction)pi:(id)sender {
    [self makeDecimal:self];
    if(_decNum != 0){
        [self editOutput:9 routing:0];
        _decNum = _decNum * M_PI;
    }else{
        [self editOutput:9 routing:1];
        _decNum = M_PI;
    }
    [self equals:self];
}

- (IBAction)equals:(id)sender {
    [self doOperation];
    _operation = 0;
    [self editOutput:10 routing:0];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _history.text = @"";
    _currNum.adjustsFontSizeToFitWidth = YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
