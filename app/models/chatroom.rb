class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages
  validates :topic, presence: true, uniqueness: true, case_sensitive: false
  validates :slug, presence: true, uniqueness: true
  
  before_validation :set_slug, if: :new_record?
  
  def to_param
    slug
  end
  
  private
  
  def set_slug
    self.slug = self.topic.try(:parameterize)
  end
end
