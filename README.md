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
- has_many :users
- has_many :messages

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|group-id|integer|foreign_key: true|

### Association
- has_many :groups
- has_many :messages

## groups_usersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group-id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user
