class AddPrivSnippetToSnippets < ActiveRecord::Migration
  def change
    add_column :snippets, :priv_snippet, :boolean, default: false
  end
end
