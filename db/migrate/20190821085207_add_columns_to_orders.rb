class AddColumnsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :stripe_session, :string
    add_column :orders, :stripe_payment_intent, :string
    add_column :basketlines, :ceramique_name, :string
    add_column :basketlines, :ceramique_qty, :int
    add_column :basketlines, :ceramique_id_on_order, :int
    add_monetize :basketlines, :basketline_price, currency: { present: false }
    add_column :ceramiques, :position, :integer
    add_column :orders, :method, :string
  end
end
