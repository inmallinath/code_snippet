class Kind < ActiveRecord::Base
  has_many :snippets, dependent: :nullify

  # Our coding languages need to exist (to produce the correct markdown syntax)
  # and should be unique
  validates :language, presence: true, uniqueness: { case_sensitive: false }
end
