class Snippet < ActiveRecord::Base
  belongs_to :kind
  belongs_to :user

  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :work, presence: true
end
