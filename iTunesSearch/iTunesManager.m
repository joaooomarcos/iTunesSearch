//
//  iTunesManager.m
//  iTunesSearch
//
//  Created by joaquim on 09/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "iTunesManager.h"
#import "Entidades/Ebook.h"
#import "Entidades/Filme.h"
#import "Entidades/Musica.h"
#import "Entidades/Podcast.h"

@implementation iTunesManager

static iTunesManager *SINGLETON = nil;

static bool isFirstAccess = YES;


@synthesize results;
#pragma mark - Public Method

+ (id)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        SINGLETON = [[super allocWithZone:NULL] init];    
    });
    
    return SINGLETON;
}


- (NSArray *)buscarMidias:(NSString *)termo {
    if (!termo) {
        termo = @"";
    }
    
    NSString *url = [NSString stringWithFormat:@"https://itunes.apple.com/search?term=%@&media=all", termo];
    NSData *jsonData = [NSData dataWithContentsOfURL: [NSURL URLWithString:url]];
    
    NSError *error;
    NSDictionary *resultado = [NSJSONSerialization JSONObjectWithData:jsonData
                                                              options:NSJSONReadingMutableContainers
                                                                error:&error];
    if (error) {
        NSLog(@"Não foi possível fazer a busca. ERRO: %@", error);
        return nil;
    }
    
    NSArray *resultados = [resultado objectForKey:@"results"];
    
    NSMutableArray *filmes =    [[NSMutableArray alloc] init];
    NSMutableArray *musicas =   [[NSMutableArray alloc] init];
    NSMutableArray *podcasts =  [[NSMutableArray alloc] init];
    NSMutableArray *ebooks =    [[NSMutableArray alloc] init];
    
    NSString *kind;
    
    for(NSDictionary *item in resultados) {
        
        kind = [item objectForKey:@"kind"];
        
        if ([kind isEqualToString:@"ebook"]) {
            
            Ebook *ebook = [[Ebook alloc] init];
            
            [ebook setArtistName:   [item objectForKey:@"artistName"]];
            [ebook setArtworkUrl100:[item objectForKey:@"artworkUrl100"]];
            [ebook setCountry:      [item objectForKey:@"country"]];
            [ebook setDesc   :      [item objectForKey:@"description"]];
            [ebook setGenres:       [item objectForKey:@"genres"]];
            [ebook setKind:         [item objectForKey:@"kind"]];
            [ebook setPrice:        [item objectForKey:@"price"]];
            [ebook setReleaseDate:  [item objectForKey:@"releaseDate"]];
            [ebook setTrackId:      [item objectForKey:@"trackId"]];
            [ebook setTrackName:    [item objectForKey:@"trackName"]];
            
            [ebooks addObject:ebook];
        }
        
        if ([kind isEqualToString:@"feature-movie"]) {
            
            Filme *filme = [[Filme alloc] init];
            
            [filme setArtworkUrl100:    [item objectForKey:@"artworkUrl100"]];
            [filme setCountry:          [item objectForKey:@"country"]];
            [filme setKind:             [item objectForKey:@"kind"]];
            [filme setPrimaryGenreName: [item objectForKey:@"primaryGenreName"]];
            [filme setReleaseDate:      [item objectForKey:@"releaseDate"]];
            [filme setShortDescription: [item objectForKey:@"shortDescription"]];
            [filme setTrackName:        [item objectForKey:@"trackName"]];
            [filme setTrackId:          [item objectForKey:@"trackId"]];
            [filme setTrackPrice:       [item objectForKey:@"trackPrice"]];
            
            [filmes addObject:filme];
        }
        
        if ([kind isEqualToString:@"song"]) {
            
            Musica *musica = [[Musica alloc] init];
            
            [musica setArtistName:      [item objectForKey:@"artistName"]];
            [musica setArtworkUrl100:   [item objectForKey:@"artworkUrl100"]];
            [musica setCollectionName:  [item objectForKey:@"collectionName"]];
            [musica setCollectionPrice: [item objectForKey:@"collectionPrice"]];
            [musica setCountry:         [item objectForKey:@"country"]];
            [musica setKind:            [item objectForKey:@"kind"]];
            [musica setPrimaryGenreName:[item objectForKey:@"primaryGenreName"]];
            [musica setReleaseDate:     [item objectForKey:@"releaseDate"]];
            [musica setTrackId:         [item objectForKey:@"trackId"]];
            [musica setTrackName:       [item objectForKey:@"trackName"]];
            [musica setTrackPrice:      [item objectForKey:@"trackPrice"]];
            
            [musicas addObject:musica];
        }
        
        if ([kind isEqualToString:@"podcast"]) {
            Podcast *podcast = [[Podcast alloc] init];
            
            [podcast setArtistName:      [item objectForKey:@"artistName"]];
            [podcast setArtworkUrl100:   [item objectForKey:@"artworkUrl100"]];
            [podcast setCollectionName:  [item objectForKey:@"collectionName"]];
            [podcast setCountry:         [item objectForKey:@"country"]];
            [podcast setKind:            [item objectForKey:@"kind"]];
            [podcast setPrimaryGenreName:[item objectForKey:@"primaryGenreName"]];
            [podcast setReleaseDate:     [item objectForKey:@"releaseDate"]];
            [podcast setTrackId:         [item objectForKey:@"trackId"]];
            [podcast setTrackName:       [item objectForKey:@"trackName"]];
            [podcast setTrackPrice:      [item objectForKey:@"trackPrice"]];
            
            [podcasts addObject:podcast];
        }
    }
    
    results = [[NSArray alloc]initWithObjects:ebooks, filmes, musicas, podcasts, nil];
    
    return results;
}

#pragma mark - Life Cycle

+ (id) allocWithZone:(NSZone *)zone
{
    return [self sharedInstance];
}

+ (id)copyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

+ (id)mutableCopyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

- (id)copy
{
    return [[iTunesManager alloc] init];
}

- (id)mutableCopy
{
    return [[iTunesManager alloc] init];
}

- (id) init
{
    if(SINGLETON){
        return SINGLETON;
    }
    if (isFirstAccess) {
        [self doesNotRecognizeSelector:_cmd];
    }
    self = [super init];
    return self;
}


@end
