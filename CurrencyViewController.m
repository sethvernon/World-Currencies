//
//  CurrencyViewController.m
//  CurrencyApp
//
//  Created by Seth Vernon on 1/26/14.
//  Copyright (c) 2014 Seth Vernon. All rights reserved.
//

#import "CurrencyViewController.h"
#import "CurrencyTableViewController.h"

@interface CurrencyViewController ()


@property (nonatomic, strong) CurrencyModel *currencyModel;
@property (weak, nonatomic) IBOutlet UITextField *usDollar;


@end

@implementation CurrencyViewController


//// Lazily instantiate the Model ///
- (CurrencyModel *)currencyModel
{
    if (! _currencyModel )_currencyModel = [[CurrencyModel  alloc]init];
    return _currencyModel;
}

- (IBAction)USDollars:(id)sender
{
    
}



- (IBAction)getCurrency:(id)sender
{
    [self.currencyModel loadDataToArray];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"View Currency"])
    {
        CurrencyTableViewController *dest = segue.destinationViewController;
        dest.currencyModel = self.currencyModel;
        
        dest.usDollar = [self.usDollar.text doubleValue];
    }
}


@end
