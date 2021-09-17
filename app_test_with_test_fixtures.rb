require 'active_record'
require 'minitest/autorun'
require 'net/http'
require_relative './setup_test_server'

class AppTestWithTestFixtures < Minitest::Test
  include SetupTestServer
  include ActiveRecord::TestFixtures

  def setup
    100.times { User.create!(name: SecureRandom.hex(12)) }
  end

  def test_get_users
    resp = JSON.parse(Net::HTTP.get(URI("#{@server.base_url}/users")))
    assert_equal 100, resp['count']
  end
end
