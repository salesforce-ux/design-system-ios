## Manual Submodule/Subproject Setup

```
git init
git submodule add git@github.com:salesforce-ux/design-system-ios.git
```

Step 1. in your App target Build Settings:
'Other Linker Flags' should have: -ObjC 

[![browser support](/manual_install_info/linkerFlag.png)](/manual_install_info/linkerFlag.png)

Step 2. in App target Build Phases:
add SalesforceDesignSystem to 'Target Dependencies'

[![browser support](/manual_install_info/targetDependency.png)](/manual_install_info/targetDependency.png)

Step 3. in App target Build Phases:
add SalesforceDesignSystem.a to 'Link Binary with Libraries' 

[![browser support](/manual_install_info/linkedLibrary.png)](/manual_install_info/linkedLibrary.png)

Step 4. drag SalesforceDesignSystem.bundle from SalesforceDesignSystem.xcodeproj folder in the left panel to 'Copy Bundle Resources' section in Build Phases. Choose 'Create folder references' in the dialog window:

[![browser support](/manual_install_info/bundleResourcepng)](/manual_install_info/bundleResource.png)


