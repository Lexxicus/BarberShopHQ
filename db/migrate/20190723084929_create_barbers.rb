class CreateBarbers < ActiveRecord::Migration[5.2]
  def change
    create_table :barbers do |t|
      t.text :name

      t.timestamps
    end
    Barbers.create :name => 'Nikodim'
    Barbers.create :name => 'Iaropolk'
    Barbers.create :name => 'Agafon'
  end
end
