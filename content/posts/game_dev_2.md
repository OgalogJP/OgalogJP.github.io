---
title: "学園シミュ Lib開発 NPCFactory"
summary: "学園シミュで使う c++ ライブラリ NPCFactory の解説"
date: 2026-08-10T00:00:00+09:00
draft: false
tags: ["GameDev", "NPCFactory"]
---

## NPCFactory の目的
"Factory" という名前が付いているが、実際には NPC の生成と管理をするライブラリである。

- NPCの実体を管理
- 単体 NPC の生成と削除
- 複数 NPC の生成と削除
- 進級管理
- id から NPCの参照を取得
- NPC の名前生成

## ライブラリが扱う概念

- [NPC](/posts/game_dev_9)

## ライブラリの責務
このライブラリの責務は NPC の生成と管理・保持である。

NPC に変更を加える場合、変更命令自体は別ライブラリから受け取り、実際の変更をこのライブラリで行う。

## ライブラリの利用

1. factory で作った NPC 群を manager に渡して管理
2. 以降 NPC の設定変更の際は manager を通して行う

## 設計
### データ構造

|モジュール|機能|
|---|---|
|NameDatabase|名前を格納する構造体|
|NameDatabaseLoader|names.json を読み込む|
|NPCfactory|NPC 生成|
|NPCManager|NPC 管理・変更|

#### NPCFactory
その名の通り、NPC を生成する。

今回の実装ではプレイヤーを特別な扱いとせず、プレイヤー情報は NPC と同じクラスを使っている。

- 学年単位で生成
- 全学年まとめて生成
- プレイヤーの生成

#### NPCMamager
NPCMamager は NPC の実体を管理している唯一の場所である。

NPCを一元管理しておかないと NPC を取得したり、NPC のフィールドに変更を加える際、どこの NPC 情報が現在のものか分からなくなる危険がある。

- NPC を配列に追加
- NPC の参照を取得
- 進級・卒業
- NPC に部活を設定

NPC は在校生と卒業生を分けて保持している。

在校生はゲーム中メインで使われるものである。<br>
卒業生は後々プレイヤーが見て楽しむためのアーカイブとして活用予定である。その他 OB・OG イベントを作る際に活用できるかもしれない。

部活に関しては専用の lib である [ClubSystem](/posts/game_dev_3) が部活の割り当てを決め、実際の変更を manager が行う。

#### NameDatabaseLoader
names.json から名前情報を読み込む。読み込んだデータは NameDatabase に流す。

names.json には NPC の名前用の苗字・名前・よみがなが記載されており、Loader が NameDatabase の各構造体・配列に振り分ける。

#### NameDatabase
NameDatabaseLoader から受け取った情報を名前構造体に格納する。

- NameEntry:汎用苗字・名前構造体<br>
familyNames:苗字<br>
maleNames:男子名前<br>
femaleNames:女子名前<br>
- UniqueNPCEntry:ユニークNPC用名前構造体<br>
uniqueNPCs:ユニークNPC名前配列

## ライブラリの拡張性
- 名前の追加は names.json に追記する
- NPCに対する新たな変更処理を実装する際はNPCManagerに追加する

## 関連するライブラリ

- [CommonLib](/posts/game_dev_4)

{{< adsense >}}
