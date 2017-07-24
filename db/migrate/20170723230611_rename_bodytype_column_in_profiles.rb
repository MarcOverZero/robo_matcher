class RenameBodytypeColumnInProfiles < ActiveRecord::Migration[5.1]
  def change
    rename_column :profiles, :bodytype, :body_type
  end
end
