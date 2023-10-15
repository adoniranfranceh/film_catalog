class AddColumnToFilm < ActiveRecord::Migration[6.1]
  def change
    add_column :films, :status, :integer, default: 0
  end
end
