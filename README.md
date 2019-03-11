# README

## Craftsman-pf-backend
職人PFのバックエンド(API)サーバです

## 環境
 - Rails 5.2.2
 - Ruby 2.6.1
 - MySQL 5.5.54

## 動かし方

```shell
 $ bundle install --path vendor/bundle
 $ budnle exec rails db:create
 $ budnle exec rails db:migrate
 $ budnle exec rale db:prepare_data
 $ budnle exec rails s -b 0.0.0.0
```

## ユニットテスト
```
 $ budnle exec rspec
```

