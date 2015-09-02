## Manual Submodule/Subproject Setup

```
git init
git submodule add git@github.com:salesforce-ux/designsystem-ios.git
```

Step 1. in your App target Build Settings:
'Other Linker Flags' should have: -ObjC 

[![browser support](/readmeAssets/readme-image-other-linker-flags.png)](/readme-image-other-linker-flags.png)

Step 2. in App target Build Phases:
add SalesforceDesignSystem to 'Target Dependencies'

[![browser support](/readmeAssets/readme-image-target-dependency.png)](/readme-image-target-dependency.png)

Step 3. in App target Build Phases:
add SalesforceDesignSystem.a to 'Link Binary with Libraries' 

[![browser support](/readmeAssets/readme-image-link-binary.png)](/readme-image-link-binary.png)

Step 4. drag SalesforceDesignSystem.bundle from SalesforceDesignSystem.xcodeproj folder in the left panel to 'Copy Bundle Resources' section in Build Phases. Choose 'Create folder references' in the dialog window:

[![browser support](/readmeAssets/readme-image-drag-bundle.png)](/readmeAssets/readme-image-drag-bundle.png)




## Contact #

* ibogdanov@salesforce.com
