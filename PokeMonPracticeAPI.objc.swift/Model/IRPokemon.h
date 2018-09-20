//
//  IRPokemon.h
//  PokeMonPracticeAPI.objc.swift
//
//  Created by Ivan Ramirez on 9/18/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IRPokemon : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, readonly) NSInteger weight;
@property (nonatomic, readonly) NSInteger identifer;
@property (nonatomic, copy, readonly) NSArray<NSString *> *abilities;
@property (nonatomic, copy, readonly) NSString *imageUrl;

-(instancetype)initWithName:(NSString *)name identifier:(NSInteger)identifier abilities:(NSArray<NSString *> *)abilities weight:(NSInteger)weight imageURL:(NSString *)imageURL;

@end

@interface IRPokemon(JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
