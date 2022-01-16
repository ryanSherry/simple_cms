class ConvertPagesPermalinkToString < ActiveRecord::Migration[6.1]
  def change
      remove_index :pages, :permalink
      change_column :pages, :permalink, :text, index: false
  end
end
