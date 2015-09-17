//
//  CurrencyModel.h
//  CurrencyApp
//
//  Created by Seth Vernon on 1/26/14.
//  Copyright (c) 2014 Seth Vernon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CurrencyModel : NSObject

@property (nonatomic, strong)NSArray *symbolArray;
@property (nonatomic, strong)NSArray *currencyArray;

- (void)getJSONData;
- (void)loadDataToArray;


@end
