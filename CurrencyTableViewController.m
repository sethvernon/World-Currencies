//
//  CurrencyTableViewController.m
//  CurrencyApp
//
//  Created by Seth Vernon on 1/28/14.
//  Copyright (c) 2014 Seth Vernon. All rights reserved.
//

#import "CurrencyTableViewController.h"


@interface CurrencyTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CurrencyTableViewController

- (CurrencyModel *)currencyModel
{
    if (!_currencyModel)_currencyModel = [[CurrencyModel alloc] init];
    return _currencyModel;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self reloadData];
    [self.tableView reloadData];
}

- (void)reloadData
{
   /// do something here to update the UI
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.currencyModel.currencyArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
        // Configure the cell...
        cell.textLabel.text = [[[self.currencyModel.currencyArray[indexPath.row] objectForKey:@"resource" ] objectForKey:@"fields"] objectForKey:@"name"] ;
      
        
        
        self.price = [[[[self.currencyModel.currencyArray[indexPath.row] objectForKey:@"resource" ] objectForKey:@"fields"] objectForKey:@"price"] doubleValue
                  ];
    
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"rate:%.2f   value: %.2f",self.price  ,self.price * self.usDollar] ;
    
    
    cell.detailTextLabel.textColor = [UIColor blackColor];
    cell.textLabel.textColor = [UIColor blueColor];
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    self.currencyModel = nil;
}

@end
