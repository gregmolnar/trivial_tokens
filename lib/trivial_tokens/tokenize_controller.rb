require_relative 'exceptions.rb'

module TrivialTokens
  module TokenizeController

    extend ActiveSupport::Concern


    module ClassMethods
      def tokenize(model = nil)
        self.send( :define_method, "token_query" ) do |&block|
          if self.token_params[:q].present?
            model ||= self.controller_name.classify.constantize
            variable_name = (model) ? "@#{model.to_s.demodulize.pluralize.downcase}" : "@#{self.controller_name}"
            instance_variable_set(
              variable_name,
              model.where("name like ?", "%#{self.token_params[:q]}%")
            )
            self.respond_to do |format|
              format.json { render json: self.instance_variable_get(variable_name)}
            end
          else
            block.call
          end

        end

        private :token_query

        self.send( :define_method, "token_params" ) do
          self.params.permit(:q)
        end

        self.send(:around_action, :token_query, { only: :index } )
      end
    end
  end
end

ActionController::Base.send :include, TrivialTokens::TokenizeController
