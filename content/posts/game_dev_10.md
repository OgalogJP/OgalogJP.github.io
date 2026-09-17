---
title: "学園シミュ Lib開発 秘密 ( Secret ) について"
summary: "学園シミュ用ライブラリで使う 秘密 の説明"
date: 2026-08-17T00:00:00+09:00
draft: false
tags: ["GameDev", "Secret"]
---

## 秘密 ( Secret ) とは
秘密 ( Secret ) とはプレイヤーや [NPC](/posts/game_dev_9) が所有している秘密、隠しごとや噂話である。

### 秘密 ( Secret ) の役割

- NPC が持つ秘密をプレイヤーが聞きだす
- NPC 同士の会話から秘密を盗み聞く
- 学園内探索で秘密を見つける

## 構造

- 秘密の ID
- 秘密の持ち主の ID
- 秘密の種類
- 秘密の重さ
- プレイヤーが秘密を聞き出す難易度
- 秘密を知っている NPC のリスト
- 秘密の持ち主がその秘密を知っていると認識している NPC のリスト
- 秘密のターゲットのリスト
- 秘密の拡散回数と最大拡散回数
- プレイヤーがこの秘密を知っているか
- 秘密に紐づくクエスト ID
- 会話で使うタグとプレースホルダー
- 秘密に関する会話テキスト
- 秘密に紐づく会話へのポインタ

## 仕様

- Secret.h (Common Lib) にクラスとして定義されている
- Secret ライブラリの SecretGenerator で作成される
- ゲーム中に存在する秘密の検索は SecretManager で行う
- 秘密の更新は Services で行う

## 秘密 (Secret) を使うライブラリ

- [Social](/posts/game_dev_5)
- [Conversation](/posts/game_dev_6)
- [Secret](/posts/game_dev_7)
- [Services](/posts/game_dev_8)

## 秘密 (Secret) が実装されているライブラリ
- [Common](/posts/game_dev_4)

{{< adsense >}}
