require 'test_helper'

class TokenizeControllerTest < ActionController::TestCase
  tests Dummy::TagsController

  #test tokenization of controller
  test 'controller can be tokenized' do
    assert ApplicationController.respond_to? :tokenize
  end

  test 'tokenized controller provides token specific params' do
   assert @controller.respond_to?(:tag_params, true)
  end

  test 'tokenized controller provides token query method' do
    assert @controller.respond_to?(:token_query, true)
  end

end
