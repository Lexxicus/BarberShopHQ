class EnsureContactsTable < ActiveRecord::Migration[5.2]
  def up
    return if table_exists?(:contacts)

    create_table :contacts do |t|
      t.text :email
      t.text :message

      t.timestamps
    end
  end

  def down
    drop_table :contacts if table_exists?(:contacts)
  end
end
