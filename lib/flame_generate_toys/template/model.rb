# frozen_string_literal: true

module FlameGenerateToys
	class Template
		## Define toys for form generation
		class Model < Base
			on_expand do
				tool :model do
					desc 'Generate model'

					required_arg :name

					def run
						require_relative 'base_generator'

						BaseGenerator.new(:model, name, @namespace).write
					end
				end
			end
		end
	end
end
