# Lightning Design System Tokens + iOS

Winter ’17 tokens

iOS static library for [Salesforce Lightning Design System](https://www.lightningdesignsystem.com/) [Tokens](https://www.lightningdesignsystem.com/tokens/)


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


## Usage 


#### Colors

```objc

#import <DesignSystem/DesignSystem.h> 

...

UIColor* c = [UIColor sldsColorText:SLDSColorTextInverse];



```

[![browser support](/readmeAssets/readme-image1.png)](/readme-image1.png)


#### Fonts and text sizes

```objc

#import <DesignSystem/DesignSystem.h> 

...

UIFont* f = [UIFont sldsFontLightWithSize:SLDSFontSizeXLarge];



```

[![browser support](/readmeAssets/readme-image2.png)](/readme-image2.png)


#### Icons

##### Action Icons

```objc

#import <DesignSystem/DesignSystem.h> 

...

UIImage *icon = [UIImage sldsIconAction:SLDSIconActionNewCustom98 withSize:20.0f];

```

[![browser support](/readmeAssets/readme-icons-action.png)](/readmeAssets/readme-icons-action.png)

##### Custom Icons

```objc

#import <DesignSystem/DesignSystem.h> 

...

UIImage *icon = [UIImage sldsIconCustom:SLDSIconCustom1 withSize:20.0f];

```

[![browser support](/readmeAssets/readme-icons-custom.png)](/readmeAssets/readme-icons-custom.png)


##### Standard Icons

```objc

#import <DesignSystem/DesignSystem.h> 

...

UIImage *icon = [UIImage sldsIconStandard:SLDSIconStandardAccount withSize:20.0f];

```

[![browser support](/readmeAssets/readme-icons-standard.png)](/readmeAssets/readme-icons-standard.png)


##### Utility Icons

```objc

#import <DesignSystem/DesignSystem.h> 

...

UIImage *icon = [UIImage sldsIconUtility:SLDSIconUtility3dots withSize:20.0f];

```

[![browser support](/readmeAssets/readme-icons-utility.png)](/readmeAssets/readme-icons-utility.png)


## Sample Code 

See [Demo App](/Demo) for sample code:


[![browser support](/readmeAssets/readme-image.png)](/readme-image.png)



## Library Build (not required)
```
  $ npm install
  $ npm start
```

