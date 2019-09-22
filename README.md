# CHatspace DB設計
## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|body|text|null: true|
|image|string||
|group-id|integer|null: true, foreign_key: true|
|user-id|integer|null: true, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|user-id|integer|foreign_key: true|

### Association
- has_many :users, through: :groups_users
- has_many :messages

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: true|
|name|string|null: false, index|
|email|string|null: false, unique: true, index|
|password|string|null: false|
|group-id|integer|foreign_key: true|

### Association
- has_many :groups, through: :groups_users
- has_many :messages

## groups_usersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group-id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user
