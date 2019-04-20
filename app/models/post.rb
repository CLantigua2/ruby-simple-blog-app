class Post < ApplicationRecord
    # this is saying that a post can have many comments
  has_many :comments
    validates :title, presence: true,
    length: {minimum: 5}

end
