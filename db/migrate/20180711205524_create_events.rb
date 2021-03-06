class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :event_name
      t.references :registered_application, foreign_key: true

      t.timestamps
    end
  end
end
