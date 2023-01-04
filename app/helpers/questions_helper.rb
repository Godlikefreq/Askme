module QuestionsHelper
  def render_with_hashtags(body)
    body.gsub(/#[a-zA-Z0-9А-Яа-я]+/){ |word| link_to word, "/questions/hashtag/#{word.delete("#")}"}.html_safe
  end
end
