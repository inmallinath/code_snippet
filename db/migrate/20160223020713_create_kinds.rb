class CreateKinds < ActiveRecord::Migration
  def change
    create_table :kinds do |t|
      t.references :snippet, index: true, foreign_key: true
      t.string :language

      t.timestamps null: false
    end
  end
end
