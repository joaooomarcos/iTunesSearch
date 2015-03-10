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

@interface TableViewController () {
    NSArray *midias;
}

@end

@implementation TableViewController
@synthesize btn,texto;

- (void)viewDidLoad {
    
    _tableview.delegate = self;
    _tableview.dataSource = self;
    
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"TableViewCell" bundle:nil];
    [self.tableview registerNib:nib forCellReuseIdentifier:@"celulaPadrao"];
    
    NSString *idioma = [[NSLocale preferredLanguages] objectAtIndex:0];
    
    if ([idioma isEqualToString:@"pt"]){
        [btn setTitle:@"Buscar" forState:UIControlStateNormal];
        texto.text = @"Digite aqui o que deseja procurar";
    }
    if ([idioma isEqualToString:@"en"]){
        [btn setTitle:@"Search" forState:UIControlStateNormal];
        texto.text = @"Type here what you want to search";
    }
    if ([idioma isEqualToString:@"fr"]){
        [btn setTitle:@"Recherche" forState:UIControlStateNormal];
        texto.text = @"Tapez ici ce que vous voulez rechercher";
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Metodos do UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [midias count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *celula = [self.tableview dequeueReusableCellWithIdentifier:@"celulaPadrao"];
    
    Filme *filme = [midias objectAtIndex:indexPath.row];
    
    [celula.nome setText:filme.nome];
    [celula.tipo setText:@"Filme"];
    [celula.pais setText:filme.pais];
    [celula.genero setText:filme.genero];
    
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
}
@end
