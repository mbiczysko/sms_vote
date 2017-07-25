class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.date :epoch_time
      t.string :campaign
      t.string :validity
      t.string :choice
      t.string :conn
      t.integer :msisdn
      t.string :guid
      t.integer :short_code

      t.timestamps
    end
    add_index :votes, :campaign
    add_index :votes, :validity
    add_index :votes, :choice
  end
end
