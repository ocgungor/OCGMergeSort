Pod::Spec.new do |s|

  s.name         = "OCGMergeSort"
  s.version      = "0.0.1"
  s.summary      = "Merge Sort Algorithm in Objective-C"
  s.description  = "Homemade Merge Sort Algorithm for large data structures that require custom sorting."
  s.homepage     = "https://github.com/ocgungor/OCGMergeSort"
  s.license      = { :type => "Apache", :file => "LICENSE" }
  s.author             = "Oguzhan Gungor"
  s.source       = { :git => "https://github.com/ocgungor/OCGMergeSort.git", :commit => "b9361a864165870208c785f1465a9db8d6e94c04" }
  s.source_files  = "Classes", "OCGMergeSort/Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"
  s.requires_arc = true

end
