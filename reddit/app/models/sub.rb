# == Schema Information
#
# Table name: subs
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  user_id     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sub < ApplicationRecord

  validates :title, :description, :moderator, presence:true
  validates :title, uniqueness:true

  belongs_to :moderator,
    class_name: :User,
    foreign_key: :user_id

end
