//
//  AXMasterViewController.m
//  AXTableKeyboardChainExample
//

#import "AXMasterViewController.h"
#import <AXTableKeyboardChain/AXTableKeyboardChain.h>
#import "AXTextFieldCell.h"

@interface AXMasterViewController ()<UITextFieldDelegate>

@end

@implementation AXMasterViewController

- (void)awakeFromNib
{
  [super awakeFromNib];
}

- (void)viewDidLoad
{
  [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (indexPath.section == 1 && indexPath.row == 2) {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    return cell;
  } else {
    AXTextFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AXTextFieldCell" forIndexPath:indexPath];
    [cell.textField setDelegate:self];
    return cell;
  }
}

#pragma mark - Text field delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
  // will be called when Keyboard will be shown.
  
  if (AXTableKeyboardChainGetNextField(self.tableView, textField)) {
    [textField setReturnKeyType:UIReturnKeyNext];
  } else {
    [textField setReturnKeyType:UIReturnKeyDefault];
  }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
  // will be called when return key is pressed.
  
  AXTableKeyboardChainGoToNext(self.tableView, textField);
  return YES;
}

@end
