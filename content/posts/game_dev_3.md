---
title: "学園シミュ Lib開発 ClubSystem"
summary: "学園シミュで使う c++ ライブラリ ClubSystem の解説"
date: 2026-08-12T00:00:00+09:00
draft: false
tags: ["GameDev", "ClubSystem"]
---

# 初めに
この記事では製作中の学園シミュで使用するライブラリの１つである ClubSystem を解説します。

# 成果物
|ファイルなど|用途|
|---|---|
|ClubSystem.lib|UE が参照するライブラリ|

# ClubSystem の役割

- NPCを部活に割り当てる ( 入部処理 )
- 部活の割り当てを解除する ( 退部処理 )
- 部長・副部長の選出

## 構成
|ユニット|機能|
|---|---|
|ClubSystem.h / .cpp|部活の設定、部への割り当てなど|

## 依存する別Lib

- CommonLib : 他 Lib が参照するデータ Lib
- [NPCFactory](game_dev_2) : NPCmanager を参照する
- Social : RelationshipManager を参照する

# 解説
ClubSystem は NPC に対して入部・退部処理と部長・副部長の選出を行うライブラリである。

## ClubSystem
ClubSystemの機能は以下の通り

- まとめて入部・退部処理
- 個別に入部・退部処理
- プレイヤーの入部処理
- 部長・副部長の選出

各部の人数制限などをまとめた構造体 ClubInfo がある。

- ClubInfo<br>
定員<br>
性別制限<br>
男子の目標比率<br>
部の最小人数<br>
部の定員レート<br>

## 部活への割り当て
各部に ClubInfo を設定し、定員に対する部員数や男女比が不自然にならないように割り当てをする。

## 仕様の注意点
ゲーム内で使用する部の種類・設定をハードコードしている。<br>
現時点で部活動 23 種 + 生徒会が実装されている。追加の際はコードに変更を加える必要があるが、部活データを外部に出すことを検討中。

# テスト
このライブラリは以下のテストを行い、正しく動作していること確認した。

- NPCFactory で生成した NPC 群に部活を割り当てる
- 各部に部長・副部長を割り当てる
- 部の人数・男女比が ClubInfoで設定したものと一致することを確認<br>
設定と完全に一致することは割り当てのアルゴリズムの仕様上稀であり、逸脱した結果でなければ良い
- NPCManager と連携し、割り当てた部活と部長・副部長の設定が NPC に正常に反映されることを確認

退部処理については入部処理前の初期化として動作確認済。実際にゲーム内で退部処理が必要となった際に改めて確認する。

年度更新の際、新入生に対してまとめて部の割り当てを行う場面があるが、そちらのテストは SchoolYearSystem の方で行う。

# 終わりに
今回は ClubSystem の構造を整理・解説しました。

現状の問題点は部活情報をハードコードしてるところですが、運用上の問題はありません。ただ各部の設定に関しては外部データとしておいた方が調整しやすいだろうと考えており、仕様変更を検討中です。

部活はプレイヤーや NPC の特徴付けとして重要な要素です。また会話においても部活に関する内容を話す際に役立ちます。

<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-3696117703082942"
     crossorigin="anonymous"></script>
<!-- githubpages-display-01 -->
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-3696117703082942"
     data-ad-slot="4894199601"
     data-ad-format="auto"
     data-full-width-responsive="true"></ins>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script>
