class Contact < ActiveRecord::Base
  validates :email, :name, :user_id, presence: true
  validates :email, uniqueness: {scope: :user_id}
  validates :user_id, uniqueness:

  belongs_to(
    :owner,
    foreign_key: :user_id
    primary_key: :id,
    class_name: :User
  )

end
