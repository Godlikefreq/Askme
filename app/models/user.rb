class User < ApplicationRecord
  has_secure_password

  before_validation :downcase_nickname, :set_default_color

  validates :email, presence: true, uniqueness: true,
            format: { with: /\A[\w]+@[\w]+.[\w]+.?[\w]+?\z/ }
  validates :nickname, length: { maximum: 40 }, uniqueness: true,
            format: { with: /\A\w+\z/ }
  validates :favorite_color, format: { with: /\A#([[:xdigit:]]{3}){1,2}\z/ }

  has_many :questions

  def downcase_nickname
    nickname.downcase!
  end

  def set_default_color
    self.favorite_color ||= "#370617"
  end
end
