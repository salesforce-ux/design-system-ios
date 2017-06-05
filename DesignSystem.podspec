Pod::Spec.new do |s|
  s.name     = 'DesignSystem'
  s.version  = '3.0.7'
  s.summary  = 'Salesforce Lightning Design System iOS Integration'
  s.authors  = 'Salesforce.com and contributors'
  s.source   = { :git => 'https://github.com/salesforce-ux/design-system-ios.git', :tag => 'v3.0.6' }
  s.source_files = 'SalesforceDesignSystem/*', 'SalesforceDesignSystem/Generated/**/*'
  s.public_header_files = 'SalesforceDesignSystem/*.h', 'SalesforceDesignSystem/Generated/**/*.h'
  s.resource_bundle = { 'SalesforceDesignSystem' => 'SalesforceDesignSystem.bundle/**' }
  s.frameworks = 'UIKit', 'CoreText'
  s.requires_arc = true
  s.homepage = 'https://www.lightningdesignsystem.com'
  s.license = { :type => 'Salesforce.com Lightning Design System License', :file => 'LICENSE.txt' }
  s.platform = :ios, '8.0'
end
