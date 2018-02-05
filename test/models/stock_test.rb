require 'test_helper'

class StockTest < ActiveSupport::TestCase
  test "should have association with user" do
    User.create(email: 'test@example.com',
                        password: 'password',
                        password_confirmation: 'password')
    assert User.first.stocks.kind_of?(ActiveRecord::Associations::CollectionProxy)
  end
end
