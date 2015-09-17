//
//  CurrencyModel.m
//  CurrencyApp
//
//  Created by Seth Vernon on 1/26/14.
//  Copyright (c) 2014 Seth Vernon. All rights reserved.
//

#import "CurrencyModel.h"

@interface CurrencyModel()

@property (nonatomic, strong)NSMutableDictionary *jsonDictionary;

@end

@implementation CurrencyModel



- (NSMutableDictionary *)jsonDictionary
{
    if (!_jsonDictionary)
        _jsonDictionary = [[NSMutableDictionary alloc] init];
    return _jsonDictionary;
}



//// set the url and fetch the json data
- (void)getJSONData
{
    NSURL *nsURL = [NSURL URLWithString:@"http://finance.yahoo.com/webservice/v1/symbols/allcurrencies/quote?format=json"];
    NSData *jsonData = [NSData dataWithContentsOfURL:nsURL];
    self.jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData
                                                              options: NSJSONReadingMutableContainers // kNilOptions
                                                                error:nil];
    
    NSLog(@"JSON result: %@", self.jsonDictionary);

}



- (void)loadDataToArray
{
    [self getJSONData];
    
    self.currencyArray = [[self.jsonDictionary objectForKey:@"list"]objectForKey:@"resources"];
    
    NSLog(@"CurrencyArray: %@", self.currencyArray);

}


@end
