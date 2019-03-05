class AddUserOrderRelation < ActiveRecord::Migration[5.2]
  change_table(:orders) do |t|
  t.belongs_to :user
end
end
