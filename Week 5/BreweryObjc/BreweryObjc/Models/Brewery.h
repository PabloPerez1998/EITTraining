//
//  Brewery.h
//  BreweryObjc
//
//  Created by Consultant on 6/28/22.
//

#import <Foundation/Foundation.h>


@interface Brewery : NSObject{
    NSString *name;
    NSString *type;
    NSString *city;
    NSString *state;
}

@property(nonatomic, retain) NSString *name;
@property(nonatomic, retain) NSString *type;
@property(nonatomic, retain) NSString *city;
@property(nonatomic, retain) NSString *state;

@end

