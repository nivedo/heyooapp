class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.text :description
      t.string :title
      t.references :user, index: true

      t.timestamps
    end
  end
end
