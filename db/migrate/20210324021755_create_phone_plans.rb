class CreatePhonePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :phone_plans do |t|
      t.string :name
      t.integer :free_time

      t.timestamps
    end
  end
end
