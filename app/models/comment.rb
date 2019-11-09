class Comment < ApplicationRecord
  belongs_to :post, class_name: "Post"
  validates :body, presence: true
end
