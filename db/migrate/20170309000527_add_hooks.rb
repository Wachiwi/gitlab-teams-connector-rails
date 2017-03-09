class AddHooks < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_hooks, :id => :string do |t|
      t.string :target
      t.string :name
      t.text :description
      t.timestamps
    end
  end

  def down
    drop_table :admin_hooks
  end
end
