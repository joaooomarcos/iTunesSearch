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

@synthesize row, section, name, kind, genre, country, image, artist, desc, date, trackPrice, trackId;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Detalhes";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
            
            [kind       setText:  @"eBook"];
            [name       setText:  ebook.trackName];
            [artist     setText:  ebook.artistName];
            [genre      setText:  ebook.genres];
            [desc       setText:  ebook.desc];
            [date       setText:  ebook.releaseDate];
            [trackId    setText:  [ebook.trackId stringValue]];
            [trackPrice setText:  [NSString stringWithFormat:@"$%@",[ebook.price stringValue]]];
            [image      setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:ebook.artworkUrl100]]]];
            break;
            
        case 1:
            filme = objeto;
            
            [kind       setText:  @"Filme"];
            [name       setText:  filme.trackName];
             artist.hidden = YES;
            [genre      setText:  filme.primaryGenreName];
            [desc       setText:  filme.shortDescription];
            [date       setText:  filme.releaseDate];
            [trackId    setText:  [filme.trackId stringValue]];
            [trackPrice setText:  [NSString stringWithFormat:@"$%@",[filme.trackPrice stringValue]]];
            [image      setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:filme.artworkUrl100]]]];
            break;
            
        case 2:
            musica = objeto;
            
            [kind       setText:  @"Música"];
            [name       setText:  musica.trackName];
            [artist     setText:  musica.artistName];
            [genre      setText:  musica.primaryGenreName];
             desc.hidden = YES;
            [date       setText:  musica.releaseDate];
            [trackId    setText:  [musica.trackId stringValue]];
            [trackPrice setText:  [NSString stringWithFormat:@"$%@",[musica.trackPrice stringValue]]];
            [image      setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:musica.artworkUrl100]]]];
            break;
            
        case 3:
            podcast = objeto;
            
            [kind       setText:  @"Podcast"];
            [name       setText:  podcast.trackName];
            [artist     setText:  podcast.artistName];
            [genre      setText:  podcast.primaryGenreName];
            [desc       setText:  podcast.description];
            [date       setText:  podcast.releaseDate];
            [trackId    setText: [podcast.trackId stringValue]];
            [trackPrice setText: [NSString stringWithFormat:@"$%@",[podcast.trackPrice stringValue]]];
            [image      setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:podcast.artworkUrl100]]]];
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
