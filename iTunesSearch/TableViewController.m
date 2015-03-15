//
//  ViewController.m
//  iTunesSearch
//
//  Created by joaquim on 09/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "iTunesManager.h"
#import "Entidades/Filme.h"
#import "Entidades/Ebook.h"
#import "Entidades/Musica.h"
#import "Entidades/Podcast.h"
#import "DetalhesViewController.h"

@interface TableViewController () {
    NSArray *midias;
    NSUserDefaults *lastSearch;
}

@end

@implementation TableViewController

@synthesize btn,texto;

- (void)viewDidLoad {
    
    _tableview.delegate = self;
    _tableview.dataSource = self;
    lastSearch = [NSUserDefaults standardUserDefaults];
    
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"TableViewCell" bundle:nil];
    [self.tableview registerNib:nib forCellReuseIdentifier:@"celulaPadrao"];
    
    if (nil == lastSearch) {
        iTunesManager *itunes = [iTunesManager sharedInstance];
        midias = [itunes buscarMidias:@"Apple"];
    }
    else{
        iTunesManager *itunes = [iTunesManager sharedInstance];
        NSString *aux = [[lastSearch stringForKey:@"keyToLookupString"] stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    
        midias = [itunes buscarMidias:aux];
    }
    
    self.navigationItem.title = @"Search";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Metodos do UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [midias count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[midias objectAtIndex:section]count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0: return @"eBooks";
        case 1: return @"Filmes";
        case 2: return @"Musicas";
        case 3: return @"Podcasts";
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [self.tableview dequeueReusableCellWithIdentifier:@"celulaPadrao"];
    
    Ebook *ebook;
    Filme *filme;
    Musica *musica;
    Podcast *podcast;
    
    switch (indexPath.section) {
        case 0:
            ebook = [[midias objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
            
            [cell.name      setText:  ebook.trackName];
            [cell.artist    setText:  ebook.artistName];
            [cell.genre     setText:  ebook.genres];
            [cell.price     setText: [NSString stringWithFormat:@"$%@",[ebook.price stringValue]]];
            [cell.trackYear setText: [ebook.releaseDate substringToIndex:4]];
            [cell.image     setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:ebook.artworkUrl100]]]];
            [cell.kindImage setImage:[UIImage imageNamed:@"ebook.png"]];
            break;
            
        case 1:
            filme = [[midias objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];

            [cell.name      setText:  filme.trackName];
            [cell.artist    setText:  filme.shortDescription];
            [cell.genre     setText:  filme.primaryGenreName];
            [cell.price     setText: [NSString stringWithFormat:@"$%@",[filme.trackPrice stringValue]]];
            [cell.trackYear setText: [filme.releaseDate substringToIndex:4]];
            [cell.image     setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:filme.artworkUrl100]]]];
            [cell.kindImage setImage:[UIImage imageNamed:@"movie.png"]];
            break;
            
        case 2:
            musica = [[midias objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
            
            [cell.name      setText:  musica.trackName];
            [cell.artist    setText:  musica.artistName];
            [cell.genre     setText:  musica.primaryGenreName];
            [cell.price     setText: [NSString stringWithFormat:@"$%@",[musica.trackPrice stringValue]]];
            [cell.trackYear setText: [musica.releaseDate substringToIndex:4]];
            [cell.image     setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:musica.artworkUrl100]]]];
            [cell.kindImage setImage:[UIImage imageNamed:@"music.png"]];
            break;
            
        case 3:
            podcast = [[midias objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
            
            [cell.name      setText:  podcast.trackName];
            [cell.artist    setText:  podcast.artistName];
            [cell.genre     setText:  podcast.primaryGenreName];
            [cell.price     setText: [NSString stringWithFormat:@"$%@",[podcast.trackPrice stringValue]]];
            [cell.trackYear setText: [podcast.releaseDate substringToIndex:4]];
            [cell.image     setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:podcast.artworkUrl100]]]];
            [cell.kindImage setImage:[UIImage imageNamed:@"podcast.png"]];
            break;
            
        default:
            break;
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DetalhesViewController *det = [[DetalhesViewController alloc]init];
    
    det.row = [indexPath row];
    det.section = [indexPath section];
    
    [[self navigationController] pushViewController:det animated:YES];
}

- (IBAction)buscar:(id)sender {
    iTunesManager *itunes = [iTunesManager sharedInstance];
    NSString *aux = [texto.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    
    midias = [itunes buscarMidias:aux];
   
    [_tableview reloadData];
    
    [texto resignFirstResponder];
    
    [lastSearch setObject:texto.text forKey:@"keyToLookupString"];
}
@end
