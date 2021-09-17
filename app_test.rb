require 'active_record'
require 'minitest/autorun'
require 'net/http'
require_relative './setup_test_server'

class AppTest < Minitest::Test
  include SetupTestServer

  def setup
    @user_ids = 100.times.map do |i|
      User.create!(name: SecureRandom.hex(12)).id
    end
  end

  def teardown
    User.where(id: @user_ids).delete_all
  end

  def test_get_users
    resp = JSON.parse(Net::HTTP.get(URI("#{@server.base_url}/users")))
    assert_equal @user_ids.count, resp['count']
  end
end
