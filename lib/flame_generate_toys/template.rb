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

		on_expand do |template|
			tool :generate do
				require_relative 'template/_base'

				require_relative 'template/form'
				expand Template::Form, namespace: template.namespace

				require_relative 'template/model'
				expand Template::Model, namespace: template.namespace
			end

			alias_tool :gen, :generate
			alias_tool :g, :generate
		end
	end
end
