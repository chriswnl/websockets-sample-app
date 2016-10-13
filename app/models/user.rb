class User < ApplicationRecord
  has_many :messages, dependent: :nullify
  has_many :chatrooms, through: :messages
  validates :name, presence: true, uniqueness: true
  
  def to_s
    name
  end
end
