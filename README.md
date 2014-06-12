# AXTableKeyboardChain

[![Version](https://img.shields.io/cocoapods/v/AXTableKeyboardChain.svg?style=flat)](http://cocoadocs.org/docsets/AXTableKeyboardChain)
[![License](https://img.shields.io/cocoapods/l/AXTableKeyboardChain.svg?style=flat)](http://cocoadocs.org/docsets/AXTableKeyboardChain)
[![Platform](https://img.shields.io/cocoapods/p/AXTableKeyboardChain.svg?style=flat)](http://cocoadocs.org/docsets/AXTableKeyboardChain)

![Screenshot](https://raw.githubusercontent.com/akiroom/AXTableKeyboardChain/master/screenshot.gif)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

You need to use only AXTableKeyboardChainGetNextField and AXTableKeyboardChainGoToNext

Example codes.

```objc
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Acceptable any text field cell
    AXTextFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AXTextFieldCell" forIndexPath:indexPath];
    [cell.textField setDelegate:self];
    return cell;
  }
}

#pragma mark - Text field delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
  // will be called when Keyboard will be shown.
  
  // ***THIS IS THE POINT***
  if (AXTableKeyboardChainGetNextField(self.tableView, textField)) {
    [textField setReturnKeyType:UIReturnKeyNext];
  } else {
    [textField setReturnKeyType:UIReturnKeyDefault];
  }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
  // will be called when return key is pressed.
  
  // ***THIS IS THE POINT***
  AXTableKeyboardChainGoToNext(self.tableView, textField);
  return YES;
}

```

## Installation

AXTableKeyboardChain is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "AXTableKeyboardChain"

## Author

Hiroki Akiyama, aki-hiroki@nifty.com

## License

AXTableKeyboardChain is available under the MIT license. See the LICENSE file for more info.

