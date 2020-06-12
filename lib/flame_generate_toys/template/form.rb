# frozen_string_literal: true

module FlameGenerateToys
	class Template
		## Define toys for form generation
		class Form < Base
			on_expand do
				tool :form do
					desc 'Generate form'

					required_arg :name

					def run
						require_relative 'base_generator'

						generator = BaseGenerator.new(:form, name, @namespace)

						*modules, class_name = generator.camelized_name.split('::')

						generator.write(
							modules: modules,
							class_name: class_name,
							class_indentation: "\t" * modules.size,
							parent_form:
								model_forms.include?(class_name) ? class_name : 'Base'
						)
					end

					private

					using GorillaPatch::Inflections

					def model_forms
						Dir["#{context_directory}/forms/_model/*.rb"].map do |file|
							File.basename(file, '.rb').sub(/^_/, '').camelize
						end
					end
				end
			end
		end
	end
end
