Pod::Spec.new do |s|
  s.name     = 'DesignSystem'
  s.version  = '2.0.7'
  s.summary  = "Salesforce Lightning Design System iOS Integration" 
  s.authors  = { 'Ivan Bogdanov' =>
                 'ibogdanov@salesforce.com' }
  s.source   = { :git => 'https://github.com/salesforce-ux/design-system-ios.git', :tag => 'v2.0.7' }
  s.source_files = 'SalesforceDesignSystem/*.{h,m}','SalesforceDesignSystem/Generated/*.{h,m}'
  s.public_header_files = 'SalesforceDesignSystem/*.h','SalesforceDesignSystem/Generated/*.h'
  s.resource_bundle = { 'SalesforceDesignSystem' => [ 'SalesforceDesignSystem.bundle/**' ] }
  s.frameworks = 'UIKit', 'CoreText'
  s.requires_arc = true
  s.homepage = "https://www.lightningdesignsystem.com/"
  s.license = { :type => "Salesforce.com Lightning Design System License", :file => "LICENSE" }
  s.platform = :ios, '6.0'
end
