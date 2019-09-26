class Group < ApplicationRecord
  has_many :users, through: :group_users
  has_many :group_users
  has_many :messages
  # 入力必須、被らないこと必須
  validates :name, presence: true, uniqueness: true
  accepts_nested_attributes_for :group_users

  def show_last_message
    if (last_message = messages.last).present?
      last_message.body? ? last_message.body : "画像が投稿されています"
    else
      "まだメッセージはありません"
    end
  end

  def get_members
    members = []
    users.each do |user|
      members << user.name
    end
    members.join(",")
  end
  
end
