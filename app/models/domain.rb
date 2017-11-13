class Domain < ApplicationRecord
  include ActionView::Helpers::SanitizeHelper
  
  has_many :deity_domains
  has_many :deities, through: :deity_domains
  
  before_validation :sanitize_name

  def sanitize_name
    self.name = strip_tags(name)
  end
end
