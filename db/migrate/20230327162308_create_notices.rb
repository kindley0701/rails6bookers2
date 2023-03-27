class CreateNotices < ActiveRecord::Migration[6.1]
  def change
    create_table :notices do |t|
      t.integer :group_id
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
