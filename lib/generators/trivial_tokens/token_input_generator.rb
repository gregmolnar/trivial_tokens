
module TrivialTokens
  module Generators
    class TokenInputGenerator < Rails::Generators::Base
      desc 'Generate tokenInput javascript file'
      source_root File.expand_path('../templates', __FILE__)
      argument :model, type: :string
      argument :field, type: :string

      def create_tokeninput_file
        template 'tokenize_model_field.js',
                  "app/assets/javascripts/#{tokenize_model_field}.js"
      end

      def model_tokenized_field
        "#{model}_tokenized_#{tokens_index}"
      end

      def tokenize_model_field
        "tokenize_#{model}_#{tokens_index}"
      end

      def tokens_index
        field.pluralize
      end

    end
  end
end
