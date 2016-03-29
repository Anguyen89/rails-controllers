class User < ActiveRecord::Base
  validates :name,:email, presence: true
  validates :email, uniqueness: true
  # validates :username, presence: true, uniqueness: true
  has_many(
    :contacts,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :Contact
  )

end
