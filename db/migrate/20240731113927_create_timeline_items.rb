class CreateTimelineItems < ActiveRecord::Migration[7.1]
  def change
    create_table :timeline_items do |t|
      t.references :timelineable, null: false, polymorphic: true
      t.references :user, null: false, foreign_key: true
      t.string :action
      t.jsonb :data, default: {}

      t.timestamps
    end
  end
end
