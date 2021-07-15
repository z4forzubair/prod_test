class ChangeCategoryToEnum < ActiveRecord::Migration[6.1]
  def change
    change_column :categories, :service, 'integer USING CAST(service AS integer)'
  end
end
