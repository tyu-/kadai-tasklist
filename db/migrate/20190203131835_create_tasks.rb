class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :taskname, null:false
      t.date :term
      t.boolean :finish, default: "false"

      t.timestamps
    end
  end
end
