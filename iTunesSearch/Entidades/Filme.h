//
//  Filme.h
//  iTunesSearch
//
//  Created by joaquim on 09/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Filme : NSObject

@property (nonatomic, strong) NSString *artworkUrl100;      // URL da imagem da capa
@property (nonatomic, strong) NSString *country;            // País
@property (nonatomic, strong) NSString *kind;               // Tipo
@property (nonatomic, strong) NSString *primaryGenreName;   // Gênero
@property (nonatomic, strong) NSString *releaseDate;        // Data de Lançamento
@property (nonatomic, strong) NSString *shortDescription;   // Descrição
@property (nonatomic, strong) NSString *trackName;          // Nome
@property (nonatomic, strong) NSNumber *trackId;            // Id
@property (nonatomic, strong) NSNumber *trackPrice;         // Preço

@end
