# inspigram

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

|スワイプ選択|ライク一覧|ランキング
|---|---|---|
|![swipeReadme](https://user-images.githubusercontent.com/88179125/158217869-6978b2b8-d1b6-4ecb-84b1-1c60a9f57b6c.gif)|![likeReadme](https://user-images.githubusercontent.com/88179125/158218030-a4fca582-215d-457a-8951-9a36673bbf8f.gif)|![rankingReadme](https://user-images.githubusercontent.com/88179125/158218150-05bbca06-7453-43e2-b114-4ad3fdbfac0b.gif)|

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
<img width="773" alt="inspigram-er" src="https://user-images.githubusercontent.com/88179125/158674163-5ee22d6f-f8b2-4ab4-9732-0dd8e243dd1f.png">



