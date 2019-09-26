class Group < ApplicationRecord
  has_many :users, through: :group_users
  has_many :group_users
  # 入力必須、被らないこと必須
  validates :name, presence: true, uniqueness: true
  accepts_nested_attributes_for :group_users
end
