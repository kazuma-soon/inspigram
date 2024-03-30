# inspigram(2022年)

![ogp](https://user-images.githubusercontent.com/88179125/158204549-29790d40-a50b-49d7-aff8-393975efa9ff.jpg)

## サービス概要

趣味程度に絵描を楽しんでいるが、より面白いアイデアが欲しい人に  
直感的なライク機能（≒Tinderのスワイプ機能）の提供によって、アイデアの湧出を手助けする  
絵の共有サービスです。

▷どんな問題を解決する？
『ちょっと違ったアイデアで絵を描いてみたいけど、いいアイデアないかな？』
『落書き程度だし、パパッと見つけてすぐ試したい』

このような考えに対し、スワイプ機能・ライク一覧などを通して応えます。
ゆるい感じで絵の幅を広げていくことができます。

## サービスURL

https://inspigram.herokuapp.com/

## 使い方
1. Google認証にて利用登録
2. スワイプページにて絵の選択
3. ライク一覧にて、アイデアを見直す or ランキングで人気絵画のチェック

4. 絵の投稿

## 機能紹介
### メイン機能
- スワイプ自動ライク機能で、直感的に気に入った絵を選べます。
- 選んだ絵を一覧でチェックできます。
- トップページでは、人気ある絵がスライド形式で表示されます。

|スワイプ選択|ライク一覧|ランキング
|---|---|---|
|![swipeReadme](https://user-images.githubusercontent.com/88179125/158217869-6978b2b8-d1b6-4ecb-84b1-1c60a9f57b6c.gif)|![likeReadme](https://user-images.githubusercontent.com/88179125/158218030-a4fca582-215d-457a-8951-9a36673bbf8f.gif)|![rankingReadme](https://user-images.githubusercontent.com/88179125/158218150-05bbca06-7453-43e2-b114-4ad3fdbfac0b.gif)|

### お絵描き機能βの追加
- 投稿画面で絵を描いて、そのまま投稿できます。

![draw](https://user-images.githubusercontent.com/88179125/169653071-b72706d7-d745-4d56-ace6-8ca66470c05e.gif)

「絵を写真で撮って投稿するの、ちょっと面倒かも、、、」という意見をいただき、  
「投稿画面で絵を描いてそのまま投稿できる」ようにしてみました！  
描画をJSにて受け取り、そのままコントローラーへと処理を飛ばしています。  

## 使用技術
### バックエンド
- Ruby (3.0.2)
- Ruby on Rails (6.0.4.4)

### フロントエンド
- JavaScript
- jQuery (3.6.0)
- Hammer.js (2.0.8)
- bootstrap (4.5.3)
- particles.js (2.0.0)
- masonry.js (3.3.0)

### Gem
#### 認証
- omniauth-google-oauth2 - Googleでのログイン・登録を可能にする

#### 管理機能
- rails_admin

#### 画像
- carrierwave
- fog-aws - 画像をS3に保存する

## インフラ
- Heroku
- Amazon S3
- PostgreSQL

## ER図
変更予定（下記）

<img width="649" alt="inspigram_er_3" src="https://user-images.githubusercontent.com/88179125/169684376-f8c7cb42-ee31-4608-a138-4574f8d9fa5b.png">

## 追記
### ゲスト機能追加構想
「ログインするよりも前に試したい」というユーザーさんも多いかな？ と考え、  
ゲスト用のスワイプ機能・一覧機能実装を予定しています。  
具体的には、リクエスト送信者のグローバルIPアドレスを用いて、ライクレコードを作成する機能を考えています。  
`ERD`は以下への変更を予定しています。  

<img width="773" alt="inspigram_er_2" src="https://user-images.githubusercontent.com/88179125/169679903-04adc437-4ab3-4fa8-a876-5b522c3e33ad.png">

_______________________________________________

## 技術へのこだわり

### なぜオムニアースを使ったの？
- ログインの入力は面倒臭い！！！これだけで初見の快適なユーザー体験が滅びる！！！
- `twitter`のログインも実装したい。

### Hammer.jsの採用理由は？
- スワイプは「絶対にスマホで利用して欲しい」ため、スマホ操作に強みを持つ当ライブラリを採用しました。
- 「スワイプ自動ライク機能あります！スマホ非対応です」← 泣ける。

### 画像表示でこだわったことは？
- たくさんの画像を一度に見れる、`masonry.js`を使用しました。
- 当アプリは「直感的にアイデアを獲得する」もの。一度にたくさんの絵を視界に入れることで、直感を刺激したいと思ったためです！

### Railsの使用にあたっての工夫は？
- **NOT Fat Controller!!!**　の精神です。可読性が悪化しない場合は、可能な限り`model`, `helper`に処理を記載しました！
- （コードが綺麗になっていくのは快感でしたので、やりました、、。）

### 画像処理に関して何か工夫はある？
- デプロイにあたっては、画像の外部ストレージが必要でしたので、業務でも使うであろう `AWS S3` を採用しました。
- `AWS`を触りたかった、、。新しいものだったのでつい.
  
## 課題・問題点
issueとして、まとめております。

- [画像表示が遅くなる問題](https://github.com/kazuma-soon/inspigram/issues/77#issue-1249543427)
- [こだわったつもりが失敗。jQueryを採用した理由](https://github.com/kazuma-soon/inspigram/issues/78#issue-1250685241)
- [前いいねした画像が見つけられない問題](https://github.com/kazuma-soon/inspigram/issues/79#issue-1250692259)
- [未ログインユーザーの利用ハードルを下げたい](https://github.com/kazuma-soon/inspigram/issues/74#issue-1246412733)

### 実装方法などをアウトプットしています
- [【Rails】slickでスライドショーを作成する](https://zenn.dev/kazuma_soon/articles/882d9452b797f6)
- [【Rails】S3 × CarrierWave × fog-aws で画像アップロード](https://zenn.dev/kazuma_soon/articles/62f50c68eb011e)
