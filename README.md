<h1 align="center">
  リソースパック (アジ鯖)
</h1>

<p align="center">
  <a href="https://github.com/azisaba/resourcepacks/actions">
    <img src="https://badgen.net/github/checks/azisaba/resourcepacks?label=build&icon=github" />
  </a>
  <a href="https://github.com/azisaba/packs.azisaba.net/actions">
    <img src="https://badgen.net/github/checks/azisaba/packs.azisaba.net?label=downstream%20build&icon=github" />
  </a>
  <a href="https://github.com/azisaba/resourcepacks/tree/binary">
    <img src="https://badgen.net/github/last-commit/azisaba/resourcepacks/binary?label=binary%20updated&icon=git" />
  </a>
  <a href="https://twitter.com/AzisabaNetwork">
    <img src="https://badgen.net/twitter/follow/AzisabaNetwork?icon=twitter" />
  </a>
  <a href="https://discord.gg/seheC2W">
    <img src="https://discord.com/api/guilds/357134045328572418/widget.png" />
  </a>
</p>

## 変更方法
1. 任意のフォルダまで行き、右上で `Add file` から `Upload files` を選択します。※クローンでもOK
2. ファイルを追加してコミットします。
3. https://github.com/azisaba/resourcepacks/actions が✅になるまで待ちます。
4. https://github.com/azisaba/packs.azisaba.net/actions が✅になるまで待ちます。
5. https://packs.azisaba.net に反映されます。※サイトに行きShift+F5で自分のブラウザにも反映
6. 完了！^w^

## 自分でビルド

### 以前のビルドから必要なファイルを取得
```
bash fetch.sh binary
```

### ビルドを実行
```
bash build.sh
```

### 静的APIの生成
```
bash build-api.sh
```

### コミットの作成
```
bash commit.sh binary
```
