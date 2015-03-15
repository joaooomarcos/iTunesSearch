//
//  DetalhesViewController.h
//  iTunesSearch
//
//  Created by João Marcos on 13/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetalhesViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *kind;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *genre;
@property (weak, nonatomic) IBOutlet UILabel *country;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *artist;
@property (weak, nonatomic) IBOutlet UILabel *desc;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *trackId;
@property (weak, nonatomic) IBOutlet UILabel *trackPrice;

@property NSInteger row;
@property NSInteger section;

@end
