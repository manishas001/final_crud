class CreateMblogs < ActiveRecord::Migration[7.1]
  def change
    create_table :mblogs do |t|
      t.string :name
      t.string :title
      t.text :description
      t.references :owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
