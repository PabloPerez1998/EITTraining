//
//  Car.h
//  CarsObjc
//
//  Created by Consultant on 6/27/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKey.h>

@interface Car : NSObject{
    UIImage *image;
    NSString *title;
}

@property(nonatomic, retain) UIImage *image;
@property(nonatomic, retain) NSString *title;

@end
