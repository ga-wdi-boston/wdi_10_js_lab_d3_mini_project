class CreateAssistances < ActiveRecord::Migration
  def change
    create_table :assistances do |t|
      t.references :country, index: true
      t.text :program
      t.text :assist_type
      t.integer :year
      t.column :amount, :bigint

      t.timestamps
    end
  end
end
