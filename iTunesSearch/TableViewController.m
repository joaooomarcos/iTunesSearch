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

@interface TableViewController () {
    NSArray *midias;
    NSUserDefaults *ultimaBusca;
}

@end

@implementation TableViewController
@synthesize btn,texto;

- (void)viewDidLoad {
    
    _tableview.delegate = self;
    _tableview.dataSource = self;
    ultimaBusca = [NSUserDefaults standardUserDefaults];
    
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"TableViewCell" bundle:nil];
    [self.tableview registerNib:nib forCellReuseIdentifier:@"celulaPadrao"];
    
//    if (nil == ultimaBusca) {
//        iTunesManager *itunes = [iTunesManager sharedInstance];
//        midias = [itunes buscarMidias:@"Apple"];
//    }
//    else{
//        iTunesManager *itunes = [iTunesManager sharedInstance];
//        NSString *aux = [[ultimaBusca stringForKey:@"keyToLookupString"] stringByReplacingOccurrencesOfString:@" " withString:@"+"];
//    
//        midias = [itunes buscarMidias:aux];
//    }
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
        case 0: return @"Ebook";
        case 1: return @"Filme";
        case 2: return @"Musica";
        case 3: return @"Podcast";
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *celula = [self.tableview dequeueReusableCellWithIdentifier:@"celulaPadrao"];
    
    Ebook *ebook;
    Filme *filme;
    Musica *musica;
    Podcast *podcast;
    
    switch (indexPath.section) {
        case 0:
            ebook = [midias objectAtIndex:indexPath.row];
            [celula.nome setText:ebook.nome];
            [celula.tipo setText:@"Ebook"];
            [celula.pais setText:ebook.pais];
            [celula.genero setText:ebook.genero];
            break;
        case 1:
            filme = [midias objectAtIndex:indexPath.row];
            [celula.nome setText:filme.nome];
            [celula.tipo setText:@"Filme"];
            [celula.pais setText:filme.pais];
            [celula.genero setText:filme.genero];
            break;
        case 2:
            musica = [midias objectAtIndex:indexPath.row];
            [celula.nome setText:musica.nome];
            [celula.tipo setText:@"Musica"];
            [celula.pais setText:musica.pais];
            [celula.genero setText:musica.genero];
            break;
        case 3:
            podcast = [midias objectAtIndex:indexPath.row];
            [celula.nome setText:podcast.nome];
            [celula.tipo setText:@"Podcast"];
            [celula.pais setText:podcast.pais];
            [celula.genero setText:podcast.genero];
            break;
            
        default:
            break;
    }
    
    return celula;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (IBAction)buscar:(id)sender {
    iTunesManager *itunes = [iTunesManager sharedInstance];
    NSString *aux = [texto.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    
    midias = [itunes buscarMidias:aux];
   
    [_tableview reloadData];
    
    [texto resignFirstResponder];
    
//    [ultimaBusca setObject:texto.text forKey:@"keyToLookupString"];
}
@end
