require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should have association with stock" do
    Stock.create(ticker: 'aoeu', name: 'aoeu', last_price: 123)
    assert Stock.first.users.kind_of?(ActiveRecord::Associations::CollectionProxy)
  end
end
