//
//  ViewController.m
//  BreweryObjc
//
//  Created by Consultant on 6/28/22.
//

#import "ViewController.h"
#import "DetailsViewController.h"
#import "Models/Brewery.h"

/*
 variable for reusable cell
 */
NSString *reusableCell = @"cell";

/*
 Storyboard ids
 */

NSString  *detailsVC = @"DetailsVC";

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *breweryTableView;
@property NSMutableArray<Brewery *> *breweries;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self fetchData];
}

-(void)setup{
    self.breweries  = NSMutableArray.new;
}

-(void)fetchData{
    NSString *urlString = @"https://api.openbrewerydb.org/breweries";
    NSURL *url = [NSURL URLWithString:urlString];
    
    [[ NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *err;
        NSArray *breweriesArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        if(err){
            NSLog(@"Failed to parse JSON: %@", err);
            return;
        }
        NSMutableArray <Brewery *> *breweries = NSMutableArray.new;
        for(NSDictionary *breweryDic in breweriesArray){
            NSString *name = breweryDic[@"name"];
            NSString *type = breweryDic[@"brewery_type"];
            NSString *city = breweryDic[@"city"];
            NSString *state = breweryDic[@"state"];
            
            Brewery *brewery = Brewery.new;
            brewery.name = name;
            brewery.type = type;
            brewery.city = city;
            brewery.state = state;
            
            [breweries addObject: brewery];
        }
        
        self.breweries = breweries;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.breweryTableView reloadData];
        });
    }] resume ];
}

/*
 TableView Methods; delegates have been set in storyboard
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //get count of countries in countries list for number of tableview cells
    return self.breweries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reusableCell forIndexPath:indexPath];
    
    cell.textLabel.text = self.breweries[indexPath.row].name;
    cell.detailTextLabel.text =  [NSString stringWithFormat:@"%@, %@", self.breweries[indexPath.row].city, self.breweries[indexPath.row].state];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Brewery *selectedItem = [self.breweries objectAtIndex:indexPath.row];
    DetailsViewController *detailsViewController = [self.storyboard instantiateViewControllerWithIdentifier:detailsVC];
    
    detailsViewController.detailsBrewery = selectedItem;
    
    [self.navigationController pushViewController:detailsViewController animated:YES];
}


@end
