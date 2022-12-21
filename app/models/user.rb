class User < ApplicationRecord
  has_secure_password

  before_validation :downcase_nickname

  validates :email, presence: true, uniqueness: true,
            format: { with: /\A[\w]+@[\w]+.[\w]+.?[\w]+?\z/ }
  validates :nickname, length: { maximum: 40 }, uniqueness: true,
            format: { with: /\A\w+\z/ }
  validates :favorite_color, format: { with: /\A#[[:xdigit:]]{3}{1,2}\z/ }

  has_many :questions, dependent: :delete_all

  include Gravtastic
  gravtastic(secure: true, filetype: :png, size: 100, default: "retro")

  private

  def downcase_nickname
    nickname&.downcase!
  end
end
