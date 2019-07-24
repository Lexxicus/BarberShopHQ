class CreateBarbers < ActiveRecord::Migration[5.2]
  def change
    create_table :barbers do |t|
      t.text :name

      t.timestamps
    end
    Barber.create :name => 'Nikodim'
    Barber.create :name => 'Iaropolk'
    Barber.create :name => 'Agafon'
  end
end
