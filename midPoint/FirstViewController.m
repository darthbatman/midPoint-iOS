//
//  FirstViewController.m
//  midPoint
//
//  Created by Rishi Masand on 2/14/15.
//  Copyright (c) 2015 Rishi Masand. All rights reserved.
//text`

#import "FirstViewController.h"

@interface FirstViewController ()
@property (nonatomic, strong) NSUserDefaults *userDefaults;

@end

@implementation FirstViewController

@synthesize preference, label1, label2, label3, label4, label5, label6, label7, label8, label9, label10, label11, userDefaults, locationManager;

NSMutableArray *theAddresses;

NSString *address1;
NSString *address2;
NSString *address3;
NSString *address4;
NSString *address5;
NSString *address6;
NSString *address7;
NSString *address8;
NSString *address9;
NSString *address10;
NSString *address11;

CLLocation *userLocation;


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *location = [locations lastObject];
    float ulLat = location.coordinate.latitude;
    float ulLong = location.coordinate.longitude;
    [self.userDefaults setFloat:ulLat forKey:@"userLocationLat"];
    [self.userDefaults setFloat:ulLong forKey:@"userLocationLong"];
    userLocation = location;
    NSLog(@"Hello from didUpdateLocations");
    NSLog(@"location = %f, %f", location.coordinate.latitude, location.coordinate.longitude);
    NSLog(@"userLocation = %f, %f", userLocation.coordinate.latitude, userLocation.coordinate.longitude);
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.userDefaults = [NSUserDefaults standardUserDefaults];
    // Do any additional setup after loading the view, typically from a nib.
    theAddresses = [[NSMutableArray alloc]init];
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = 1;
    
    [locationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

NSString *fn;
NSString *ln;
NSString *theAddress;

NSInteger increment = 0;

- (IBAction)addContact:(id)sender {
    if(!peoplePicker) {
        peoplePicker = [[ABPeoplePickerNavigationController alloc]init];
        [peoplePicker setPeoplePickerDelegate:self];
    }
    [self presentViewController:peoplePicker animated:YES completion:nil];
}

- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker didSelectPerson:(ABRecordRef)person {
    NSString *firstName = (__bridge NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
    NSString *lastName = (__bridge NSString *)ABRecordCopyValue(person, kABPersonLastNameProperty);
    ABMultiValueRef addresses = ABRecordCopyValue(person, kABPersonAddressProperty);
    
    NSMutableDictionary *contactAddress = [[NSMutableDictionary alloc]
                                           initWithObjects:@[@"", @"", @""]
                                           forKeys:@[@"street", @"state", @"city"]];
    
    
    
    if (ABMultiValueGetCount(addresses) > 0){
        NSDictionary *addressDict = (__bridge NSDictionary *)ABMultiValueCopyValueAtIndex(addresses, 0);
        
        [contactAddress setObject:[addressDict objectForKey:(NSString *)kABPersonAddressStreetKey] forKey:@"street"];
        [contactAddress setObject:[addressDict objectForKey:(NSString *)kABPersonAddressStateKey] forKey:@"state"];
        [contactAddress setObject:[addressDict objectForKey:(NSString *)kABPersonAddressCityKey] forKey:@"city"];
        
    }
    
    NSString *street = (NSString*)[contactAddress objectForKey:@"street"];
    NSString *state = (NSString*)[contactAddress objectForKey:@"state"];
    NSString *city = (NSString*)[contactAddress objectForKey:@"city"];
    
    NSString *partialAddress = [street stringByAppendingString:[@" " stringByAppendingString:city]];
    NSString *address = [partialAddress stringByAppendingString:[@" " stringByAppendingString:state]];
    
    fn = firstName;
    ln = lastName;
    theAddress = address;
    
    [theAddresses addObject:theAddress];
    
    
    
    
    if (increment == 0) {
        label1.text = [fn stringByAppendingString:[@" " stringByAppendingString:ln]];
        
        //address1 = theAddress;
     
    }
    else if (increment == 1){
        label2.text = [fn stringByAppendingString:[@" " stringByAppendingString:ln]];
        //address2 = theAddress;
     
    }
    else if (increment == 2){
        label3.text = [fn stringByAppendingString:[@" " stringByAppendingString:ln]];
        //address3 = theAddress;
     
    }
    else if (increment == 3){
        label4.text = [fn stringByAppendingString:[@" " stringByAppendingString:ln]];
        //address4 = theAddress;
     
    }
    else if (increment == 4){
        label5.text = [fn stringByAppendingString:[@" " stringByAppendingString:ln]];
        //address5 = theAddress;

    }
    else if (increment == 5){
        label6.text = [fn stringByAppendingString:[@" " stringByAppendingString:ln]];
        //address6 = theAddress;
   
    }
    else if (increment == 6){
        label7.text = [fn stringByAppendingString:[@" " stringByAppendingString:ln]];
        //address7 = theAddress;
     
    }
    else if (increment == 7){
        label8.text = [fn stringByAppendingString:[@" " stringByAppendingString:ln]];
        //address8 = theAddress;
     
    }
    else if (increment == 8){
        label9.text = [fn stringByAppendingString:[@" " stringByAppendingString:ln]];
        //address9 = theAddress;
     
    }
    else if (increment == 9){
        label10.text = [fn stringByAppendingString:[@" " stringByAppendingString:ln]];
        //address10 = theAddress;
     
    }
    else if (increment == 10){
        label11.text = [fn stringByAppendingString:[@" " stringByAppendingString:ln]];
        //address11 = theAddress;
    }
    
    
    
    
    //label1.text = firstName;
    //txtLastName.text = lastName;
    //txtAddress.text = address;
    
        increment++;
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}



- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier {
    
    return YES;
    
}

- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) addToDefaults {
    
    //NSLog(@"Hello from addToDefaults");
    
    if (increment >= 1){
    [self.userDefaults setValue:theAddresses[0] forKey:@"Label1"];
    [self.userDefaults setValue:label1.text forKey:@"Name1"];
    }
    if (increment >=2){
    [self.userDefaults setValue:theAddresses[1] forKey:@"Label2"];
    [self.userDefaults setValue:label2.text forKey:@"Name2"];
    }
    if(increment >=3){
    [self.userDefaults setValue:theAddresses[2] forKey:@"Label3"];
    [self.userDefaults setValue:label3.text forKey:@"Name3"];
    }
    if(increment >= 4){
    [self.userDefaults setValue:theAddresses[3] forKey:@"Label4"];
    [self.userDefaults setValue:label4.text forKey:@"Name4"];
    }
    if(increment >=5){
    [self.userDefaults setValue:theAddresses[4] forKey:@"Label5"];
    [self.userDefaults setValue:label5.text forKey:@"Name5"];
    }
    if(increment >= 6){
    [self.userDefaults setValue:theAddresses[5] forKey:@"Label6"];
    [self.userDefaults setValue:label6.text forKey:@"Name6"];
    }
    if(increment >=7){
    [self.userDefaults setValue:theAddresses[6] forKey:@"Label7"];
    [self.userDefaults setValue:label7.text forKey:@"Name7"];
    }
    if(increment >= 8){
    [self.userDefaults setValue:theAddresses[7] forKey:@"Label8"];
    [self.userDefaults setValue:label8.text forKey:@"Name8"];
    }
    if(increment >= 9){
    [self.userDefaults setValue:theAddresses[8] forKey:@"Label9"];
    [self.userDefaults setValue:label9.text forKey:@"Name9"];
    }
    if(increment >=10){
    [self.userDefaults setValue:theAddresses[9] forKey:@"Label10"];
    [self.userDefaults setValue:label10.text forKey:@"Name10"];
    }
    if(increment >=11){
    [self.userDefaults setValue:theAddresses[10] forKey:@"Label11"];
    [self.userDefaults setValue:label11.text forKey:@"Name11"];
    }

    [self.userDefaults setValue:preference.text forKey:@"Preference"];
    
    [self.userDefaults setValue:[NSString stringWithFormat:@"%li", increment] forKey:@"Increment"];
    [self.userDefaults setValue:theAddresses forKey:@"theAddresses"];
    
    //NSString *lab1 = [self.userDefaults stringForKey:@"Label1"];
    //NSLog(@"Address1: %@", lab1);
    
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.preference endEditing: YES];
    
}

- (IBAction)clear:(id)sender {
    //NSLog(@"InClearFVC");
    [self.userDefaults setValue:@"1" forKey:@"Clear"];
    //NSString *clearCheck = [userDefaults stringForKey:@"Clear"];
    //NSLog(@"ClearCheckFVC %@", clearCheck);
}

- (IBAction)submit:(id)sender {
    [self addToDefaults];
}
@end
