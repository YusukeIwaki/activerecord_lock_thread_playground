require 'rack/test_server'
require_relative './app'

module SetupTestServer
  def before_setup # :nodoc:
    @server = Rack::TestServer.new(
      app: App,
      server: :puma,
      Host: '127.0.0.1',
      Port: ARGV[0] || 3000,
    )

    @server.start_async
    @server.wait_for_ready
    super
  end

  def after_teardown # :nodoc:
    super
    @server.stop_async
    @server.wait_for_stopped
  end
end
