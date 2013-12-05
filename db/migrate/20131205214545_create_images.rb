class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :content, index: true
      t.string :attachment

      t.timestamps
    end
  end
end
