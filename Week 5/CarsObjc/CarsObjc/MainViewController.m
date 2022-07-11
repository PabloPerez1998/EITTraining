//
//  MainViewController.m
//  CarsObjc
//
//  Created by Consultant on 6/27/22.
//

#import "MainViewController.h"
#import "ViewController.h"
#import "Models/Car.h"

/*
 Storyboard identifiers for first and second VCs
 */
NSString *mainVC = @"MainVC";
NSString *listVC = @"ListVC";


@interface MainViewController () <AddCarDelegate>

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
    // Do any additional setup after loading the view.
}

- (void)setUp {
    self.title = @"Car list";
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapLabel:)];
    [self.labelView addGestureRecognizer:tapGesture];
}

- (IBAction)didTapLabel:(id)sender{
    
    ViewController *listController = [self.storyboard instantiateViewControllerWithIdentifier:listVC];
    
    [listController setDelegate:self];
    
    [self.navigationController pushViewController:listController animated:YES];
}

- (void) addcar:(Car *)car{
    [self.carLabel setText:car.title];
    [self.carImageView setImage:car.image];
}


@end
