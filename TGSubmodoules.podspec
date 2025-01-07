#
#  Be sure to run `pod spec lint TGSubmodoules.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = "TGSubmodoules"
  spec.version      = "1.0.1"
  spec.summary      = "Submodoules"

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  spec.description  = "submodoules for tg"

  spec.homepage     = "https://github.com/yintao910816/TGSubmodoules"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See https://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  #spec.license      = "MIT (example)"
  spec.license      = { :type => "MIT", :file => "LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  spec.author             = { "slsyswift" => "mlsy.swift@gmail.com" }
  # Or just: spec.author    = "slsyswift"
  # spec.authors            = { "slsyswift" => "mlsy.swift@gmail.com" }
  # spec.social_media_url   = "https://twitter.com/slsyswift"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  spec.platform     = :ios
  spec.platform     = :ios, "12.0"

  #  When using multiple platforms
  # spec.ios.deployment_target = "5.0"
  # spec.osx.deployment_target = "10.7"
  # spec.watchos.deployment_target = "2.0"
  # spec.tvos.deployment_target = "9.0"
  # spec.visionos.deployment_target = "1.0"

  spec.swift_versions   = '5.0'

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  spec.source       = { :git => "https://github.com/yintao910816/TGSubmodoules.git", :tag => "#{spec.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  # 这里的导入，需要pod中设置为 pod 'TGSubmodoules', :path => '../'，才会将主模块代码编译进去，单子模块会报错
  spec.source_files  = "Classes/TGSubmodoules.h"
  #spec.exclude_files = "Classes/Exclude"
  spec.public_header_files = "Classes/TGSubmodoules.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

    spec.subspec 'AsyncDisplayKit' do |ss|
    #单子模块引用需要把TGSubmodoules.h文件加进来
#    ss.source_files = ['Classes/AsyncDisplayKit/**/*.{h,m,mm}', "Classes/TGSubmodoules.h"]
#    ss.public_header_files = ['Classes/AsyncDisplayKit/PublicHeaders/*.h', "Classes/TGSubmodoules.h"]
    ss.source_files = 'Classes/AsyncDisplayKit/**/*.{h,m,mm}'
    ss.public_header_files = 'Classes/AsyncDisplayKit/PublicHeaders/*.h'
    ss.frameworks = "CoreGraphics", "CoreText", "CoreMedia", "QuartzCore", "UIKit", "Foundation"
    # 为子模块单独设置 C++ 编译标志
    ss.pod_target_xcconfig = {
      'OTHER_CPLUSPLUSFLAGS' => '-DMINIMAL_ASDK'
    }
  end

  spec.subspec 'PresentationData' do |ss|
    ss.source_files = 'Classes/PresentationData/*.swift'
  end
  
  spec.subspec 'MurMurHash32' do |ss|
    ss.source_files = 'Classes/MurMurHash32/**/*.{h,m}'
    ss.public_header_files = 'Classes/MurMurHash32/PublicHeaders/*.h'
  end

  spec.subspec 'ObjCRuntimeUtils' do |ss|
    ss.source_files = 'Classes/ObjCRuntimeUtils/**/*.{h,m}'
    ss.public_header_files = 'Classes/ObjCRuntimeUtils/PublicHeaders/*.h'
    ss.frameworks = "UIKit", "Foundation"
  end

  spec.subspec 'UIKitRuntimeUtils' do |ss|
    ss.source_files = 'Classes/UIKitRuntimeUtils/**/*.{h,m}'
    ss.public_header_files = 'Classes/UIKitRuntimeUtils/PublicHeaders/*.h'
    ss.frameworks = "UIKit", "Foundation"
    ss.dependency 'TGSubmodoules/AsyncDisplayKit'
    ss.dependency 'TGSubmodoules/ObjCRuntimeUtils'
  end

  spec.subspec 'Markdown' do |ss|
    ss.source_files = 'Classes/Markdown/*.swift'
  end

  spec.subspec 'Display' do |ss|
    ss.source_files = 'Classes/Display/**/*.swift'
    ss.dependency 'TGSubmodoules/AsyncDisplayKit'
    ss.dependency 'TGSubmodoules/ObjCRuntimeUtils'
    ss.dependency 'TGSubmodoules/UIKitRuntimeUtils'
    ss.dependency 'TGSubmodoules/Markdown'
    ss.dependency 'TGSwiftSignalKit', '~> 1.0.1'
  end

end
