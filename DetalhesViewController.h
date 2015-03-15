//
//  DetalhesViewController.h
//  iTunesSearch
//
//  Created by João Marcos on 13/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetalhesViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *tipo;
@property (weak, nonatomic) IBOutlet UIImageView *imagem;
@property (weak, nonatomic) IBOutlet UILabel *nome;
@property (weak, nonatomic) IBOutlet UILabel *genero;
@property (weak, nonatomic) IBOutlet UILabel *pais;
@property NSInteger row;
@property NSInteger section;

@end
