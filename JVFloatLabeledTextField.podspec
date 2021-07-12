Pod::Spec.new do |s|
  s.name         = "JVFloatLabeledTextField"
  s.version      = "1.2.5"
  s.summary      = "The original UITextField subclass implementing the Float Label Pattern."
  s.homepage     = "http://github.com/jverdi/JVFloatLabeledTextField"
  s.screenshot   = "https://github-camo.global.ssl.fastly.net/be57d040ec0ce5d6467fb73564c6bcb6c76d5a7b/687474703a2f2f6472696262626c652e73332e616d617a6f6e6177732e636f6d2f75736572732f363431302f73637265656e73686f74732f313235343433392f666f726d2d616e696d6174696f6e2d5f6769665f2e676966"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Jared Verdi" => "jared@jaredverdi.com" }
  s.source       = { :git => "https://github.com/jverdi/JVFloatLabeledTextField.git", :tag => s.version.to_s }
  s.platform     = :ios
  s.source_files = 'JVFloatLabeledTextField/JVFloatLabeledTextField/*.{h,m}'
  s.frameworks   = 'Foundation', 'UIKit'
  s.requires_arc = true
end
