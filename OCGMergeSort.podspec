Pod::Spec.new do |s|

  s.name         = "OCGMergeSort"
  s.version      = "0.0.1"
  s.summary      = "Homemade Merge Sort Algorithm for large data structures that require custom sorting"
  s.description  = "Homemade Merge Sort Algorithm for large data structures that require custom sorting"
  s.homepage     = "https://github.com/ocgungor/OCGMergeSort"
  s.license      = { :type => "Apache", :file => "LICENSE" }
  s.author             = "Oguzhan Gungor"
  s.source       = { :git => "https://github.com/ocgungor/OCGMergeSort.git", :commit => "8756c71c6bec312522c1924122b10ea516ae21d1" }
  s.source_files  = "Classes", "OCGMergeSort/Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"
  s.public_header_files = "Classes/**/*.h"
  s.requires_arc = true

end
