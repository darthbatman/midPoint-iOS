//
//  SecondViewController.h
//  midPoint
//
//  Created by Rishi Masand on 2/14/15.
//  Copyright (c) 2015 Rishi Masand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface SecondViewController : UIViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapview;

@property (weak, nonatomic) IBOutlet UILabel *poiName;
@property (weak, nonatomic) IBOutlet UILabel *poiPhone;

@property (nonatomic, retain) CLLocationManager *locationManager;

@end

