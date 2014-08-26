class CreatePops < ActiveRecord::Migration
  def change
    create_table :pops do |t|
      t.string "Wee"
    end
  end
end
