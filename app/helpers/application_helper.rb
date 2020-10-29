module ApplicationHelper
  def current_year
    Time.current.year
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
end
