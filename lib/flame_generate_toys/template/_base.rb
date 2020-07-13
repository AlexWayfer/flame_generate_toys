# frozen_string_literal: true

module FlameGenerateToys
	class Template
		## Base template for entities generation
		class Base
			include Toys::Template

			attr_reader :namespace

			def initialize(namespace:)
				@namespace = namespace
			end

			# private

			## Common code for generators
			module CommonGeneratorsCode
				def initialize_generator(type, namespace)
					require_relative 'generator'

					Generator.new(type, name, namespace, context_directory)
				end
			end

			private_constant :CommonGeneratorsCode
		end
	end
end
