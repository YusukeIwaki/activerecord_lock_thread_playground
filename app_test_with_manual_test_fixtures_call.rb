require 'active_record'
require 'minitest/autorun'
require 'net/http'
require 'singleton'
require_relative './setup_test_server'

class MySetup
  include ActiveRecord::TestFixtures
  include Singleton

  def run_in_transaction?
    true
  end
end

class AppTestWithTestFixtures1 < Minitest::Test
  include SetupTestServer

  def setup
    User.delete_all
    MySetup.instance.setup_fixtures
    100.times { User.create!(name: SecureRandom.hex(12)) }
  end

  def test_get_users
    resp = JSON.parse(Net::HTTP.get(URI("#{@server.base_url}/users")))
    assert_equal 100, resp['count']
  end
end

class AppTestWithTestFixtures2 < Minitest::Test
  include SetupTestServer

  def setup
    100.times { User.create!(name: SecureRandom.hex(12)) }
  end

  def teardown
    MySetup.instance.teardown_fixtures
  end

  def test_get_users
    resp = JSON.parse(Net::HTTP.get(URI("#{@server.base_url}/users")))
    assert_equal 200, resp['count']
  end
end
