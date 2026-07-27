---
title: "Hugo（PaperMod）で記事に画像を貼る方法まとめ"
date: 2026-07-27T19:38:00+09:00
draft: false
tags: ["Hugo", "PaperMod", "技術メモ", "ブログ構築"]
---

## 概要
Hugo + PaperMod で技術ブログを書く際、スクショや設定画面を貼りたい場面は多い。  
この記事では、**画像の置き場所・貼り方・サイズ調整・中央寄せ・横並び**など、  
PaperMod で画像を扱うための基本をまとめる。

---

## 1. 画像の置き場所
Hugo は `static/` フォルダの中身をそのまま公開する仕組みになっている。  
そのため、画像は以下の場所に置くのが基本。
MyBlog/
static/
images/
sample.png

## 2. 記事内で画像を貼る（Markdown）
最も基本的な貼り方はこれ。

```markdown
![説明文](/images/sample.png)

## 3. 画像サイズの調整
htmlがそのまま使える
<img src="/images/sample.png" width="400">


