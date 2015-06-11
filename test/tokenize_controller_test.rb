require 'test_helper'

class TokenizeControllerTest < ActionController::TestCase
  tests Dummy::TagsController

  setup do
    Tag.create! name: 'FooTag', description: 'Tag for foos'
    Tag.create! name: 'BarTag', description: 'Tag for bars'
  end

  #test tokenization of controller
  test 'controller can be tokenized' do
    assert ApplicationController.respond_to? :tokenize
  end

  test 'tokenized controller provides token specific params' do
   assert @controller.respond_to?(:token_params, true)
  end

  test 'tokenized controller provides token query method' do
    assert @controller.respond_to?(:token_query, true)
  end

  test 'tokenized controller assigns instance variable' do
    get :index
    assert_not_nil assigns(:tags)
  end

  test 'tokenized controller responds normally to index without params' do
    get :index
    assert_equal Tag.all, assigns(:tags)
  end

  test 'tokenized controller filters based on q param if present' do
    get :index, { format: :json, q: 'Foo' }
    assert_equal assigns(:tags), Tag.where('name like ?', "%Foo%")
  end
end
