# Lightning Design System Tokens + iOS

Spring ’17 tokens

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

let textColor = UIColor.sldsTextColor(.colorTextDefault)

let borderColor = UIColor.sldsColorBorder(.colorBorderBrand)

let backgroundColor = UIColor.sldsColorBackground(.colorBackgroundBrand)

```


#### Fonts and text sizes

```swift

label.font = UIFont.sldsFont(.bold, with: .medium)

```


#### Icons

##### Action Icons

```swift

let icon = UIImage.sldsActionIcon(.addContact, withSize: SLDSSquareIconLarge)

let iconWithColor = UIImage.sldsActionIcon(.addContact, with: UIColor.black, andBGColor: UIColor.white, andSize: SLDSSquareIconLarge)

```


##### Custom Icons

```swift

let icon = UIImage.sldsActionIcon(.custom1, withSize: SLDSSquareIconLarge)

let iconWithColor = UIImage.sldsActionIcon(.custom1, with: UIColor.black, andBGColor: UIColor.white, andSize: SLDSSquareIconLarge)

```


##### Standard Icons


```swift

let icon = UIImage.sldsStandardIcon(.account, withSize: SLDSSquareIconLarge)

let iconWithColor = UIImage.sldsStandardIcon(.account, with: UIColor.black, andBGColor: UIColor.white, andSize: SLDSSquareIconLarge)

```


##### Utility Icons


```swift

let icon = UIImage.sldsUtilityIcon(.addContact, withSize: SLDSSquareIconLarge)

let iconWithColor = UIImage.sldsUtilityIcon(.addContact, with: UIColor.black, andBGColor: UIColor.white, andSize: SLDSSquareIconLarge)

```

## Objective-C Usage


### Examples


#### Colors

```objc

#import <DesignSystem/DesignSystem.h> 

...

UIColor* c = [UIColor sldsTextColor:SLDSColorTextInverse];



```


#### Fonts and text sizes

```objc

#import <DesignSystem/DesignSystem.h> 

...

UIFont* f = [UIFont sldsFont:SLDSFontRegular withSize:SLDSFontSizeXLarge];



```


#### Icons

##### Action Icons

```objc

#import <DesignSystem/DesignSystem.h> 

...

UIImage *icon = [UIImage sldsActionIcon:SLDSIconActionNewCustom98 withSize:20.0f];

```


##### Custom Icons

```objc

#import <DesignSystem/DesignSystem.h> 

...

UIImage *icon = [UIImage sldsCustomIcon:SLDSIconCustom1 withSize:20.0f];

```


##### Standard Icons

```objc

#import <DesignSystem/DesignSystem.h> 

...

UIImage *icon = [UIImage sldsStandardIcon:SLDSIconStandardAccount withSize:20.0f];

```


##### Utility Icons

```objc

#import <DesignSystem/DesignSystem.h> 

...

UIImage *icon = [UIImage sldsUtilityIcon:SLDSIconUtility3dots withSize:20.0f];

```


## Sample Code 

See [Demo App](/Demo) for sample code.



## Library Build (not required)
```
  $ npm install
  $ npm start
```

