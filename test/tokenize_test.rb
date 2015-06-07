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
    assert_raise UntokenizableAssocationError do
      Article.tokenize :foo_diddly
    end
  end

  test 'an error is thrown if the specified relation is not has_many, or habtm' do 
    assert_raise UntokenizableAssociationError do
      Article.tokenize :author
    end
  end

  #test generated instance methods
  test 'tokenized_relation generated method returns comma delimited string of ids' do
    article = Article.new
    tag_1 = Tag.new
    tag_2 = Tag.new

    article.tags << tag_1
    article.tags << tag_2

    assert_equal "#{tag_1.id},#{tag_2.id}", article.tokenized_tags
  end

  test 'tokenized_relation= generated method allows assignment from comma delimited string of ids' do 
    article = Article.new
    tag_1 = Tag.new
    tag_2 = Tag.new

    article.tokenized_tags = "#{tag_1.id},#{tag_2.id}"
    
    assert_equal [tag_1, tag_2], article.tags
  end
end
