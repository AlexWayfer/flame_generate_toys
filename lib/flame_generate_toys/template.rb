# frozen_string_literal: true

require 'toys-core'

module FlameGenerateToys
	## Define toys for generation entities
	class Template
		include Toys::Template

		attr_reader :namespace

		def initialize(namespace:)
			@namespace = namespace
		end

		on_expand do
			tool :generate do
				require_relative 'template/form'
				expand Template::Form, namespace: namespace

				require_relative 'template/model'
				expand Template::Model, namespace: namespace
			end

			alias_tool :g, :generate
		end
	end
end
