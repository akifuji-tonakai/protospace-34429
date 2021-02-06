# README

# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| name       | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| profile    | text   | null: false |
| occupation | text   | null: false |
| position   | text   | null: false |
- has_many :comments
- has_many :prototypes


## prototypes テーブル

| Column     | Type      | Options                       |
| ---------- | --------- | ----------------------------- |
| title      | string    | null: false                   |
| catch_copy | text      | null: false                   |
| concept    | text      | null: false                   |
| user       | reference | null:false, foreign_key: true |
- has_many :comments
- belongs_to :user


## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | string     |                                |
| user      | references | null: false, foreign_key: true |
| prototype | references | null: false, foreign_key: true |
- belongs_to user
- belongs_to prototypes