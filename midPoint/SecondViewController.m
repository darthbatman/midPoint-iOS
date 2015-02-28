//
//  SecondViewController.m
//  midPoint
//
//  Created by Rishi Masand on 2/14/15.
//  Copyright (c) 2015 Rishi Masand. All rights reserved.
//

#import "SecondViewController.h"
#import "FirstViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "AppDelegate.h"
#import "Annotation.h"

@interface SecondViewController ()

@end

@implementation SecondViewController 

@synthesize mapview, poiName, poiPhone;

NSString *Check = @"0";

CLLocation *userLocation;

NSMutableArray *theAddresses;
//NSMutableArray *theCoordinates;

/*

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *location = [locations lastObject];
    userLocation = location;
    NSLog(@"Hello from didUpdateLocations");
    NSLog(@"location = %f, %f", location.coordinate.latitude, location.coordinate.longitude);
    NSLog(@"userLocation = %f, %f", userLocation.coordinate.latitude, userLocation.coordinate.longitude);
    
}
*/

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    /*
    
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = 1;
    
    [locationManager startUpdatingLocation];
     */
    
    [self.mapview setShowsUserLocation:YES];
    /*
    
    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [self.locationManager requestWhenInUseAuthorization];
    
    [self.locationManager startUpdatingLocation];
    
    CLLocationCoordinate2D theUserLocation = self.mapview.centerCoordinate;
    */
    //NSLog(@"User Location: %f %f", theUserLocation.latitude, theUserLocation.longitude);
    
    NSString *label1 = [userDefaults stringForKey:@"Label1"];
    NSString *label2 = [userDefaults stringForKey:@"Label2"];
    NSString *label3 = [userDefaults stringForKey:@"Label3"];
    NSString *label4 = [userDefaults stringForKey:@"Label4"];
    NSString *label5 = [userDefaults stringForKey:@"Label5"];
    NSString *label6 = [userDefaults stringForKey:@"Label6"];
    NSString *label7 = [userDefaults stringForKey:@"Label7"];
    NSString *label8 = [userDefaults stringForKey:@"Label8"];
    NSString *label9 = [userDefaults stringForKey:@"Label9"];
    NSString *label10 = [userDefaults stringForKey:@"Label10"];
    NSString *label11 = [userDefaults stringForKey:@"Label11"];
    
    NSString *name1 =[userDefaults stringForKey:@"Name1"];
    NSString *name2 =[userDefaults stringForKey:@"Name2"];
    NSString *name3 =[userDefaults stringForKey:@"Name3"];
    NSString *name4 =[userDefaults stringForKey:@"Name4"];
    NSString *name5 =[userDefaults stringForKey:@"Name5"];
    NSString *name6 =[userDefaults stringForKey:@"Name6"];
    NSString *name7 =[userDefaults stringForKey:@"Name7"];
    NSString *name8 =[userDefaults stringForKey:@"Name8"];
    NSString *name9 =[userDefaults stringForKey:@"Name9"];
    NSString *name10 =[userDefaults stringForKey:@"Name10"];
    NSString *name11 =[userDefaults stringForKey:@"Name11"];
   
    float increment =[[userDefaults stringForKey:@"Increment"]floatValue];
    
    NSLog(@"Increment: %f", increment);
    
    Check = [userDefaults stringForKey:@"Clear"];
    //NSLog(@"CheckSVC: %@", Check);
    
    theAddresses = [[NSMutableArray alloc]init];
    //theCoordinates = [[NSMutableArray alloc]init];
    
    theAddresses = [userDefaults objectForKey:@"theAddresses"];
    
    NSMutableArray *theLatitudes = [[NSMutableArray alloc]init];
    NSMutableArray *theLongitudes = [[NSMutableArray alloc]init];
    
    NSMutableArray *theLats = [[NSMutableArray alloc]init];
    NSMutableArray *theLongs = [[NSMutableArray alloc]init];
    
    CLLocationCoordinate2D lab1 = [self geoCodeUsingAddress:label1];
    
    [theLats addObject:[NSNumber numberWithDouble:lab1.latitude]];
    [theLongs addObject:[NSNumber numberWithDouble:lab1.longitude]];
    
    NSString *tmpLab1Lat = [[NSString alloc] initWithFormat:@"%g",lab1.latitude];
    NSString *tmpLab1Long = [[NSString alloc] initWithFormat:@"%g",lab1.longitude];
    //[theLatitudes addObject:[NSNumber numberWithDouble:lab1.latitude]];
    [theLatitudes addObject:tmpLab1Lat];
    [theLongitudes addObject:tmpLab1Long];
    
    CLLocationCoordinate2D lab2 = [self geoCodeUsingAddress:label2];
    
    [theLats addObject:[NSNumber numberWithDouble:lab2.latitude]];
    [theLongs addObject:[NSNumber numberWithDouble:lab2.longitude]];
    
    NSString *tmpLab2Lat = [[NSString alloc] initWithFormat:@"%g",lab2.latitude];
    NSString *tmpLab2Long = [[NSString alloc] initWithFormat:@"%g",lab2.longitude];
    [theLatitudes addObject:tmpLab2Lat];
    [theLongitudes addObject:tmpLab2Long];
    
    CLLocationCoordinate2D lab3 = [self geoCodeUsingAddress:label3];
    
    [theLats addObject:[NSNumber numberWithDouble:lab3.latitude]];
    [theLongs addObject:[NSNumber numberWithDouble:lab3.longitude]];
    
    NSString *tmpLab3Lat = [[NSString alloc] initWithFormat:@"%g",lab3.latitude];
    NSString *tmpLab3Long = [[NSString alloc] initWithFormat:@"%g",lab3.longitude];
    [theLatitudes addObject:tmpLab3Lat];
    [theLongitudes addObject:tmpLab3Long];
    
    CLLocationCoordinate2D lab4 = [self geoCodeUsingAddress:label4];
    
    [theLats addObject:[NSNumber numberWithDouble:lab4.latitude]];
    [theLongs addObject:[NSNumber numberWithDouble:lab4.longitude]];
    
    NSString *tmpLab4Lat = [[NSString alloc] initWithFormat:@"%g",lab4.latitude];
    NSString *tmpLab4Long = [[NSString alloc] initWithFormat:@"%g",lab4.longitude];
    [theLatitudes addObject:tmpLab4Lat];
    [theLongitudes addObject:tmpLab4Long];
    
    CLLocationCoordinate2D lab5 = [self geoCodeUsingAddress:label5];
    
    [theLats addObject:[NSNumber numberWithDouble:lab5.latitude]];
    [theLongs addObject:[NSNumber numberWithDouble:lab5.longitude]];
    
    NSString *tmpLab5Lat = [[NSString alloc] initWithFormat:@"%g",lab5.latitude];
    NSString *tmpLab5Long = [[NSString alloc] initWithFormat:@"%g",lab5.longitude];
    [theLatitudes addObject:tmpLab5Lat];
    [theLongitudes addObject:tmpLab5Long];
    
    CLLocationCoordinate2D lab6 = [self geoCodeUsingAddress:label6];
    
    [theLats addObject:[NSNumber numberWithDouble:lab6.latitude]];
    [theLongs addObject:[NSNumber numberWithDouble:lab6.longitude]];
    
    NSString *tmpLab6Lat = [[NSString alloc] initWithFormat:@"%g",lab6.latitude];
    NSString *tmpLab6Long = [[NSString alloc] initWithFormat:@"%g",lab6.longitude];
    [theLatitudes addObject:tmpLab6Lat];
    [theLongitudes addObject:tmpLab6Long];
    
    CLLocationCoordinate2D lab7 = [self geoCodeUsingAddress:label7];
    
    [theLats addObject:[NSNumber numberWithDouble:lab7.latitude]];
    [theLongs addObject:[NSNumber numberWithDouble:lab7.longitude]];
    
    NSString *tmpLab7Lat = [[NSString alloc] initWithFormat:@"%g",lab7.latitude];
    NSString *tmpLab7Long = [[NSString alloc] initWithFormat:@"%g",lab7.longitude];
    [theLatitudes addObject:tmpLab7Lat];
    [theLongitudes addObject:tmpLab7Long];
    
    CLLocationCoordinate2D lab8 = [self geoCodeUsingAddress:label8];
    
    [theLats addObject:[NSNumber numberWithDouble:lab8.latitude]];
    [theLongs addObject:[NSNumber numberWithDouble:lab8.longitude]];
    
    NSString *tmpLab8Lat = [[NSString alloc] initWithFormat:@"%g",lab8.latitude];
    NSString *tmpLab8Long = [[NSString alloc] initWithFormat:@"%g",lab8.longitude];
    [theLatitudes addObject:tmpLab8Lat];
    [theLongitudes addObject:tmpLab8Long];
    
    CLLocationCoordinate2D lab9 = [self geoCodeUsingAddress:label9];
    
    [theLats addObject:[NSNumber numberWithDouble:lab9.latitude]];
    [theLongs addObject:[NSNumber numberWithDouble:lab9.longitude]];
    
    NSString *tmpLab9Lat = [[NSString alloc] initWithFormat:@"%g",lab9.latitude];
    NSString *tmpLab9Long = [[NSString alloc] initWithFormat:@"%g",lab9.longitude];
    [theLatitudes addObject:tmpLab9Lat];
    [theLongitudes addObject:tmpLab9Long];
    
    CLLocationCoordinate2D lab10 = [self geoCodeUsingAddress:label10];
    
    [theLats addObject:[NSNumber numberWithDouble:lab10.latitude]];
    [theLongs addObject:[NSNumber numberWithDouble:lab10.longitude]];
    
    NSString *tmpLab10Lat = [[NSString alloc] initWithFormat:@"%g",lab10.latitude];
    NSString *tmpLab10Long = [[NSString alloc] initWithFormat:@"%g",lab10.longitude];
    [theLatitudes addObject:tmpLab10Lat];
    [theLongitudes addObject:tmpLab10Long];
    
    CLLocationCoordinate2D lab11 = [self geoCodeUsingAddress:label11];
    
    [theLats addObject:[NSNumber numberWithDouble:lab11.latitude]];
    [theLongs addObject:[NSNumber numberWithDouble:lab11.longitude]];
    
    NSString *tmpLab11Lat = [[NSString alloc] initWithFormat:@"%g",lab11.latitude];
    NSString *tmpLab11Long = [[NSString alloc] initWithFormat:@"%g",lab11.longitude];
    [theLatitudes addObject:tmpLab11Lat];
    [theLongitudes addObject:tmpLab11Long];
    
    /*
    
    int countUp = 0;
    
    for (NSString *addresso in theAddresses) {
        
        NSLog(@"LatLong %i: %@, %@", countUp, theLatitudes[countUp], theLongitudes[countUp]);
        //theCoordinates[countUp] = [geoCodeUsingAddress:label1];
        countUp++;
        
    }
     */
    
    NSString *preference = [userDefaults stringForKey:@"Preference"];
    
    //NSString *theTitle;
    //NSString *theSubtitle;
    
    
    
   
    
    //NSLog(@"label1 %@", label1);
    
    
    
    
    CLLocationCoordinate2D midPoint;
    
    //increment is 5
    //float numAdd = increment;
    
    
    
    /*
    
    for (int i = 1; i <= numAdd; i++){
        if (i == 1){
            sumLat += lab1.latitude;
            NSLog(@"Lab1 Lat %f", lab1.latitude);
            sumLong += lab1.longitude;
            NSLog(@"Lab1 Long %f", lab1.longitude);
        }
        if (i == 2){
            sumLat += lab2.latitude;
            NSLog(@"Lab2 Lat %f", lab1.latitude);
            sumLong += lab2.longitude;
            NSLog(@"Lab2 Long %f", lab1.longitude);
        }
        if (i == 3){
            sumLat += lab3.latitude;
            NSLog(@"Lab3 Lat %f", lab1.latitude);
            sumLong += lab3.longitude;
            NSLog(@"Lab3 Long %f", lab1.longitude);
        }
        if (i == 4){
            sumLat += lab4.latitude;
            NSLog(@"Lab4 Lat %f", lab1.latitude);
            sumLong += lab4.longitude;
            NSLog(@"Lab4 Long %f", lab1.longitude);
        }
        
        midPoint.latitude = sumLat/numAdd;
        midPoint.longitude = sumLong/numAdd;
    }
     */
    
   
    
    float sumLat = [userDefaults floatForKey:@"userLocationLat"];
    float sumLong = [userDefaults floatForKey:@"userLocationLong"];
    
    long int addCount = [theAddresses count];
    
    for (int w = 0; w < addCount; w++){
        NSLog(@"Address %i : %@", w, theAddresses[w]);
        NSLog(@"Lat: %f", [theLats[w] doubleValue]);
        NSLog(@"Long: %f", [theLongs[w] doubleValue]);
        
        sumLat += [theLats[w] doubleValue];
        sumLong += [theLongs[w] doubleValue];
        
        midPoint.latitude = sumLat/(w+2);
        midPoint.longitude = sumLong/(w+2);
        
        NSLog(@"midPoint.latitude: %f", midPoint.latitude);
        NSLog(@"midPoint.longitude: %f", midPoint.longitude);
    }
    
    NSLog(@"User Location: %f, %f", userLocation.coordinate.latitude, userLocation.coordinate.longitude);
    
    //midPoint.latitude = ((midPoint.latitude + userLocation.coordinate.latitude) / 2);
    //midPoint.longitude = ((midPoint.longitude + userLocation.coordinate.longitude) / 2);
    
    
    /*
    NSString *lat;
    NSString *longdick;
    
    lat = [[NSString alloc] initWithFormat:@"%g", lab4.latitude];
    longdick = [[NSString alloc] initWithFormat:@"%g",lab4.longitude];
    
    NSLog(@"lat %@", lat);
    NSLog(@"long %@", longdick);
     */
    
   
    
    MKCoordinateSpan midSpan;
    midSpan.latitudeDelta = 0.06f;
    midSpan.longitudeDelta = 0.06f;
    MKCoordinateRegion midRegion;
    midRegion.center = midPoint;
    midRegion.span = midSpan;
    
    __block NSString *elTitulo2;
    __block NSString *elSubtitulo2;
    
    [mapview setRegion:midRegion animated:YES];
    
    __block NSString *poiLat;
    __block NSString *poiLong;
    __block double poiZip;
    
    __block NSString *poiTF;
    
    __block BOOL first = YES;
    
    //MKPlacemark *placemark;
    
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc]init];
    request.naturalLanguageQuery = preference;
    request.region = MKCoordinateRegionMakeWithDistance(midPoint, 2000, 2000);
    MKLocalSearch *search = [[MKLocalSearch alloc]initWithRequest:request];
    [search startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error){
        
        NSMutableArray *theAnnotations = [NSMutableArray array];
        
        [response.mapItems enumerateObjectsUsingBlock:^(MKMapItem *item, NSUInteger idx, BOOL *stop) {
            
            for (id<MKAnnotation>annotation in mapview.annotations) {
                if (annotation.coordinate.latitude == item.placemark.coordinate.latitude && annotation.coordinate.longitude == item.placemark.coordinate.longitude) {
                    return;
                }
            }
            
            [theAnnotations addObject:item.placemark];
            
        }];
        
        
        for (MKMapItem *item in response.mapItems){
            
            
            
            if (first){
            
            __block NSString *elTitulo = item.name;
            NSLog(@"%@", elTitulo);
            __block NSString *elSubtitulo = item.phoneNumber;
            NSLog(@"%@", elSubtitulo);
                
            poiLat = [item.placemark.addressDictionary valueForKey:@"latitude"];
            poiLong = [item.placemark.addressDictionary valueForKey:@"longitude"];
            
            poiZip = item.placemark.location.coordinate.latitude;
                
                poiTF = item.placemark.country;
                
            poiName.text = elTitulo;
            //elTitulo2 = elTitulo;
            poiPhone.text = elSubtitulo;
            NSLog(@"%@: %f, %f", item.name, item.placemark.coordinate.latitude, item.placemark.coordinate.longitude);
                
            
                [mapview addAnnotation:item.placemark];
                
                first = NO;
            }
        
        }
    }];
    
    //NSLog(@"T2 %@", elTitulo2);
    
    NSLog(@"poiTF: %@", poiTF);
    
    NSLog(@"poiZip: %f", poiZip);
    
    poiName.text = elTitulo2;
    
    float poiLatf = [poiLat floatValue];
    float poiLongf = [poiLong floatValue];
    
    //NSLog (@"POI C: %f, %f", poiLatf, poiLongf);
    
    NSMutableArray * allAnnotations = [[NSMutableArray alloc] init];
    
    CLLocationCoordinate2D poiC;
    poiC.latitude = poiLatf;
    poiC.longitude = poiLongf;
    
    
    
    
    Annotation *myAnnotation;
    
    myAnnotation = [[Annotation alloc]init];
    myAnnotation.coordinate = poiC;
    myAnnotation.title = elTitulo2;
    [allAnnotations addObject:myAnnotation];

    myAnnotation = [[Annotation alloc]init];
        myAnnotation.coordinate = midPoint;
    myAnnotation.title = @"midPoint";
    //myAnnotation.subtitle = elSubtitulo2;
        [allAnnotations addObject:myAnnotation];
    
   
    
    
    myAnnotation = [[Annotation alloc]init];
    if (lab1.latitude != 57.4756){
        myAnnotation.coordinate = lab1;
        myAnnotation.title = name1;
        myAnnotation.subtitle = label1;
        [allAnnotations addObject:myAnnotation];
    }
    
    myAnnotation = [[Annotation alloc]init];
    if (lab2.latitude != 57.4756){
        myAnnotation.coordinate = lab2;
        myAnnotation.title = name2;
        myAnnotation.subtitle = label2;
        [allAnnotations addObject:myAnnotation];
    }
    
    myAnnotation = [[Annotation alloc]init];
    if (lab3.latitude != 57.4756){
        myAnnotation.coordinate = lab3;
        myAnnotation.title = name3;
        myAnnotation.subtitle = label3;
        [allAnnotations addObject:myAnnotation];
    }
    
    myAnnotation = [[Annotation alloc]init];
    if (lab4.latitude != 57.4756){
        myAnnotation.coordinate = lab4;
        myAnnotation.title = name4;
        myAnnotation.subtitle = label4;
        [allAnnotations addObject:myAnnotation];
    }
    
    myAnnotation = [[Annotation alloc]init];
    if (lab5.latitude != 57.4756){
        myAnnotation.coordinate = lab5;
        myAnnotation.title = name5;
        myAnnotation.subtitle = label5;
        [allAnnotations addObject:myAnnotation];
    }
    
    myAnnotation = [[Annotation alloc]init];
    if (lab6.latitude != 57.4756){
        myAnnotation.coordinate = lab6;
        myAnnotation.title = name6;
        myAnnotation.subtitle = label6;
        [allAnnotations addObject:myAnnotation];
    }
    
    myAnnotation = [[Annotation alloc]init];
    if (lab7.latitude != 57.4756){
        myAnnotation.coordinate = lab7;
        myAnnotation.title = name7;
        myAnnotation.subtitle = label7;
        [allAnnotations addObject:myAnnotation];
    }
    
    myAnnotation = [[Annotation alloc]init];
    if (lab8.latitude != 57.4756){
        myAnnotation.coordinate = lab8;
        myAnnotation.title = name8;
        myAnnotation.subtitle = label8;
        [allAnnotations addObject:myAnnotation];
    }
    
    myAnnotation = [[Annotation alloc]init];
    if (lab9.latitude != 57.4756){
        myAnnotation.coordinate = lab9;
        myAnnotation.title = name9;
        myAnnotation.subtitle = label9;
        [allAnnotations addObject:myAnnotation];
    }
    
    myAnnotation = [[Annotation alloc]init];
    if (lab10.latitude != 57.4756){
        myAnnotation.coordinate = lab10;
        myAnnotation.title = name10;
        myAnnotation.subtitle = label10;
        [allAnnotations addObject:myAnnotation];
    }
    
    myAnnotation = [[Annotation alloc]init];
    if (lab11.latitude != 57.4756){
        myAnnotation.coordinate = lab11;
        myAnnotation.title = name11;
        myAnnotation.subtitle = label11;
        [allAnnotations addObject:myAnnotation];
    }
    
    [self.mapview addAnnotations: allAnnotations];
    
    //NSLog(@"Hello");
    
    //NSLog(@"Check: %@", Check);
    
    if ([Check intValue] == 1) {
        [mapview removeAnnotations:mapview.annotations];
    }
    

}

