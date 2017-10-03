# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  url        :string
#  content    :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :author, :title, presence: true
  validates :subs, presence: { message: 'must have at least one sub' }
  has_many :subs, through: :post_subs, source: :sub

  belongs_to :author,
    class_name: 'User',
    foreign_key: 'user_id'

end
