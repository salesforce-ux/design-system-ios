# Lightning Design System tokens, icons and fonts for iOS

iOS static library for [Salesforce Lightning Design System](https://www.lightningdesignsystem.com/) [Tokens](https://www.lightningdesignsystem.com/design-tokens/).

Current release: Spring ’17

## Simple Install

Install CocoaPods:

```ruby
$ sudo gem install cocoapods
```

Navigate to your iOS project directory and run:

```ruby
$ pod init
```

A `Podfile` will be created at the root of your project directory.

Add the following to your Podfile under `use_frameworks!`:

```ruby
pod 'DesignSystem'
```

run:

```
$ pod install
```

**A workspace for you project will be created (ending in .xcworkspace)**

Open this workspace file in xcode. Use this workspace for future builds.

**Update your search paths**

After opening the workspace go to YourProject->YourProjectTarget->Build Settings-> Header Search Paths, and remove everything but $(inherited) non-recursive.

## Manual Submodule/Subproject Setup

See [more info](https://github.com/salesforce-ux/design-system-ios/tree/master/manual_install_info)


## Sample Application 

See [Demo App](https://github.com/salesforce-ux/design-system-ios/tree/master/Demo-Swift) for a library browser and sample code.

## Swift Usage

### Setup

To use the SLDS library in Swift, create a bridging header:

```objc

#ifndef slds_bridging_header_h
#define slds_bridging_header_h

#import <DesignSystem/SalesforceDesignSystem.h>

#endif

```
  
1. Create `slds-bridging-header.h`.
2. In your build settings find the “Swift Compiler – General” section.
3. Next to “Objective-C Bridging Header” add the header file (e.g. `slds-bridging-header.h`).

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

#import <DesignSystem/SalesforceDesignSystem.h> 

...

UIColor* c = [UIColor sldsTextColor:SLDSColorTextInverse];



```


#### Fonts and text sizes

```objc

#import <DesignSystem/SalesforceDesignSystem.h> 

...

UIFont* f = [UIFont sldsFont:SLDSFontRegular withSize:SLDSFontSizeXLarge];



```


#### Icons

##### Action Icons

```objc

#import <DesignSystem/SalesforceDesignSystem.h> 

...

UIImage *icon = [UIImage sldsActionIcon:SLDSIconActionNewCustom98 withSize:20.0f];

```


##### Custom Icons

```objc

#import <DesignSystem/SalesforceDesignSystem.h> 

...

UIImage *icon = [UIImage sldsCustomIcon:SLDSIconCustom1 withSize:20.0f];

```


##### Standard Icons

```objc

#import <DesignSystem/SalesforceDesignSystem.h> 

...

UIImage *icon = [UIImage sldsStandardIcon:SLDSIconStandardAccount withSize:20.0f];

```


##### Utility Icons

```objc

#import <DesignSystem/SalesforceDesignSystem.h> 

...

UIImage *icon = [UIImage sldsUtilityIcon:SLDSIconUtility3dots withSize:20.0f];

```

## Library Build (not required)

```
$ npm install
$ npm start
```

## Licenses

* Source code is licensed under [BSD 3-Clause](https://git.io/sfdc-license)
* All icons and images are licensed under [Creative Commons Attribution-NoDerivatives 4.0](https://github.com/salesforce-ux/licenses/blob/master/LICENSE-icons-images.txt)
* The Salesforce Sans font is licensed under our [font license](https://github.com/salesforce-ux/licenses/blob/master/LICENSE-font.txt)
