//
//  ViewController.m
//  iWeather
//
//  Created by iPOS on 6/29/15.
//  Copyright (c) 2015 iPOS. All rights reserved.
//

#import "ViewController.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *placeLb;
@property (weak, nonatomic) IBOutlet UILabel *quote;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;


@property (weak, nonatomic) IBOutlet UIImageView *icHumidity;
@property (weak, nonatomic) IBOutlet UILabel *unitHum;
@property (weak, nonatomic) IBOutlet UILabel *humidity;

@property (weak, nonatomic) IBOutlet UIImageView *icTemp;
@property (weak, nonatomic) IBOutlet UILabel *unitC;
@property (weak, nonatomic) IBOutlet UILabel *unitO;
@property (weak, nonatomic) IBOutlet UILabel *Temp;

@property (weak, nonatomic) IBOutlet UIImageView *icRainfall;
@property (weak, nonatomic) IBOutlet UILabel *unitRainfall;
@property (weak, nonatomic) IBOutlet UILabel *rainfall;

@property (weak, nonatomic) IBOutlet UIImageView *viewTemp;


@end

@implementation ViewController
{
    NSArray * quotes;
    NSArray *locations;
    NSArray *photoFiles;
    BOOL isCelsius;
    float currentTemp;
}
- (IBAction)onChangeFC:(id)sender {
    if (isCelsius) {
        isCelsius = false;
        self.unitC.text = @"F";
        currentTemp = [self changeCtoF: currentTemp];
        self.Temp.text = [NSString stringWithFormat:@"%2.1f", currentTemp];
    } else {
        isCelsius = true;
        self.unitC.text = @"C";
        currentTemp = [self changeFtoC: currentTemp];
        self.Temp.text = [NSString stringWithFormat:@"%2.1f", currentTemp];

    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    isCelsius = true;
    quotes = @[@"\"Trời nóng vãi! Xách quần lên và đi ra bể bơi thôi!\"", @"\"Trời hơi nóng nhưng được cái nhiều mây gió mát đi picnic thì hết xẩy!\"", @"\"Vừa nóng vừa mưa ra đường là ốm ngay.Ở nhà cho lành!\"", @"\"Thời tiết tuyệt vời! Thích làm gì thì làm!\"",@"\"Mưa gió bão bùng cả ngày nhớ mang áo mưa khi ra ngoài nhá!\"", @"\"Rét là rét quá đi! Tập thể dục cho nóng người nào!\""];
    
    locations = @[@"Hai Ba Trung, Hanoi", @"Sydney, Australia", @"New York, USA"];
    photoFiles = @[@"LightSunny",@"Sunny",@"Rain"];
    [self update];
   
    
}

-(void) update {
    int isRaining = arc4random_uniform(2);
    
    int photoIndex = arc4random_uniform((uint32_t)photoFiles.count);
    NSLog(@"PhotoIndex: %d",photoIndex);
    
    int locationIndex = arc4random_uniform((uint32_t)locations.count);
    NSLog(@"LocationIndex: %d",locationIndex);
    self.placeLb.text = locations[locationIndex];
    currentTemp = [self getTemperature];
    
    NSString *string = [NSString stringWithFormat:@"%2.1f",currentTemp];
    self.Temp.text = string;
    float cTemp;
    if (isCelsius) {
        cTemp = currentTemp;
    } else {
        cTemp = [ self changeFtoC:currentTemp];
    }
    
    if(cTemp > 30) {
        self.view.backgroundColor = UIColorFromRGB(0xff4040);
        self.Temp.textColor = UIColorFromRGB(0xff4040);
        self.humidity.textColor = UIColorFromRGB(0xff4040);
        self.rainfall.textColor = UIColorFromRGB(0xff4040);
        self.unitC.textColor = UIColorFromRGB(0xff4040);
        self.unitO.textColor = UIColorFromRGB(0xff4040);
        self.unitHum.textColor = UIColorFromRGB(0xff4040);
        self.unitRainfall.textColor = UIColorFromRGB(0xff4040);
        self.icHumidity.image = [UIImage imageNamed:@"humity_red.png"];
        self.icTemp.image = [UIImage imageNamed:@"templature_red.png"];
        self.icRainfall.image = [UIImage imageNamed:@"rainfall_red.png"];
        
        if(isRaining == 0) {
            self.quote.text = quotes[0];
            self.weatherIcon.image = [UIImage imageNamed: photoFiles[photoIndex]];
        } else {
            self.quote.text = quotes[2];
            self.weatherIcon.image = [UIImage imageNamed: photoFiles[2]];
        }
        
    } else if (cTemp > 25) {
        self.view.backgroundColor = UIColorFromRGB(0xff7F50);
        self.Temp.textColor = UIColorFromRGB(0xff7F50);
        self.humidity.textColor = UIColorFromRGB(0xff7F50);
        self.rainfall.textColor = UIColorFromRGB(0xff7F50);
        self.unitC.textColor = UIColorFromRGB(0xff7F50);
        self.unitO.textColor = UIColorFromRGB(0xff7F50);
        self.unitHum.textColor = UIColorFromRGB(0xff7F50);
        self.unitRainfall.textColor = UIColorFromRGB(0xff7F50);
        self.icHumidity.image = [UIImage imageNamed:@"humity_orange.png"];
        self.icTemp.image = [UIImage imageNamed:@"templature_orange.png"];
        self.icRainfall.image = [UIImage imageNamed:@"rainfall_orange.png"];
        
        if(isRaining == 0) {
            self.quote.text = quotes[1];
            self.weatherIcon.image = [UIImage imageNamed: photoFiles[photoIndex]];
        } else {
            self.quote.text = quotes[2];
            self.weatherIcon.image = [UIImage imageNamed: photoFiles[2]];
        }
    } else if (cTemp > 17) {
        self.view.backgroundColor = UIColorFromRGB(0x64ad64);
        self.Temp.textColor = UIColorFromRGB(0x64ad64);
        self.humidity.textColor = UIColorFromRGB(0x64ad64);
        self.rainfall.textColor = UIColorFromRGB(0x64ad64);
        self.unitC.textColor = UIColorFromRGB(0x64ad64);
        self.unitO.textColor = UIColorFromRGB(0x64ad64);
        self.unitHum.textColor = UIColorFromRGB(0x64ad64);
        self.unitRainfall.textColor = UIColorFromRGB(0x64ad64);
        self.icHumidity.image = [UIImage imageNamed:@"humity_green.png"];
        self.icTemp.image = [UIImage imageNamed:@"templature_green.png"];
        self.icRainfall.image = [UIImage imageNamed:@"rainfall_green.png"];
        
        if(isRaining == 0) {
            self.quote.text = quotes[3];
            self.weatherIcon.image = [UIImage imageNamed: photoFiles[photoIndex]];
        } else {
            self.quote.text = quotes[4];
            self.weatherIcon.image = [UIImage imageNamed: photoFiles[2]];
        }
    } else {
        self.view.backgroundColor = UIColorFromRGB(0x4783ba);
        self.Temp.textColor = UIColorFromRGB(0x4783ba);
        self.humidity.textColor = UIColorFromRGB(0x4783ba);
        self.rainfall.textColor = UIColorFromRGB(0x4783ba);
        self.unitC.textColor = UIColorFromRGB(0x4783ba);
        self.unitO.textColor = UIColorFromRGB(0x4783ba);
        self.unitHum.textColor = UIColorFromRGB(0x4783ba);
        self.unitRainfall.textColor = UIColorFromRGB(0x4783ba);
        self.icHumidity.image = [UIImage imageNamed:@"humity_blue.png"];
        self.icTemp.image = [UIImage imageNamed:@"templature_blue.png"];
        self.icRainfall.image = [UIImage imageNamed:@"rainfall_blue.png"];
        
        
        self.quote.text = quotes[5];
        self.weatherIcon.image = [UIImage imageNamed: photoFiles[photoIndex]];
    }
}

- (float) getTemperature {
    float temp;
    if (isCelsius) {
        temp = 14.0 + arc4random_uniform(18) + (float)arc4random() /(float) INT32_MAX;
    } else {
        temp = (14.0 + arc4random_uniform(18) + (float)arc4random() /(float) INT32_MAX)*1.8 + 32;
    }
    return temp;
}
- (IBAction)refresh:(id)sender {
    [self update];
}

-(float) changeFtoC:(float) f {
    return (f - 32.0) / 1.8;
}

-(float) changeCtoF:(float) c {
    return (c * 1.8 + 32.0);
}


@end
