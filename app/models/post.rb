class Post < ApplicationRecord
    has_many :comments, class_name: "Comment", dependent: :destroy
    validates :title, presence: true, length: {minimum: 3, message: '3文字以上入力してください'}
    validates :body, presence: true
end
