---
title: "学園シミュ Lib開発 NpcFactory"
summary: "学園シミュで使う c++ ライブラリ NpcFactory の解説"
date: 2026-08-10T00:00:00+09:00
draft: false
tags: ["GameDev", "NpcFactory"]
---

# 初めに
この記事では製作中の学園シミュで使用するライブラリの１つである NpcFactory を解説します。

# 成果物
|ファイルなど|用途|
|---|---|
|NpcFactory.lib|UE が参照するライブラリ|
|names.json|NPC に使う苗字・名前|

# NpcFactory の役割

- NPCの実体を管理
- 単体 NPC の生成と削除
- 複数 NPC の生成と削除
- 進級管理
- id から NPCの参照を取得
- NPC の名前生成

## 構成
|ユニット|機能|
|---|---|
|NameDatabase.h|名前を格納する構造体|
|NameDatabaseLoader.h|names.json を読み込む|
|NPCfactory.h / .cpp|NPC生成|
|NPCManager.h / .cpp|NPC管理|

## 依存する別Lib

- CommonLib : 他Libが参照するデータLib

# 解説
Npc"Factory"という名前が付いているが、実際にはNPCの生成と管理をする。

## 簡単な流れ
1. factory で作った npc 群を manager に渡して管理
2. 以降 npc の設定変更の際は manager を通して行う

## NPCFactory
その名の通り、npcを生成する。ざっくり機能は３つ。

- 学年単位で生成
- 全学年まとめて生成
- プレイヤーの生成

３つめに関して、今回の実装ではプレイヤーを特別な扱いとせず、プレイヤーも npc と同じクラスを使っている。

## NPCMamager
npc の管理をするユニット。機能が少し多い。

- npc を配列に追加
- npc の参照を取得
- 進級・卒業
- npc に部活を設定

npc の実体を管理している唯一の場所。

npc は在校生と卒業生を分けて保持している。

在校生はゲーム中メインで使われるもの。<br>
卒業生は後々プレイヤーが見て楽しむためのアーカイブといったところ。その他 OB・OG イベントを作る際に活用できるかもしれない。

部活に関しては専用の lib である ClubSystem が部活の割り当てを決め、実際の変更を manager がやる。

# テスト
このライブラリは以下のテストを行い、正しく動作していること確認した。

- names.json の読み込み
- NameDatabase への jsonデータ格納
- npc 配列の初期化 (全学年を一括生成し、npc 配列に格納)
- 生成された npc の表示(苗字 名前 ふりがな 性別)

尚別ライブラリから呼ばれる処理は現時点ではテスト対象外としている。
- 部活の変更
- 進級・卒業

# 終わりに
今回は NpcFactory の構造を整理・解説しました。<br>
現状致命的なバグは無く、テストも問題なしといった状況です。

このライブラリ単体だとかなり地味なものになっていますが、ここで作った npc を中心にゲームが動いていきます。

次回以降も引き続き、別ライブラリの解説をしていきます。

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
