class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname, :default_color

  validates :email, presence: true, uniqueness: true,
            format: { with: /\A[\w]+@[\w]+.[\w]+.?[\w]+?\z/ }
  validates :nickname, length: { maximum: 40 }, uniqueness: true,
            format: { with: /[\w]+/ }


  def downcase_nickname
    nickname.downcase!
  end

  def default_color
    self.favcolor ||= "#370617"
  end
end
