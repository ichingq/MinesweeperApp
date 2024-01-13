# app/helpers/application_helper.rb

module ApplicationHelper
  def display_error(record, attribute)
    if record.errors[attribute].any?
      content_tag(:div, record.errors[attribute].to_sentence, class: 'error-message')
    end
  end
end
