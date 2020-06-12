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
		end
	end
end
