//
//  ViewController.m
//  Label - ObjC - HW
//
//  Created by Consultant on 6/6/22.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    float center = self.view.center.x - 50;
    CGRect frame = CGRectMake(center, 100, 200, 21);
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    [self applyLabelStyles:label];
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MM/dd/yyyy"];
    NSString *dateString = [dateFormat stringFromDate:today];
    label.text = dateString;
    [self.view addSubview:label];
    //1.3
    UILabel *label1, *label2;
    //1.4
    CGRect frame1 = CGRectMake(100, 130, 200, 21);
    label1 = [[UILabel alloc] initWithFrame:frame1];
    CGRect frame2 = CGRectMake(200, 130, 200, 21);
    label2 = [[UILabel alloc] initWithFrame:frame2];
    label1.text = @"Label 1";
    label2.text = @"Label 2";
    [self.view addSubview:label1];
    [self.view addSubview:label2];
    
    //1.5
    float forHeight = 160;
    for (int i = 0; i < 5; i++) {
        CGRect forFrame = CGRectMake(center, forHeight, 200, 21);
        UILabel *forLabel = [[UILabel alloc] initWithFrame:forFrame];
        [self applyLabelStyles:forLabel];
        forLabel.text = [NSString stringWithFormat:@"Label in for %d", i + 1];
        [self.view addSubview:forLabel];
        forHeight += 20.0;
    }

}

- (void) applyLabelStyles:(UILabel *) label{
    label.backgroundColor = UIColor.clearColor;
    label.textColor = UIColor.redColor;
    label.font = [UIFont fontWithName:@"Verdana" size:18.0];
    label.numberOfLines = 2;
    label.shadowColor = UIColor.lightGrayColor;
}


@end
