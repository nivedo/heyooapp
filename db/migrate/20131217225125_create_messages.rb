class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :group, index: true

      t.timestamps
    end
  end
end
