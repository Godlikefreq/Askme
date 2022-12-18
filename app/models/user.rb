class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname, :set_default_color

  validates :email, presence: true, uniqueness: true,
            format: { with: /\A[\w]+@[\w]+.[\w]+.?[\w]+?\z/ }
  validates :nickname, length: { maximum: 40 }, uniqueness: true,
            format: { with: /[\w]+/ }


  def downcase_nickname
    nickname.downcase!
  end

  def set_default_color
    self.favorite_color ||= "#370617"
  end
end
