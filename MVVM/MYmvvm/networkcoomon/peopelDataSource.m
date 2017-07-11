
//
//  peopelDataSource.m
//  networkcoomon
//
//  Created by Nirav Zalavadia on 11/07/17.
//  Copyright © 2017 CNSoftNet. All rights reserved.
//

#import "peopelDataSource.h"


@implementation peopelDataSource

@synthesize pVModel,pModel;

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [pVModel.peopleArr count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    pModel=[pVModel.peopleArr objectAtIndex:indexPath.row];
    cell.textLabel.text=pModel.name;
    return cell;
}

@end
