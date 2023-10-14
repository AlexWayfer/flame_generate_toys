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

	github_uri = "https://github.com/AlexWayfer/#{spec.name}"

	spec.homepage = github_uri

	spec.metadata = {
		'bug_tracker_uri' => "#{github_uri}/issues",
		'changelog_uri' => "#{github_uri}/blob/v#{spec.version}/CHANGELOG.md",
		'documentation_uri' => "http://www.rubydoc.info/gems/#{spec.name}/#{spec.version}",
		'homepage_uri' => spec.homepage,
		'rubygems_mfa_required' => 'true',
		'source_code_uri' => github_uri,
		'wiki_uri' => "#{github_uri}/wiki"
	}

	spec.files = Dir[
		'lib/**/*.{rb,erb}', 'README.md', 'LICENSE.txt', 'CHANGELOG.md'
	]

	spec.required_ruby_version = '>= 2.7', '< 4'

	spec.add_runtime_dependency 'dry-inflector', '~> 1.0.0'
	spec.add_runtime_dependency 'formalism-model_forms', '~> 0.10.0'
	spec.add_runtime_dependency 'toys-core', '~> 0.15.0'
end
