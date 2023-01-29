module QuestionsHelper
  def question_author(question)
    if question.author
      link_to display_nickname(question.author), user_path(question.author)
    else
      content_tag :b, 'Неизвестный'
    end
  end
end
