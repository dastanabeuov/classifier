class Xclass < ApplicationRecord
  has_ancestry
  #attr_accessor :name, :description, :synonym, :code, :version_date, :publish, :user_id
  belongs_to :user
  belongs_to :xcategory
end
