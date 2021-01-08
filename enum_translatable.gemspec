require_relative 'lib/enum_translatable/version'

Gem::Specification.new do |spec|
  spec.name          = "enum_translatable"
  spec.version       = EnumTranslatable::VERSION
  spec.authors       = ["mohamedmmahfouz"]
  spec.email         = ["mohamedmmahfouz24@gmail.com"]

  spec.summary       = %q{Gem for translating enums with i18n.}
  spec.description   = %q{ROR gem which to translate enums just like I18n Globalize gem}
  spec.homepage      = "https://github.com/MohamedMMahfouz/enum_translatable"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")


  spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "https://github.com/MohamedMMahfouz/enum_translatable"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_runtime_dependency "globalize"
end
