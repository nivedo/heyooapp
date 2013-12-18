class AddMessageIdToContent < ActiveRecord::Migration
  def change
    add_reference :contents, :message, index: true
  end
end
