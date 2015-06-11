require_relative 'exceptions.rb'

module TrivialTokens
  module TokenizeController

    extend ActiveSupport::Concern


    module ClassMethods
      def tokenize

        self.send( :define_method, "token_query" ) do
          'foo'
        end

        self.send( :define_method, "token_params" ) do
          'foo'
        end

        self.around_action :token_query, only: :index
      end
    end
  end
end

ActionController::Base.send :include, TrivialTokens::TokenizeController
