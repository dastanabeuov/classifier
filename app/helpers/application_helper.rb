# frozen_string_literal: true

module ApplicationHelper
  def collection_cache_key_for(model)
    klass = model.to_s.capitalize.constantize
    count = klass.count
    max_updated_at = klass.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "#{model.to_s.pluralize}/collection-#{count}-#{max_updated_at}"
  end

  def current_year
    current_year ||= "© #{Time.current.year} "
    current_year
  end

  def github_url(author, repo)
    author_repo ||= "https://github.com/#{author}/#{repo}"
    author_repo
  end

  def flash_class(level)
    case level
    when 'notice'
      'alert-success'
    when 'alert'
      'alert-warning'
    when 'error'
      'alert-danger'
    end
  end

  def watch
    Time.current
  end

  def resource_name(resource)
    resource.class.name.underscore.to_s
  end

  def icon(icon, options = {})
    file = File.read("node_modules/bootstrap-icons/icons/#{icon}.svg")
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    if options[:class].present?
      svg['class'] += " " + options[:class]
    end
      doc.to_html.html_safe
  end
end
