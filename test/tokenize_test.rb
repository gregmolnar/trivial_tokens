require 'test_helper'

class TokenizeTest < ActiveSupport::TestCase

  #test tokenize class method
  test 'a tokenized relation on an object defines tokenized_... method' do
    article = Article.new
    assert article.respond_to? :tokenized_tags
  end

  test 'a tokenized relation on an object defines tokenized_...= method' do
    article = Article.new
    assert article.respond_to? :tokenized_tags=
  end

  test 'an error is thrown if the specified relation does not exist' do
    assert_raise TrivialTokens::Tokenize::UntokenizableAssociationError, 'Association foo_diddly not found!' do
      Article.tokenize :foo_diddly
    end
  end

  test 'an error is thrown if the specified relation is not has_many, or habtm' do 
    assert_raise TrivialTokens::Tokenize::UntokenizableAssociationError do
      #TODO: define author has_one association, test error message as well as raise
      #this passes because the same error is thrown for missing and incorrect assocs
      Article.tokenize :author
    end
  end

  #test generated instance methods
  test 'tokenized_relation generated method returns comma delimited string of ids' do
    article = Article.new
    tag_1 = Tag.create
    tag_2 = Tag.create

    article.tags << tag_1
    article.tags << tag_2

    assert_equal "#{tag_1.id},#{tag_2.id}", article.tokenized_tags
  end

  test 'tokenized_relation= generated method allows assignment from comma delimited string of ids' do 
    article = Article.new
    tag_1 = Tag.create
    tag_2 = Tag.create

    article.tokenized_tags = "#{tag_1.id},#{tag_2.id}"
    
    assert_equal [tag_1, tag_2], article.tags
  end
end
