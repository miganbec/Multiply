//
//  ViewController.m
//  Multiply
//
//  Created by miganbec on 13/10/14.
//  Copyright (c) 2014 miganbec. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *numberTextField;
@property (weak, nonatomic) IBOutlet UILabel *multiplierLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) IBOutlet UISlider *numberSlider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *operatorSegmentControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSInteger value = self.numberSlider.value;
    NSString *stringValue = [NSNumber numberWithInteger:value].description;
    self.multiplierLabel.text = stringValue;
}


- (IBAction)sliderValueChanged:(id)sender {
    self.multiplierLabel.text = [NSString stringWithFormat:@"%.0f", self.numberSlider.value];
}

- (IBAction)onCalculateButtonPressed:(id)sender {
    NSInteger myLocalVarInt = self.numberTextField.text.integerValue;
    NSInteger myLocalVarIntMultiplier = self.multiplierLabel.text.integerValue;
    NSInteger result;
    if (self.operatorSegmentControl.selectedSegmentIndex == 0) {
        result = myLocalVarInt * myLocalVarIntMultiplier;
    } else {
        result = myLocalVarInt / myLocalVarIntMultiplier;
    }
    self.answerLabel.text = [NSString stringWithFormat:@"%ld", (long)result];
    if (result >= 20) {
        self.view.backgroundColor = [UIColor greenColor];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    if ((result % 3 == 0) && (result % 5 == 0)) {
        self.answerLabel.text = @"fizzbuzz";
    } else if (result % 3 == 0) {
        self.answerLabel.text = @"fizz";
    } else if (result % 5 == 0) {
        self.answerLabel.text = @"buzz";
    }
    [self.numberTextField endEditing:YES];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.numberTextField endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
