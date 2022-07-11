//
//  ViewController.m
//  CarsObjc
//
//  Created by Consultant on 6/27/22.
//

#import "ViewController.h"
#import "Models/Car.h"

NSString *cellID = @"cell";


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *carListTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(NSMutableArray *)cars {
    NSMutableArray *cars = [[NSMutableArray alloc] initWithCapacity:10];
    
    Car *car1 = [[Car alloc] init];
    car1.image = [UIImage imageNamed:@"2019AstonMartinDBSSuperleggera"];
    car1.title = @"Aston Martin DBS Superleggera";
    [cars addObject:car1];
    
    Car *car2 = [[Car alloc] init];
    car2.image = [UIImage imageNamed:@"2020AudiRS6Avant"];
    car2.title = @"Audi RS6 Avant";
    [cars addObject:car2];
    
    Car *car3 = [[Car alloc] init];
    car3.image = [UIImage imageNamed:@"2020BentleyContinentalGTConvertible"];
    car3.title = @"Bentley Continental GT Convertible";
    [cars addObject:car3];
    
    Car *car4 = [[Car alloc] init];
    car4.image = [UIImage imageNamed:@"2020BugattiChironSuperSport300"];
    car4.title = @"Bugatti Chiron Super Sport 300";
    [cars addObject:car4];
    
    Car *car5 = [[Car alloc] init];
    car5.image = [UIImage imageNamed:@"2020ferrariSF90Stradale"];
    car5.title = @"Ferrari SF90 Stradale";
    [cars addObject:car5];
    
    Car *car6 = [[Car alloc] init];
    car6.image = [UIImage imageNamed:@"2020LamborghiniAventadorSVJRoadster"];
    car6.title = @"Lamborghini Aventador SVJ Roadster";
    [cars addObject:car6];
    
    Car *car7 = [[Car alloc] init];
    car7.image = [UIImage imageNamed:@"2020MercedesAMGGT63SFourDoor"];
    car7.title = @"Mercedes AMGGT63S Four Door";
    [cars addObject:car7];
    
    Car *car8 = [[Car alloc] init];
    car8.image = [UIImage imageNamed:@"2020PorscheTaycanMissionEConcept"];
    car8.title = @"Porsche Taycan Mission EConcept";
    [cars addObject:car8];
    
    Car *car9 = [[Car alloc] init];
    car9.image = [UIImage imageNamed:@"2020VolvoPolestar1"];
    car9.title = @"Volvo Polestar1";
    [cars addObject:car9];
    
    Car *car10 = [[Car alloc] init];
    car10.image = [UIImage imageNamed:@"Tesla-Roadster"];
    car10.title = @"Tesla-Roadster";
    [cars addObject:car10];
    
    
    return cars;
}

/*
 TableView Methods; delegates have been set in storyboard
 */

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    Car *cellCar = [self.cars objectAtIndex:indexPath.row];
    cell.textLabel.text = cellCar.title;
    cell.imageView.image = cellCar.image;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:false];
    [self.navigationController popToRootViewControllerAnimated:true];
    [self.delegate addcar:[self.cars objectAtIndex:indexPath.row]];
}


@end
