# Lightning Design System Tokens + iOS

Winter ’17 tokens

iOS static library for [Salesforce Lightning Design System](https://www.lightningdesignsystem.com/) [Tokens](https://www.lightningdesignsystem.com/design-tokens/)


## Simple Install

Add to your Podfile:

```ruby

pod 'DesignSystem'

```

run

```
pod install
```

## Manual Submodule/Subproject Setup

See [more info](/manual_install_info)


## Objective-C Usage


### Examples


#### Colors

```objc

#import <DesignSystem/DesignSystem.h> 

...

UIColor* c = [UIColor sldsColorText:SLDSColorTextInverse];



```


#### Fonts and text sizes

```objc

#import <DesignSystem/DesignSystem.h> 

...

UIFont* f = [UIFont sldsFontLightWithSize:SLDSFontSizeXLarge];



```


#### Icons

##### Action Icons

```objc

#import <DesignSystem/DesignSystem.h> 

...

UIImage *icon = [UIImage sldsIconAction:SLDSIconActionNewCustom98 withSize:20.0f];

```


##### Custom Icons

```objc

#import <DesignSystem/DesignSystem.h> 

...

UIImage *icon = [UIImage sldsIconCustom:SLDSIconCustom1 withSize:20.0f];

```


##### Standard Icons

```objc

#import <DesignSystem/DesignSystem.h> 

...

UIImage *icon = [UIImage sldsIconStandard:SLDSIconStandardAccount withSize:20.0f];

```


##### Utility Icons

```objc

#import <DesignSystem/DesignSystem.h> 

...

UIImage *icon = [UIImage sldsIconUtility:SLDSIconUtility3dots withSize:20.0f];

```


## Swift Usage

### Setup

To use the SLDS library in Swift, create a bridging header:

```objc

#ifndef slds_bridging_header_h
#define slds_bridging_header_h

#import <SalesforceDesignSystem/SalesforceDesignSystemExtended.h>

#endif

```
  
1. Create slds-bridging-header.h.

2. In your build settings find the “Swift Compiler – Code Generation” section.

3. Next to “Objective-C Bridging Header” add the header file (e.g. slds-bridging-header.h).

SLDS extensions and constants are now accessible to all files in your project/workspace. There is no need to import the Design system to each file.


### Examples


#### Colors

```swift 

let textColor = UIColor.sldsColorText(.default)

let borderColor = UIColor.sldsColorBorder(.brand)

let backgroundColor = UIColor.sldsColorBackground(.brand)

```


#### Fonts and text sizes

```swift

label.font = UIFont.sldsFont(.bold, with: .medium)

```


#### Icons

##### Action Icons

```swift

let icon = UIImage.sldsIconAction(.addContact, withSize: SLDSSquareIconLarge)

let iconWithColor = UIImage.sldsIconAction(.addContact, with: UIColor.black, andBGColor: UIColor.white, andSize: SLDSSquareIconLarge)

```


##### Custom Icons

```swift

let icon = UIImage.sldsIconAction(.custom1, withSize: SLDSSquareIconLarge)

let iconWithColor = UIImage.sldsIconAction(.custom1, with: UIColor.black, andBGColor: UIColor.white, andSize: SLDSSquareIconLarge)

```


##### Standard Icons


```swift

let icon = UIImage.sldsIconAction(.account, withSize: SLDSSquareIconLarge)

let iconWithColor = UIImage.sldsIconAction(.account, with: UIColor.black, andBGColor: UIColor.white, andSize: SLDSSquareIconLarge)

```


##### Utility Icons


```swift

let icon = UIImage.sldsIconAction(.addContact, withSize: SLDSSquareIconLarge)

let iconWithColor = UIImage.sldsIconAction(.addContact, with: UIColor.black, andBGColor: UIColor.white, andSize: SLDSSquareIconLarge)

```


## Sample Code 

See [Demo App](/Demo) for sample code.



## Library Build (not required)
```
  $ npm install
  $ npm start
```

