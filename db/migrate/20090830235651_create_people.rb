class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :name
      t.string :picture_file_name
      t.string :picture_content_type
      t.string :picture_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
