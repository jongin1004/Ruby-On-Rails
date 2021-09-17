class Comment < ApplicationRecord
  belongs_to :video  
  # validates :name, presence: true
  validates :body, presence: true
end
