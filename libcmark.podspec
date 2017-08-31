Pod::Spec.new do |s|
  s.name             = "libcmark"
  s.version          = "0.28.0"
  s.summary          = "A pedantic Markdown parser, written in C."
  s.homepage         = "https://github.com/jgm/cmark"
  s.license          = { :type => 'BSD', :file => 'COPYING' }
  s.author           = { "John MacFarlane" => "https://github.com/jgm" }
  s.source           = { :git => "https://github.com/jgm/cmark.git", :tag => s.version }
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.11"
  s.requires_arc = true
  s.source_files = 'src/*.{h,c,m,inc}', 'build/src/'
  s.public_header_files = 'src/cmark.h', 'build/src'
  s.exclude_files = 'src/main.c'
  s.compiler_flags = '-Wno-shorten-64-to-32'
  s.preserve_path = 'src/case_fold_switch.inc', 'src/entities.inc'
  s.prepare_command = "echo `pwd`\nsed -i '' 's/include <\\(cmark.*\\)>/include \"\\1\"/' src/cmark.h\nmkdir -p build; cd build && cmake -G Xcode .."
end