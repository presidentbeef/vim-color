Gem::Specification.new do |s|
  s.name = %q{vim-color}
  s.version = "0.0.1" 
  s.authors = ["Justin Collins"]
  s.summary = "Output Vim syntax highlighting in HTML format."
  s.description = "Just a little script to run Vim and get the HTML output with syntax highlighting."
  s.homepage = "http://brakemanscanner.org"
  s.files = ["bin/vim-color", "lib/vim-color.rb"]
  s.executables = ["vim-color"]
  s.add_dependency "nokogiri"
end
