require_relative "lib/blog/version"

Gem::Specification.new do |spec|
  spec.name        = "blog"
  spec.version     = Blog::VERSION
  spec.authors     = [ "Yura" ]
  spec.email       = [ "yura.maksimov.04@mail.ru" ]
  spec.homepage    = ""
  spec.summary     = "Summary of Blog."
  spec.description = "Description of Blog."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.2.2.1"
end
