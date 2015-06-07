module TrivialTokens
  module Tokenize
    extend ActiveSupport::Concern

    included do 
    end

    module ClassMethods
      def tokenize(relation)
        #relation is a symbol representing the relation to be tokenized
        self.send( :define_method, "tokenized_#{relation.to_s}" ) do 
          self.send(relation).to_a.join(',')
        end

        self.send( :define_method, "tokenized_#{relation.to_s}=" ) do |tokens|
          self.send("#{relation}=", tokens.split(',').map(&:to_i))
        end
      end
    end
  end
end

ActiveRecord::Base.send :include, TrivialTokens::Tokenize
