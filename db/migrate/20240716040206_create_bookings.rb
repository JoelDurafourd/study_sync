class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.datetime :start_date
      t.datetime :end_date
<<<<<<< HEAD:db/migrate/20240713073640_create_bookings.rb
      t.integer :status, default: 0
      t.references :user, null: false, foreign_key: true
=======
      t.enum :status, enum_type: :boolean, default: false
      t.references :users, null: false, foreign_key: true
>>>>>>> 8688f4aeb05d75942f755432491f3bbd3cb56fbb:db/migrate/20240716040206_create_bookings.rb
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end
