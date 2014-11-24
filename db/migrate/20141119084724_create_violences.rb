class CreateViolences < ActiveRecord::Migration
  def change
    create_table :violences do |t|
      t.string  :event_record_number
      t.string  :event_title
      t.string  :geographic
      t.date    :initial_date
      t.date    :final_date
    end
  end
end
