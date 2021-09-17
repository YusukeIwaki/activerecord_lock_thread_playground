require 'json'
require 'sinatra/base'
require 'sinatra/activerecord'

class User < ActiveRecord::Base
end

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  set(:database, {
    adapter: 'mysql2',
    database: 'mydatabase',
    encoding: 'utf8mb4',
    pool: 5,
    username: 'root',
    password: 'password',
    host: '127.0.0.1',
  })

  get '/users' do
    users = User.all

    {
      users: users.map do |user|
        { id: user.id, name: user.name }
      end,
      count: users.count
    }.to_json
  end

  get '/users/:id' do
    user = User.find(params[:id])

    {
      user: { id: user.id, name: user.name }
    }.to_json
  end
end
