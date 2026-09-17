---
title: "学園シミュ Lib開発 NPC について"
summary: "学園シミュ用ライブラリで使う NPC の説明"
date: 2026-08-17T00:00:00+09:00
draft: false
tags: ["GameDev", "NPC"]
---

## NPC とは
このゲームにおける NPC とはプレイヤーを含めたキャラクターを統一的に扱うための抽象モデルである。

### MOB NPC の役割
基本的に学園内に登場する他生徒を NPC として表現する。

- NPC 同士による雑談
- NPC 同士の会話から [秘密](/posts/game_dev_10) を得る
- NPC に直接インタラクトして会話する
- 会話などによる [関係値](/posts/game_dev_11) の更新

## 構造
- isPlayer
- フルネーム
- 性別
- 外見
- 学年・クラス・出席番号
- 所属部活
- 立場
- 知っている [秘密](/posts/game_dev_10) の ID
- 性格パラメータ
- 性格
- 会話スタイル ID
- 感情

## 仕様

- NPCProfile.h ( CoomonLib ) に class として定義されている
- ロジックは性格の有無を確認するユーティリティのみ
- NPC の生成は基本的に NPCFactory で行う
- プレイヤーも NPC として扱っている ( isPlayer= true )

## NPC を使うライブラリ
- [NPCFactory](/posts/game_dev_2)
- [ClubSystem](/posts/game_dev_3)
- [Social](/posts/game_dev_5)
- [Conversation](/posts/game_dev_6)
- [Secret](/posts/game_dev_7)
- [Services](/posts/game_dev_8)

## NPC が実装されているライブラリ
- [Common](/posts/game_dev_4)

{{< adsense >}}
