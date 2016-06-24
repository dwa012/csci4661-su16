module ApplicationHelper

  def bs_link_to(body, url, html_options = {})
    html_options = {
      style: :default
    }.merge(html_options)

    link_to body, url, html_options.merge({ class: "btn btn-#{html_options[:style]}"})
  end

  def flash_class(level)
    case level.to_sym
      when :notice then "alert alert-info"
      when :success then "alert alert-success"
      when :error then "alert alert-danger"
      when :alert then "alert alert-warning"
    end
  end
end
