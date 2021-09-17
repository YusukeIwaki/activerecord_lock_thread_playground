require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'mysql2',
  database: 'mydatabase',
  encoding: 'utf8mb4',
  pool: 5,
  username: 'root',
  password: 'password',
  host: '127.0.0.1',
)

class CreateUser < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, index: { unique: true }, null: false
      t.timestamps
    end
  end
end

CreateUser.migrate(:down)
CreateUser.migrate(:up)
