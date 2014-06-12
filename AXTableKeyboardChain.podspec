
Pod::Spec.new do |s|
  s.name             = "AXTableKeyboardChain"
  s.version          = '0.1.0'
  s.summary          = "Super easy UITextField / UITextView chain in UITableViewCell by C-functions."
  s.description      = <<-DESC
                       Super easy UITextField / UITextView chain in UITableViewCell by C-functions.
                       It needs only one sentence.
                       DESC
  s.homepage         = "http://EXAMPLE/NAME"
  s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Hiroki Akiyama" => "aki-hiroki@nifty.com" }
  s.source           = { :git => "https://github.com/akiroom/AXTableKeyboardChain.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/akiroom'

  s.platform     = :ios, '5.0'
  s.ios.deployment_target = '5.0'
  s.requires_arc = true

  s.source_files = 'Classes'
end
