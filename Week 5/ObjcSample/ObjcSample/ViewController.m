//
//  ViewController.m
//  ObjcSample
//
//  Created by Consultant on 6/27/22.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import <UIKit/UIKey.h>

/*
 Storyboard Ids for first an second VC
 */

NSString *firstVC = @"FirstVC";
NSString *secondVC = @"SecondVC";



@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *labelView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpConfiguration];
    // Do any additional setup after loading the view.
}

-(void)setUpConfiguration{
    self.title = @"Selected Country";
    self.clickHereLabel.layer.cornerRadius = 20;
    self.clickHereLabel.text = @"ClickHere";
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickHereTapped:)];
    [self.clickHereLabel addGestureRecognizer:tapGesture];
}

-(IBAction)clickHereTapped:(id)sender{
    SecondViewController * secondViewController = [self.storyboard instantiateViewControllerWithIdentifier:secondVC];
    
//    Delegation
//    [secondViewController setDelegate: self];
//    KVC
//    secondViewController.firstVC = self;
//    Block pasing data back
//    [ secondViewController.selectedCountry: ^ ]
}

-(void)addCountry:(NSString *)countryName {
    [self.clickHereLabel setText:countryName];
}


@end
