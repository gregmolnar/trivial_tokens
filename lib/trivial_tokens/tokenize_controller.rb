require_relative 'exceptions.rb'

module TrivialTokens
  module TokenizeController

    extend ActiveSupport::Concern


    module ClassMethods
      def tokenize

        self.send( :define_method, "token_query" ) do
          if self.token_params[:q].present?
            debugger
            model = self.controller_name.classify.constantize
            instance_variable_set(
              "@#{self.controller_name}",
              model.where("name like ?", "%#{self.token_params[:q]}%")
            )
            self.respond_to do |format|
              format.json { render json: self.instance_variable_get("@#{self.controller_name}")}
            end
          else
            yield
          end

        end

        self.send( :define_method, "token_params" ) do
          self.params.permit(:q)
        end

        self.send(:around_action, :token_query, { only: :index } )
      end
    end
  end
end

ActionController::Base.send :include, TrivialTokens::TokenizeController
