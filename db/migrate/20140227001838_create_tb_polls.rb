class CreateTbPolls < ActiveRecord::Migration
  def change
    create_table :tb_polls do |t|
      t.string :question
      t.integer :yes
      t.integer :no
      t.integer :author_id, default: 0, null: false
      t.integer :project_id, default: 0, null: false

      t.timestamps
    end
    add_index :tb_polls, :author_id
    add_index :tb_polls, :project_id
  end
end
