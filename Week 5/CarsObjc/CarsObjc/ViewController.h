//
//  ViewController.h
//  CarsObjc
//
//  Created by Consultant on 6/27/22.
//

#import <UIKit/UIKit.h>

@class Car;

@protocol AddCarDelegate <NSObject>

-(void)addcar: (Car *)car;

@end

@interface ViewController : UIViewController

@property (nonatomic, weak) id <AddCarDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

