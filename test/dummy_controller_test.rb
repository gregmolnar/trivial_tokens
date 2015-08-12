require 'test_helper'

class DummyControllerTest < ActionController::TestCase
  tests Dummy::DummyController

  test 'it allows to set model name' do
    get :index, { format: :json, q: 'Foo' }
    assert_equal assigns(:tags), Tag.where('name like ?', "%Foo%")
  end
end
