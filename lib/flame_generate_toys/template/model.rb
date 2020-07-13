# frozen_string_literal: true

module FlameGenerateToys
	class Template
		## Define toys for form generation
		class Model < Base
			on_expand do |template|
				tool :model do
					desc 'Generate model'

					include CommonGeneratorsCode

					required_arg :name

					to_run do
						initialize_generator(:model, template.namespace).write
					end
				end
			end
		end
	end
end
