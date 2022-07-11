//
//  DetailsViewController.h
//  BreweryObjc
//
//  Created by Consultant on 6/28/22.
//

#import <UIKit/UIKit.h>
#import "Models/Brewery.h"

@interface DetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) Brewery *detailsBrewery;
@end

