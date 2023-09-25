class CreateInclusions < ActiveRecord::Migration[7.0]
  def change
    create_table :inclusions do |t|

      t.timestamps
    end
  end
end
