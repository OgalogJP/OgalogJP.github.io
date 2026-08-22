---
title: "学園シミュ Lib開発 Social"
summary: "学園シミュで使う c++ ライブラリ Social の解説"
date: 2026-08-22T00:00:00+09:00
draft: false
tags: ["GameDev", "SocialLib"]
---

# 初めに
この記事では製作中の学園シミュで使用するライブラリの１つである Social を解説します。

# Social ライブラリ
Social は Player 対 NPC や NPC 同士の関係値を構築・管理するライブラリである。

## 構成
このライブラリは構成は以下の通り。

|ユニット|機能|
|---|---|
|NPCRelation|関係値クラス|
|RelationDelta|会話中の関係値変化量構造体|
|RelationshipGenerator|関係値 生成|
|NPCRelationshipmanager|関係値 管理|

## 依存するライブラリ

- [Common](/posts/game_dev_4)

# 解説
このライブラリではプレイヤーを含む全生徒同士の関係値を生成・管理する。

1 クラスの人数やクラス数次第であるが、現時点では 360 人程の規模である。
(1 クラス 30 人 × 4 クラス × 3 学年)

この場合管理する関係値行列は 360 × 360 となる。(厳密には自分同士の関係値は計算しない)

関係値を構築する際は NPC 個々の性格による補正もかかる。

## 関係値とは
関係値は次のように構成される。

- 親密度
- 信頼度
- 興味度
- 尊敬度
- 恐怖度
- 上下関係

関係値の変動は主に会話によって行われる。会話の仕様に関しては Conversation で解説する。

関係値によって会話内容や選択肢などが変化する。

# テスト
このライブラリは以下のテストを行い、正しく動作していること確認した。

- 全生徒に対して関係値生成を行う
- 関係値がセットされたことをコンソールでデバッグ表示
- 関係値の取得が正しく機能する
- 生徒の追加・削除の場合に関係値を生成・削除できている
- 会話を行った際、関係値が更新されること

現状想定通りの動きをしているが、関係値の持ち方と関係値取得周りの処理が複雑であるため注意する。

# 終わりに
今回は Social の構造を整理・解説しました。

Social で管理している関係値は、ゲーム内の行動を左右する独立したロジックとして扱うための基盤となっています。

ここで関係値を安全に管理しておくことで、会話・秘密・イベントなど、他のシステムが一貫した挙動を実現できます。

関係値が実際にどう作用するかは Conversation でより詳しく解説します。

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
