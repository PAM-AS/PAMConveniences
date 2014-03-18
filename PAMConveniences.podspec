Pod::Spec.new do |s|
  s.name = 'PAMConveniences'
  s.version = '0.1.0'
  s.authors = {'Thomas Sunde Nielsen' => 'thomas@pam.as'}
  s.homepage = 'https://github.com/PAM-AS/PAMConveniences'
  s.summary = 'iOS convenience categories.'
  s.source = { :git => 'https://github.com/PAM-AS/PAMConveniences.git', :tag => "v#{s.version}" }

  s.platform = :ios, '6.0'
  s.requires_arc = true
  s.frameworks = 'UIKit', 'CoreGraphics'
  s.source_files = 'PAMConveniences/*.{h,m}'
end
