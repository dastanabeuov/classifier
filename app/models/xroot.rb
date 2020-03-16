class Xroot < ApplicationRecord
  attr_accessor :name, :description, :synonym, :code, :version_date, :publish, :user_id

  belongs_to :user

  has_many :xcategories, dependent: :destroy
end
