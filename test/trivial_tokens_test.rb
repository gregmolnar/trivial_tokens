require 'test_helper'

class TrivialTokensTest < ActiveSupport::TestCase
  test "trivial tokens is a module" do
    assert_kind_of Module, TrivialTokens
  end
end
