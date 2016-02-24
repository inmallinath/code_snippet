class User < ActiveRecord::Base
  has_many :snippets, dependent: :nullify

  validates :password_digest, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  has_secure_password

  def full_name
    "#{first_name} #{last_name}".titleize
  end

end
