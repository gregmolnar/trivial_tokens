
module TrivialTokens
  module Generators
    class TokenInputGenerator < Rails::Generators::Base
    desc 'hayyyy'

      def create_tokeninput_file
      
      token_field = "MODEL_FIELD"
      create_file "app/assets/javascripts/tokenize_#{token_field}.js", "LA LA MODEL FIELD"
      end
    end
  end
end
