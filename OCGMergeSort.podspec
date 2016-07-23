Pod::Spec.new do |s|

  s.name         = "OCGMergeSort"
  s.version      = "0.0.1"
  s.summary      = "Homemade Merge Sort Algorithm for large data structures that require custom sorting"

  s.description  = "Homemade Merge Sort Algorithm for large data structures that require custom sorting"
                   

  s.homepage     = "https://github.com/ocgungor/OCGMergeSort"

  s.license      = { :type => "Apache", :file => "LICENSE" }



  s.author             = "Oguzhan Gungor"

  # s.platform     = :ios
  # s.platform     = :ios, "5.0"

  #  When using multiple platforms
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"


  s.source       = { :git => "https://github.com/ocgungor/OCGMergeSort.git", :commit => "8756c71c6bec312522c1924122b10ea516ae21d1" }


  s.source_files  = "Classes", "OCGMergeSort/Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"



  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"



  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
