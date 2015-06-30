//
//  CustomTableViewCell.h
//  SimpleTable
//
//  Created by iPOS on 6/24/15.
//  Copyright (c) 2015 iPOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageItem;
@property (weak, nonatomic) IBOutlet UILabel *lbNameItem;
@property (weak, nonatomic) IBOutlet UILabel *lbPriceItem;

- (IBAction)addItemToOrder:(UIButton *)sender;
@end
