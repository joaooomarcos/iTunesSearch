//
//  Podcast.h
//  iTunesSearch
//
//  Created by João Marcos on 11/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Podcast : NSObject

@property (nonatomic, strong) NSString *artistName;         // Artista
@property (nonatomic, strong) NSString *artworkUrl100;      // URL da imagem da capa
@property (nonatomic, strong) NSString *collectionName;     // Album
@property (nonatomic, strong) NSString *country;            // País
@property (nonatomic, strong) NSString *kind;               // Tipo
@property (nonatomic, strong) NSString *primaryGenreName;   // Gênero
@property (nonatomic, strong) NSString *releaseDate;        // Data de Lançamento
@property (nonatomic, strong) NSNumber *trackId;            // Id
@property (nonatomic, strong) NSString *trackName;          // Nome
@property (nonatomic, strong) NSNumber *trackPrice;         // Preço

@end
