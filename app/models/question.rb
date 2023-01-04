class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: "User", optional: true

  has_and_belongs_to_many :tags

  validates :body, presence: true, length: { maximum: 280 }

  after_create do
    question = Question.find_by(id: self.id)
    hashtags = self.body.scan(/#[a-zA-Z0-9А-Яа-я]+/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete("#"))
      question.tags << tag
    end
  end

  before_update do
    question = Question.find_by(id: self.id)
    question.tags.clear
    hashtags = self.body.scan(/#[a-zA-Z0-9А-Яа-я]+/) + self.answer.scan(/#[a-zA-Z0-9А-Яа-я]+/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete("#"))
      question.tags << tag
    end
  end
end
