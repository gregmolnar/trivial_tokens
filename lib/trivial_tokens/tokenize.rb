module TrivialTokens
  module Tokenize

    class UntokenizableAssociationError < StandardError; end

    extend ActiveSupport::Concern

    included do 
    end

    module ClassMethods
      def tokenize(relation)

        reflection = self.reflect_on_association(relation)

        if !reflection
          raise TrivialTokens::Tokenize::UntokenizableAssociationError, "association #{relation} not found!"
        elsif !(reflection.macro == :has_many || reflection.macro == :has_and_belongs_to_many)
          raise TrivialTokens::Tokenize::UntokenizableAssociationError,
                "Expected assocation #{relation} to be of has_many or has_and_belongs_to_many, was #{reflection.macro}" 
        end

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
