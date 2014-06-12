//
//  AXTableKeyboardChain.m
//  Pods
//

#import "AXTableKeyboardChain.h"

UIView * AXTableKeyboardChainGetNextField(UITableView *tableView, UIView *field)
{
  // Search responder's superview cell.
  BOOL failed = NO;
  UITableViewCell *cell = (id)field;
  while ([cell isKindOfClass:[UITableViewCell class]] == NO) {
    cell = (id)cell.superview;
    if (!cell) {
      failed = YES;
      break;
    }
  }
  if (failed) {
    return nil;
  }
  
  // Get next cell.
  NSIndexPath *indexPath = [tableView indexPathForCell:cell];
//  NSInteger section = indexPath.section;
//  NSInteger row = indexPath.row;
//  
//  NSIndexPath *nextIndexPath;
//  
//  
//  
//  NSInteger numberOfRow = [tableView numberOfRowsInSection:indexPath.section];
//  
//  
//  NSInteger numberOfSection = [tableView numberOfSections];
  
  NSIndexPath *nextRowPath = [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:indexPath.section];
  NSIndexPath *nextSectionPath = [NSIndexPath indexPathForRow:0 inSection:indexPath.section + 1];
  UITableViewCell *nextCell = [tableView cellForRowAtIndexPath:nextRowPath];
  if (!nextCell) {
    nextCell = [tableView cellForRowAtIndexPath:nextSectionPath];
  }
  if (!nextCell) {
    return nil;
  }
  
  // Check accessory view.
  UIView *accessoryView = nextCell.accessoryView;
  if ([accessoryView canBecomeFirstResponder]) {
    return accessoryView;
  }
  
  // Check subview in content view.
  for (UIView *subview in [nextCell.contentView subviews]) {
    if ([subview canBecomeFirstResponder]) {
      return subview;
    }
  }
  
  // Not found.
  return nil;
}

BOOL AXTableKeyboardChainGoToNext(UITableView *tableView, UIView *field)
{
  UIView *nextField = AXTableKeyboardChainGetNextField(tableView, field);
  if (nextField) {
    [nextField becomeFirstResponder];
    return YES;
  } else {
    [field resignFirstResponder];
    return NO;
  }
}
