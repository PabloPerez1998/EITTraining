//
//  DetailsViewController.m
//  BreweryObjc
//
//  Created by Consultant on 6/28/22.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupDetailsLabels];
}

-(void)setupDetailsLabels{
    self.nameLabel.text = self.detailsBrewery.name;
    self.typeLabel.text = self.detailsBrewery.type;
    self.cityLabel.text = self.detailsBrewery.city;
    self.stateLabel.text = self.detailsBrewery.state;
}


@end
