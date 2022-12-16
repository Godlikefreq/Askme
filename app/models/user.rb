class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  validates :email, presence: true, uniqueness: true,
            format: { with: /\A[\w]+@[\w]+.[\w]+.?[\w]+?\z/, message: "- введен некорректно" }
  validates :nickname, length: { maximum: 40 }, uniqueness: true,
            format: { with: /\A[\w]+\z/, message: "- допустимы только латинские буквы, цифры, и знак _" }


  def downcase_nickname
    nickname.downcase!
  end
end
