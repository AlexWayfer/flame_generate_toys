# frozen_string_literal: true

require_relative 'lib/flame_generate_toys/version'

Gem::Specification.new do |spec|
	spec.name          = 'flame_generate_toys'
	spec.version       = FlameGenerateToys::VERSION
	spec.authors       = ['Alexander Popov']
	spec.email         = ['alex.wayfer@gmail.com']

	spec.summary       = 'Toys template to generate Flame application entities.'
	spec.description   = <<~DESC
		Toys template to generate Flame application entities.
	DESC
	spec.license = 'MIT'

	source_code_uri = 'https://github.com/AlexWayfer/flame_generate_toys'

	spec.homepage = source_code_uri

	spec.metadata['source_code_uri'] = source_code_uri

	spec.metadata['homepage_uri'] = spec.homepage

	spec.metadata['changelog_uri'] =
		'https://github.com/AlexWayfer/flame_generate_toys/blob/master/CHANGELOG.md'

	spec.files = Dir[
		'lib/**/*.{rb,erb}', 'README.md', 'LICENSE.txt', 'CHANGELOG.md'
	]

	spec.required_ruby_version = '>= 2.5'

	spec.add_runtime_dependency 'dry-inflector', '~> 0.2.0'
	spec.add_runtime_dependency 'formalism-model_forms', '~> 0.4.0'
	spec.add_runtime_dependency 'toys-core', '~> 0.10.0'

	spec.add_development_dependency 'pry-byebug', '~> 3.9'

	spec.add_development_dependency 'bundler', '~> 2.0'
	spec.add_development_dependency 'gem_toys', '~> 0.2.0'
	spec.add_development_dependency 'toys', '~> 0.10.4'

	spec.add_development_dependency 'codecov', '~> 0.2.0'
	spec.add_development_dependency 'rspec', '~> 3.9'
	spec.add_development_dependency 'simplecov', '~> 0.18.0'

	spec.add_development_dependency 'rubocop', '~> 0.87.0'
	spec.add_development_dependency 'rubocop-performance', '~> 1.0'
	spec.add_development_dependency 'rubocop-rspec', '~> 1.0'
end
