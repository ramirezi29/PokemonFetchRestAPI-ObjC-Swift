//
//  IRPokemonController.m
//  PokeMonPracticeAPI.objc.swift
//
//  Created by Ivan Ramirez on 9/19/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

#import "IRPokemonController.h"

@implementation IRPokemonController

static NSString * const baseURLString = @"https://pokeapi.co/api/v2";

+(void) fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^)(IRPokemon * _Nullable))completion
{
    //TWO Parts to every Fetch Func
    //1. Construct the URL
    NSURL *baseUrl = [[NSURL alloc] initWithString:baseURLString];
    NSURL *searchUrl = [[baseUrl URLByAppendingPathComponent:@"pokemon"] URLByAppendingPathComponent:[searchTerm lowercaseString]];
    
    NSLog(@"%@", [searchUrl absoluteString]);
    
    //2. DataTask, serilizat the data, complte and resume
    [[[NSURLSession sharedSession] dataTaskWithURL:searchUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
      {
          if (error){
              
              NSLog(@"there was an error in %s: %@, %@", __PRETTY_FUNCTION__, error,
                    error.localizedDescription);
              completion(nil);
              return;
          }
          //error handling
          NSLog(@"%@", response);
          if (!data) {
              NSLog(@"No data returned from Datatask");
              completion (nil);
              return;
          }

          // The happy path
          
          NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];

      if (! jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]])
      {
          NSLog(@"error parsing the Json: %@", error);
          completion(nil);
          return;
      }
          IRPokemon *pokemon = [[IRPokemon alloc] initWithDictionary:jsonDictionary];
          completion(pokemon);
          
      }]resume];
}
@end