- (CLLocationCoordinate2D) geoCodeUsingAddress:(NSString *)address {
    double latitude = 0, longitude = 0;
    NSString *esc_addr =  [address
                           stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *req = [NSString
                     stringWithFormat:@"http://maps.google.com/maps/api/geocode/json?sensor=false&address=%@",
                     esc_addr];
    NSString *result = [NSString stringWithContentsOfURL:[NSURL
                                                          URLWithString:req] encoding:NSUTF8StringEncoding error:NULL];
    if (result) {
        NSScanner *scanner = [NSScanner scannerWithString:result];
        if ([scanner scanUpToString:@"\"lat\" :" intoString:nil] &&
            [scanner scanString:@"\"lat\" :" intoString:nil]) {
            [scanner scanDouble:&latitude];
            if ([scanner scanUpToString:@"\"lng\" :" intoString:nil]
                && [scanner scanString:@"\"lng\" :" intoString:nil]) {
                [scanner scanDouble:&longitude];
            }
        }
    }
    
    CLLocationCoordinate2D center;
    center.latitude = latitude;
    center.longitude = longitude;
    return center;
    
}


/*

- (void)mapview:(MKMapView *)mapview didUpdateUserLocation:(MKUserLocation *)userLocation {
    NSLog(@"Hello from mapview");
    self.mapview.centerCoordinate = userLocation.location.coordinate;
    NSLog(@"UL Lat: %f UL Long %f", userLocation.location.coordinate.latitude, userLocation.location.coordinate.longitude);
}
*/
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
