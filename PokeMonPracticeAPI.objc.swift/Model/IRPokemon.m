//
//  IRPokemon.m
//  PokeMonPracticeAPI.objc.swift
//
//  Created by Ivan Ramirez on 9/18/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

#import "IRPokemon.h"

@implementation IRPokemon

-(instancetype)initWithName:(NSString *)name identifier:(NSInteger)identifier abilities:(NSArray<NSString *> *)abilities weight:(NSInteger)weight imageURL:(NSString *)imageURL {
    self = [super init];
    
    if (self) {
        _name = name;
        _identifer = identifier;
        _abilities = abilities;
        _weight = weight;
        _imageUrl = imageURL;
    }
    return self;
}

@end

@implementation IRPokemon (JSONConvertable)

// ID is any
-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary
{
    //subscript dic and use the key to get the value of id
    NSInteger identifier = [dictionary[@"id"] integerValue];
    
    NSInteger weight = [dictionary[@"weight"] integerValue];
    
    NSString *name = dictionary[@"name"];
    
    NSArray *abilitiesDictionaries = dictionary[@"abilities"];
    
    //not sure if its NSURL
    //not sure if this should be titled sprites or imageURL or front_Default
    NSString *spritesDictionaries = dictionary[@"front_default"];
    
    if (![name isKindOfClass:[NSString class]] || ![abilitiesDictionaries isKindOfClass:[NSArray class]]) {
        return nil;
    }

    NSMutableArray<NSString *> *abilities = [[NSMutableArray alloc] init ];
    
    if (![name isKindOfClass:[NSString class]] || ![spritesDictionaries isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    NSMutableArray<NSString *> *imageURL = [[NSMutableArray alloc] init];
    
    //for loop to get into the nested dictioanry
    
    for (NSDictionary *dictionary in abilitiesDictionaries)
    {
        NSDictionary *nameDictionary = dictionary[@"ability"];
        NSString *abilityName = nameDictionary[@"name"];
        [abilities addObject:abilityName];
    }
    
    for (NSDictionary *dictionary in spritesDictionaries)
    {
        NSDictionary *frontDefaultDictionary = dictionary[@"sprites"];
        NSURL *spritesFrontDefault = [[NSURL alloc] initWithString: frontDefaultDictionary[@"front_default"]];
        [imageURL addObject: spritesFrontDefault];
    }

    return [self initWithName:name identifier:identifier abilities:abilities weight:weight imageURL:imageURL];
    
   // return [self initWithName:name identifier:identifier abilities:abilities weight:weight imageURL:_imageURL];
}
@end

