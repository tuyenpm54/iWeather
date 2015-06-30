//
//  ViewController.m
//  objC-
//
//  Created by iPOS on 6/26/15.
//  Copyright (c) 2015 iPOS. All rights reserved.
//

#import "ViewController.h"

#define DarkSkyURL @"https://api.darkskyapp.com/v1/forecast/"
#define API_KEY @"a00788f170fa382851907a6f2752cda3"
#define LAT @"/42.7243"
#define LON @",-73.6927"

#define fullURL (DarkSkyURL API_KEY LAT LON)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fullURL]];
        [self performSelectorOnMainThread:@selector(fetchedForecast:) withObject:data waitUntilDone:YES];
    });
    
}

- (void)viewDidAppear:(BOOL)animated {
    
   
}

- (void)fetchedForecast:(NSData *) responeData {
    NSError *error;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responeData options: kNilOptions error:&error];
    NSLog(@"%@", json);
    self.lbTimeZone.text = [json objectForKey:@"timezone"];
    self.lbHourlyForecase.text = [json objectForKey:@"hourSummary"];
    self.lbTemperature.text = [NSString stringWithFormat:@"%@",[json objectForKey:@"currentTemp"]];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
