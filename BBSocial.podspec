

Pod::Spec.new do |s|

  s.name         = "BBSocial"
  s.version      = "1.0.1"
  s.summary      = "BBSocial is an SDK for social"

  s.description  = <<-DESC
                        BBSocial 是一个用于分享,第三方登录的SDK，提供外部接口,依赖友盟分享。
                   DESC

  s.homepage     = "https://github.com/Djw2017/BBSocial"
 
  s.license      = {:type => "MIT",:file => "LICENSE"}

  s.author       = { "Dong JW" => "1971728089@qq.com" }
 
  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/Djw2017/BBSocial.git" }
  
  s.source_files  = "BBSocial/BBSocial.{h,m}", "BBSocial/BBSocialPlatformConfig.{h,m}", 
                    "BBSocial/BBSocialCommon.{h,m}","BBSocial/BBSocialResponse.{h,m}"

  s.subspec 'BBLogin' do |login|
    login.source_files = 'BBSocial/BBLogin/*.{h,m}'
    login.public_header_files = 'BBSocial/BBLogin/*.h'
    login.frameworks = 'UMSocialCore'
  end

  #s.subspec 'BBShare' do |share|
  #  share.source_files = 'BBSocial/BBShare/*.{h,m}'
  #  share.public_header_files = 'BBSocial/BBShare/*.h'
    
    #s.subspec 'BBShareUI' do |shareui|
    #shareui.source_files = 'BBSocial/BBShare/BBShareUI/*.{h,m}'
    #shareui.public_header_files = 'BBSocial/BBShareUI/BBShare/*.h'
    #shareui.frameworks = 'UShareUI'
    #end

  #end

  s.frameworks = "Foundation", "UIKit"
  s.requires_arc = true 
  
  #'ENABLE_STRICT_OBJC_MSGSEND' => 'NO'
  
  s.pod_target_xcconfig = {'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'}

  s.dependency 'UMengUShare/UI', '~> 6.4.3'
  s.dependency 'UMengUShare/Social/ReducedWeChat', '~> 6.4.3'
  s.dependency 'UMengUShare/Social/ReducedQQ', '~> 6.4.3'
  s.dependency 'UMengUShare/Social/ReducedSina', '~> 6.4.3'
  s.dependency 'Masonry', '~> 1.0.2'
  


end
