# アイデア管理API
カテゴリーに紐付けたアイデアの登録と、登録したアイデアの取得が可能

## APIドキュメント
Swaggerを使用（rswagを利用して作成）

http://localhost:3000/api-docs

## エンドポイント
- アイデア登録
POST /ideas
- アイデア取得
GET  /ideas

## リクエスト
- アイデア登録
category_name(カテゴリー名):string null: false
body(本文):string null: false

- アイデア取得
category_name(カテゴリー名):string

## 処理概要
- アイデア登録

リクエストのcategory_nameがcategoriesテーブルのnameに存在する場合、categoryのidをcategory_idとして、ideasテーブルに登録

リクエストのcategory_nameがcategoriesテーブルのnameに存在しない場合、新たなcategoryとしてcategoriesテーブルに登録し、ideasテーブルに登録

成功時　　HTTPステータスコード201を返す

失敗時　　HTTPステータスコード422を返す

- アイデア取得

category_nameが指定されている場合は該当するcategoryのideasの一覧を返却

category_nameが指定されていない場合は全てのideasを返却

登録されていないカテゴリーのリクエストの場合はステータスコード404を返す


# 使用技術
- Ruby 2.7.4
- Ruby on Rails 6.1.4
- MySQL
- RSpec
- rswag
- RuboCop
