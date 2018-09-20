//
//  IRPokemonController.h
//  PokeMonPracticeAPI.objc.swift
//
//  Created by Ivan Ramirez on 9/19/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IRPokemon.h"

NS_ASSUME_NONNULL_BEGIN

@interface IRPokemonController : NSObject

+(void) fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^ _Nullable) (IRPokemon *_Nullable))completion;

@end

NS_ASSUME_NONNULL_END
