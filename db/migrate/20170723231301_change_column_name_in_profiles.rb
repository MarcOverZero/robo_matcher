class ChangeColumnNameInProfiles < ActiveRecord::Migration[5.1]
  def change
    rename_column :profiles, :gender, :classification
  end
end
