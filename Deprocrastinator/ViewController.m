//
//  ViewController.m
//  Deprocrastinator
//
//  Created by AE on 5/19/14.
//  Copyright (c) 2014 Aaron Eckhart. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *textFieldInput;
@property NSString *textFromAddButtonPushed;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) NSMutableArray *inputArray;
@property BOOL buttonOnEdit;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.inputArray = [NSMutableArray arrayWithObjects:@"Go home", @"Fill gut", @"ruyt", @"jgi", nil];

    self.buttonOnEdit = YES;
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.inputArray.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    cell.textLabel.text = [self.inputArray objectAtIndex:indexPath.row];

    NSLog(@"working");



    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.buttonOnEdit == YES) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.textLabel.textColor = [UIColor greenColor];
        NSLog(@"row selected");

    }

        else {
                [self.inputArray removeObjectAtIndex:indexPath.row];
        }
    [self.myTableView reloadData];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor whiteColor]];
    NSLog(@"row selected");
    [self.myTableView reloadData];





}





- (IBAction)onAddButtonPressed:(id)sender
{
    [self.inputArray addObject:self.textFieldInput.text];
    NSLog(@"%@", [self.inputArray objectAtIndex:0]);


    [self.myTableView reloadData];

    self.textFieldInput.text = nil;


}
- (IBAction)onEditButtonPushed:(UIButton *)sender
{
    if (self.buttonOnEdit == YES) {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        self.buttonOnEdit = !self.buttonOnEdit;
    } else {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        self.buttonOnEdit = !self.buttonOnEdit;

    }



}



@end
