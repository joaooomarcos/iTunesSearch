//
//  DetalhesViewController.m
//  iTunesSearch
//
//  Created by João Marcos on 13/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "DetalhesViewController.h"
#import "iTunesManager.h"
#import "Filme.h"
#import "Ebook.h"
#import "Musica.h"
#import "Podcast.h"


@interface DetalhesViewController ()

@end

@implementation DetalhesViewController

@synthesize row, section, nome, tipo, genero, pais;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated{
    iTunesManager *im = [iTunesManager sharedInstance];
    id objeto = [[im.results objectAtIndex:section]objectAtIndex:row];
    
    Ebook *ebook;
    Filme *filme;
    Musica *musica;
    Podcast *podcast;
    
    switch (section) {
        case 0:
            ebook = objeto;
            [nome setText:ebook.nome];
            [tipo setText:@"Ebook"];
            [pais setText:ebook.pais];
            [genero setText:ebook.genero];
            break;
        case 1:
            filme = objeto;
            [nome setText:filme.nome];
            [tipo setText:@"Filme"];
            [pais setText:filme.pais];
            [genero setText:filme.genero];
            break;
        case 2:
            musica = objeto;
            [nome setText:musica.nome];
            [tipo setText:@"Musica"];
            [pais setText:musica.pais];
            [genero setText:musica.genero];
            break;
        case 3:
            podcast = objeto;
            [nome setText:podcast.nome];
            [tipo setText:@"Podcast"];
            [pais setText:podcast.pais];
            [genero setText:podcast.genero];
            break;
            
        default:
            break;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
