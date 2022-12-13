class Search < ApplicationRecord
  RESOURCES = %w[Xclass Property Activity User]

  def self.execute(query, resource = nil)
    if RESOURCES.include?(resource)
      model = resource.classify.constantize
      model.search query
    else
      ThinkingSphinx.search query
    end
  end
end