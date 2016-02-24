class RemoveSnippetFromKinds < ActiveRecord::Migration
  def change
    remove_reference :kinds, :snippet, index: true
  end
end
