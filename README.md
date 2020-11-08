# アプリケーション名
 ### Chater Trader

## 概要
  チャーター便のオークションサイト

## URL
## テスト用アカウント
## 作成背景
  大型の荷物をチャーターで手配する際に、買い手と売り手の金額が合わなくて、取引が成立しないことが多くなってきているなと感じました。運送会社、チャーター便手配会社の取引相手を多く参加させることにより、チャーター便の適性価格をオークション形式にして、金額が合わなくて手配できないという状況が改善されるのではないかと考えた。
## 機能一覧
  ### ユーザー管理機能  
    新規登録の際にはメール、パスワード、名前、電話番号、アドレスを登録させる  
    ログインの際はメールとパスワードを入力してログインする。  
  ### 買い手側によるチャーター便新規発注機能  
    ヘッダーの「チャーターをご要望の方」をクリックするとチャーター便新規発注画面へ遷移する。  
    - チャーター便手配時には  
    - 出発、到着場所の自治体を入力させる  
    - 荷物の大きさとなる才数を入力させる
    - 到着希望日を入力させる
    - 希望価格を入力させる
    - 到着する場所の住所を入力させる
    - 荷受け人の電話番号を入力させる

  ### 売り手側によるチャーター便オークション機能
    トップページの左側にチャーター便一覧を表示しているのでチャーター便ごとにクリックすると、トップページの右側に価格一覧を表示することができる。
    希望売却価格を入力しクリックすると価格一覧に上から安い順に価格が表示される。  
  ### チャーター便詳細機能  
    価格一覧の上のチャーター便のリンクをクリックするとチャーター便詳細ページへ遷移する。
    - 出発地ー到着地が表示されている
    - 到着地周辺のGoogleマップが表示されている
    - 購入者のみ削除ができるボタンがある
    - 住所が表示されている
    - 希望価格が表示されている
    - 才数が表示されている
  ### チャーター便購入機能
    トップページの右側の価格一覧の価格のリンクをクリックするとチャーター便購入どうでしょうかベージへ遷移できる。  
    ここでは価格提示した売り手側は削除と編集ができ、購入側は購入ボタンが表示されている。  
    購入ボタンを押すとクレジット情報を入力させるページへ遷移する。
    削除するとトップページの価格が消える。  
    また購入が完了すると、トップページ左のチャーター便の表示が消える。

## 環境・使用技術  
  ### フロントエンド  
    - HTML, CSS, JavaScript
  ### バックエンド
    - Ruby
    - Rails

  ### 開発環境
    -MySQL2
  ### 本番環境
    

## テスト

## インフラ構成図

## ER図
<img width="589" alt="eade7f0ee052718f2ea9c0461b9c426b" src="https://user-images.githubusercontent.com/68809067/98218277-ee5fb980-1f8e-11eb-8ff5-9362334339b6.png">

## テーブル一覧

### userテーブル
| Column             | Type       | Options          |
| ------------------ | ---------- | ---------------- |
| username           | string     | null :false      |
| email              | string     | null :false      |
| password           | string     | null :false      |
| encrypted_password | string     | null :false      |
| phone_number       | integer    | null :false      |
| prefecture_address | string     | null :false      |
| city_address       | string     | null :false      |
| house_number       | string     | null :false      |

#### アソシエーション
user has_many :orders   
user has_many :charters   
user has_many :sellOrders  


### charterテーブル
| Column             | Type       | Options          |
| ------------------ | ---------- | ---------------- |
| departure          | string     | null :false      |
| arrive             | string     | null :false      |
| size               | integer    | null :false      |
| delivery_date      | date       | null :false      |
| buy_price          | integer    | null :false      |
| prefecture_id      | integer    | null :false      |
| city               | string     | null :false      |
| charter_address    | string     | null :false      |
| build_name         | string     | null :false      |
| tell_number        | integer    | null :false      |

#### アソシエーション
charter belongs_to :user  
charter has_one :order  
charter has_many :sellOrders  


### orderテーブル
| Column             | Type       | Options          |
| ------------------ | ---------- | ---------------- |
| departure          | string     | null :false      |
| arrive             | string     | null :false      |

#### アソシエーション
order belongs_to :user  
order belongs_to :charter  
order belongs_to :sellOrder  


### sellOrderテーブル
| Column             | Type       | Options          |
| ------------------ | ---------- | ---------------- |
| sell_price         | integer    | null :false      |

#### アソシエーション
sellOrder has_many :users  
sellOrder has_one :order  
sellOrder belongs_to :charter  


### sellOrder_userテーブル(中間テーブル)

#### アソシエーション
belongs_to :user  
belongs_to :sellOrder  