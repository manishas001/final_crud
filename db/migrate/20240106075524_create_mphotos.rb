class CreateMphotos < ActiveRecord::Migration[7.1]
  def change
    create_table :mphotos do |t|
      t.string :image
      t.references :mblog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
