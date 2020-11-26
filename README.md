# アプリケーション名
 ### Chater Trader

## 概要
  チャーター便のオークションサイト

## URL
  http://www.charter-trader.com/
## テスト用アカウント
  ユーザー1：tanaka@gmail.com  Tanaka111  
  ユーザー2：nakata@gmail.com  
           Nakata111  
## 制作背景
  前職でキッチンやユニットバスを現場に手配する仕事に携わっていました。
  場所的に九州の辺境の場所だったりすることもあり、そこまでチャーターを手配してくれる業者が少な買ったこと、
  業者がいても価格が合わなくて手配が厳しかったりするなどといった状況がありました。
  オークション形式でチャーター便を発注することで、業者の参加を多くしよりチャーターの価格を適正価格に近づけることができるのではないかと思った点と、チャーターの一覧を表示させ、価格提示できる機会を設けることにより、運送会社側のビジネスチャンスが増えるのではないかと考えこのアプリケーションを作成しました。
  今回のアプリケーションの想定されるユーザーは3PLを行っている運送会社です。これらの企業は参加に多くの運送会社を抱えていると聞いていたので、3PLの企業に提供することで、多くの業者がチャーターの取引に参加できるのではないかと思っています。
  このサービスが業者間でうまくいく運用できるようになれば、エンドユーザーに対しても、例えば引越しの際に利用してもらえるのではないかとも考えています。
## 主な利用シーン
  大型の荷物を特定の住所へ直接手配する際に利用する。
  【発注者】
    取引先からチャーターの注文をもらい発注を行う。
  【入札側】
    発注者からきた価格に対して価格を提示する
  【発注者】
    入札者からの提示された金額で問題なければ購入する

## 機能一覧
  ユーザー管理機能
  チャーター便発注機能(チャーター便削除可能、編集可能)
  チャーター便入札機能(価格削除可能、編集不可)
  ユーザー確認ページ
  チャーター便購入機能
  チャーター便検索機能
## 環境・使用技術  
  ### フロントエンド  
    - HTML, CSS, JavaScript, jQuery
  ### バックエンド
    - Ruby 2.6.5
    - Rails 6.0.3

  ### 開発環境
    -MySQL2
  ### 本番環境
    AWS(EC2, Route53)
    Mariadb
    Nginx
    Capistrano

  ### テスト
    Rspec

  ### その他使用したもの
    GitHub(Brunch, Issueで進捗の管理)
    外部API(Google Map API, Geocoding API)

  ### 実装予定
    非同期通信(入札時のページ読み込みをなくす)
    購入確認バナー(購入時に警告を表示させる)
    ユーザー詳細ページに購入一覧を表示させる

## ER図
<img src="er図.png" alt="attach:cat" title="attach:cat" width="200" height="200">

