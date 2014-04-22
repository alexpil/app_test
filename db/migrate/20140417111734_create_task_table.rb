class CreateTaskTable < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
       t.integer :unique_id
       t.datetime :start_time
       t.datetime :stop_time
    end
  end
end
