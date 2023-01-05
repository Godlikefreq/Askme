class Question < ApplicationRecord
  after_commit :save_hashtags, on: %i[ create update ]

  belongs_to :user
  belongs_to :author, class_name: "User", optional: true

  has_many :questions_tags, dependent: :destroy
  has_many :tags, through: :questions_tags

  validates :body, presence: true, length: { maximum: 280 }

  def save_hashtags
    tags.clear
    hashtags = body.scan(Tag::REGEX) + answer.scan(Tag::REGEX)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete("#"))
      tags << tag
    end
  end
end
