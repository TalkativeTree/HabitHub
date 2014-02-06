class CreateTagsAndUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.belongs_to :tag
      t.belongs_to :user
      t.text       :content
      t.text       :twilio_body
      t.string     :duration
      t.datetime   :start_time
      t.datetime   :end_time

      t.timestamps
    end

    create_table :tags do |t|
      t.string     :title

      t.timestamps
    end

    create_table :tags_updates do |t|
      t.belongs_to :tag
      t.belongs_to :update
    end
    add_index :updates, :user_id, name: "up_user_id_ix"
    add_index :updates, :tag_id, name: "up_tag_id_ix"

  end
end
