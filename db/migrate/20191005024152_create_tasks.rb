class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :contentname #タスク名称
      t.string :content #タスク詳細
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
