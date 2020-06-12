# frozen_string_literal: true

require 'gorilla_patch/inflections'

module FlameGenerateToys
	class Template
		## Class for common code of generation
		class BaseGenerator
			class << self
				def template(type)
					(@templates ||= {})[type] ||=
						ERB.new File.read "#{__dir__}/../#{type}/template.rb.erb"
				end
			end

			attr_reader :camelized_name

			using GorillaPatch::Inflections.from_dry_inflector

			def initialize(type, name, namespace)
				@template = self.class.template(type)

				@camelized_name = name.camelize

				@namespace = namespace

				@relative_file_path = "#{type.to_s.pluralize}/#{name}.rb"

				@file_path = "#{context_directory}/#{@relative_file_path}"
				return unless File.exist?(@file_path)

				raise ArgumentError, "File #{name} already exists"
			end

			def write(**locals)
				FileUtils.mkdir_p File.dirname @file_path
				File.write @file_path, @template.result_with_hash(
					camelized_name: camelized_name,
					**locals
				)

				puts "#{@relative_file_path} created"
			end
		end
	end
end
