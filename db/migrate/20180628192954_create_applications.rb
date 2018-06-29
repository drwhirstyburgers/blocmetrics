class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :applications do |t|
      t.string :registration
      t.string :app_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
