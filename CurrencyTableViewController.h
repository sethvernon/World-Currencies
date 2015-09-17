//
//  CurrencyTableViewController.h
//  CurrencyApp
//
//  Created by Seth Vernon on 1/28/14.
//  Copyright (c) 2014 Seth Vernon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CurrencyModel.h"

@interface CurrencyTableViewController : UITableViewController 
@property (nonatomic, strong)CurrencyModel *currencyModel;
@property (nonatomic)double usDollar;
@property (nonatomic)double price;

@end
