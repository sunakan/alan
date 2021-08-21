# Alan

## 実行

```
$ make bash
```

## [Note] --minimalオプションでの違い

|アプリ|new時のオプション|
|:--|:--|
|app|--minimal -d postgresql|
|app-full|-d postgresql|

ファイルの中身が異なるファイル

- 除外
  - git系
  - アプリ名系
  - config/credentials.yml.enc
  - config/master.key
  - config/initializers/content_security_policy.rb
  - config/database.yml


```
$ diff -rq app app-full | grep -E "^Files " | cut -d' ' -f2 | grep -v README | grep -vE "git*" | sed -e 's/app\///g'
```

|ファイル|概要|
|:--|:----|
|Gemfile|fullの方がgemが増えてる|
|Gemfile.lock|同上|
|views/layouts/application.html.erb|turbolinks-trackの有無(fullが有)|
|bin/rails|springのloadの有無(fullが有)|
|bin/rake|springのloadの有無(fullが有)|
|bin/setup|js依存解決の有無(fullが有)|
|config/application.rb|rails gemシリーズのrequireが限定的になってるかどうか(fullはrails/all)|
|config/boot.rb|bootsnapのrequireの有無(fullが有)|
|config/environments/development.rb|active_storage,action_mailerの設定の有無(fullが有)|
|config/environments/production.rb|active_storage,action_mailerの設定の有無(fullが有)|
|config/environments/test.rb|active_storage,action_mailerの設定の有無(fullが有)|
|config/initializers/assets.rb|assetsのpathにnode_modulesの有無(fullが有)|

どっちにしか無いファイル

```
$ diff -rq app app-full | grep 'Only in' | sort
Only in app-full/app/javascript: channels
Only in app-full/app/javascript: packs
Only in app-full/app/views/layouts: mailer.html.erb
Only in app-full/app/views/layouts: mailer.text.erb
Only in app-full/app: channels
Only in app-full/app: jobs
Only in app-full/app: mailers
Only in app-full/bin: spring
Only in app-full/bin: yarn
Only in app-full/config: cable.yml
Only in app-full/config: spring.rb
Only in app-full/config: storage.yml
Only in app-full/test: application_system_test_case.rb
Only in app-full/test: channels
Only in app-full/test: mailers
Only in app-full/test: system
Only in app-full/tmp: storage
Only in app-full: package.json
Only in app-full: storage
Only in app/app/javascript: .keep
```

## [Note] -S -J -Tオプションでの違い

|アプリ|new時のオプション|
|:--|:--|
|app|--minimal -d postgresql|
|app-slim|--minimal -S -J -T -d postgresql|


```
$ diff -rq app app-slim | grep -E "^Files " | cut -d' ' -f2 | grep -v README | grep -vE "git*" | grep -v 'credentials.yml.enc' | grep -v 'master.key' | grep -v 'content_security_policy.rb' | grep -v 'database.yml' | grep -v 'application.html.erb' | sed -e 's/app\///g'
```

|ファイル|概要|
|:--|:----|
|Gemfile|sass-railsが消えてる(slimの方)|
|Gemfile.lock|同上|
|views/layouts/application.html.erb||
|config/application.rb|sprocketsとtestが消えてる(slimの方)|
|config/environments/development.rb|assetsの設定が消えてる(slimの方)|
|config/environments/production.rb|assetsの設定が消えてる(slimの方)|
