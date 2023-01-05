class Tag < ApplicationRecord
  has_many :questions_tags, dependent: :destroy
  has_many :questions, through: :questions_tags

  REGEX = /#[\wА-Яа-я]+/
end
