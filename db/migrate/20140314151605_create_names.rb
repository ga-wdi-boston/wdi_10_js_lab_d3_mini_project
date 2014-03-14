class CreateNames < ActiveRecord::Migration
  def change
    create_table :names do |t|
      t.integer :birthyear
      t.text :gender
      t.text :ethnicity
      t.text :name
      t.integer :count
      t.integer :rank

      t.timestamps
    end
  end
end
