class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :birthday
      t.string :college
      t.string :hometown
      t.string :currently_live
      t.string :phone_number
      t.string :words_to_live_by
      t.string :about_me
    
      t.timestamps
    end
  end
end
