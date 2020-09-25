# frozen_string_literal: true

module FlameGenerateToys
	class Template
		## Define toys for form generation
		class Form < Base
			on_expand do |template|
				tool :form do
					desc 'Generate form'

					include CommonGeneratorsCode

					required_arg :name

					to_run do
						generator = initialize_generator :form, template.namespace

						*modules, class_name = generator.camelized_name.split('::')

						generator.write(
							modules: modules,
							class_name: class_name,
							class_indentation: "\t" * modules.size,
							parent_form: parent_form(class_name)
						)
					end

					private

					def parent_form(class_name)
						require 'formalism/model_forms'

						Formalism::ModelForms.const_defined?(class_name, false) ? class_name : 'Base'
					end
				end
			end
		end
	end
end
