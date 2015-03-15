//
//  Ebook.h
//  iTunesSearch
//
//  Created by João Marcos on 11/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ebook : NSObject

@property (nonatomic, strong) NSString *artistName;     // Autor
@property (nonatomic, strong) NSString *artworkUrl100;  // URL da imagem da capa
@property (nonatomic, strong) NSString *country;        // País de origem
@property (nonatomic, strong) NSString *desc;           // Descrição
@property (nonatomic, strong) NSString *genres;         // Gênero
@property (nonatomic, strong) NSString *kind;           // Tipo
@property (nonatomic, strong) NSNumber *price;          // Preço
@property (nonatomic, strong) NSString *releaseDate;    // Data de lançamento
@property (nonatomic, strong) NSNumber *trackId;        // ID
@property (nonatomic, strong) NSString *trackName;      // Nome

@end
