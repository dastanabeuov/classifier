module ApplicationHelper
  def collection_cache_key_for(model)
    klass = model.to_s.capitalize.constantize
    count = klass.count
    max_updated_at = klass.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "#{model.to_s.pluralize}/collection-#{count}-#{max_updated_at}"
  end

  def current_year
    "© #{Time.current.year} "
  end

  def github_url(author, repo)
    "https://github.com/#{ author }/#{ repo }"
  end

  def flash_class(level)
    case level
      when 'notice' then "alert alert-info alert-dismissible"
      when 'success' then "alert alert-success alert-dismissible"
      when 'alert' then "alert alert-warning alert-dismissible"
      when 'error' then "alert alert-danger alert-dismissible"
    end
  end

  def watch
    Time.current
  end

  def resource_name(resource)
    resource.class.name.underscore.to_s
  end
end
