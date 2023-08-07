---
title: "環境構築"
---

# 1. IDEの準備をする
Flutterで開発をするためにIDEを用意しましょう！
今回インストールするIDEは全部で3つとなります。

特に、XCodeは端末のスペックによっては1時間程度インストールに時間がかかる場合があります。暇な時にインストールするようにしてください。

1. Android Studio（Android Emulator用 / Flutterコーディング用）
2. XCode（iOS Simulator用）
3. VS Code（Flutterコーディング用）

### Android Studio
:::message
全員必須です
:::

以下のリンクから、自身のOSに合うものをインストールしてください
https://developer.android.com/studio

### XCode
:::message
MacOSを利用している開発者のみ
:::

XCodeは、AppStoreからインストールしてください
https://apps.apple.com/jp/app/xcode/id497799835?mt=12

### VS Code
:::message
AndroidStudioでコーディングをする場合は不要ですが、VS Codeはおすすめです
:::

こちらも、自身のOSに合うものをインストールしましょう
https://code.visualstudio.com/download

### ブラグインのインストール
AndroidStudio, VS CodeにはFlutter向けのプラグインがあります。
以下の手順からプラグインのインストールをしてみてください。

#### Android Studio
`Andropid Studio` > `Settings` > `Plugins`を選択し
Marketplaceで以下のパッケージをインストールしてください
- dart
- flutter

#### VS Code
サイドバーの四角が4つのアイコンを選択してください。
Marketplaceで以下のパッケージをインストールしてください
- Flutter
- Flutter intl
- Flutter Widget Snippets
- Flutter Snippets
- Flutter widget wrap


# 2. バージョン管理ツールのインストール
アプリケーションを運用したり、複数のFlutterプロジェクトを兼任する場合は
Flutter自体のバージョン管理が大切となります。
以下の手順でインストールしましょう。

### 2-1. fvm install（Macユーザー向け）
brewでinstallしましょう
```
$ brew tap leoafarias/fvm
$ brew install fvm
```

### 2-2. fvm install（Windowsユーザー向け)
Windowsはchocoを使ってinstallしましょう
```
choco install fvm
```

### 動作確認
以下のコマンドでインストールできているか確認しましょう
```
$ fvm --version
```

### flutterをinstall
まず、以下のコマンドでどのバージョンがインストールできるか確認できます。
```
fvm releases
```
```
Feb 26 18  │ v0.1.6           
Mar 12 18  │ v0.2.1           
Mar 13 18  │ v0.1.8           
・・・略・・・
Jun 2 23   │ 3.10.3           
Jun 7 23   │ 3.10.4           
Jun 8 23   │ 3.12.0           
Jun 14 23  │ 3.10.5           
Jun 21 23  │ 3.12.0-1.1.pre   
Jul 12 23  │ 3.13.0-0.1.pre   
--------------------------------------
Jul 12 23  │ 3.10.6            stable
--------------------------------------
--------------------------------------
Jul 19 23  │ 3.13.0-0.2.pre    beta
--------------------------------------
```

基本的に、最新のstableのバージョンをインストールしましょう。

:::message
dartも同時にインストールされます
:::

```
fvm install 3.10.6
```

インストールが完了したら、 有効化しましょう
```
fvm use 3.10.6
```

### 動作確認
Flutterが無事インストールできたか確認してみましょう
fvmでFlutterを管理する場合、`fvm flutter`でFlutterコマンドが利用できます。
```
fvm flutter --version
```

さらに、Global設定をすれば`fvm`無しで`flutter`コマンドが使えます

```
fvm global 3.10.6
```
以下のようにコマンドが使えます
```
flutter --version
```

# 2. Flutterプロジェクトを立ち上げてみる
iOSの場合は不要ですが、Androidで動作確認をする場合エミュレーター（仮想端末）の設定が必要です。
以下のドキュメントを参考に、AndroidStudioで端末設定をしてみてください。

https://developer.android.com/studio/run/managing-avds?hl=ja

- IDEのインストール
- エミュレーターの設定

### Flutter Create
上記ができたら早速プロジェクトを作りましょう！
Flutterを作る際は、`fvm flutter create アプリ名`で立ち上げることができます。
注意点として、アプリ名は必ずスネークケースで記載するようにしてください。

```
fvm flutter create first_app
```

### IDEで開く
installしたプロジェクトを、VSCodeもしくはAndroidStudioで開きましょう。

#### VS Code
VS Codeの場合は、画面右下に以下のようなメニューがあると思うので写真で言う「Chrome（web-script）」となっている箇所をクリックしてください。

![](https://storage.googleapis.com/zenn-user-upload/88d0ec043c8b-20230808.png)

そうすると、以下のように起動できる端末一覧が出てくるので任意の端末を選択してください。

![](https://storage.googleapis.com/zenn-user-upload/1d65ac60b2cb-20230808.png)

#### Android Studio
Android Studioの場合、iOSであれば以下の画像のようにIDE中央上部にある「＜no device selected＞」からOpen iOS Simulatorを選択してください。
![](https://storage.googleapis.com/zenn-user-upload/93e52f9024fb-20230808.png)

Androidの場合は、画面右上の以下のアイコンをタップしてください
![](https://storage.googleapis.com/zenn-user-upload/000a0a423c0d-20230808.png)

そうすると、以下のように候補が出てくるので任意の端末を選択してください。
![](https://storage.googleapis.com/zenn-user-upload/c8ae452ff77e-20230808.png =300x)


### エミュレーター・シミュレーターで動かしてみる

:::message alert
ここで立ち上げに失敗した場合、IDEにFlutter/Dartのパスの指定が漏れている可能性があります。各IDEの設定からSDKのパスを指定してください。SDKのパスはfvmのFlutterバージョンを指定すれば問題ありません。
:::

- AndroidStudioの場合は実行ボタン「▶️」をクリックして実行できます。
- VSCodeの場合は、プロジェクト直下に`.vscode/launch.json`を作成すれば同じように実行ボタンで起動できます。


```json:.vscode/launch.json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "開発環境",
            "request": "launch",
            "type": "dart",
            "program": "lib/main.dart",
            "flutterMode": "debug"
        }
    ]
}
```

一応、`flutter run`というコマンドでもアプリを実行できます。
しかし、実行コマンドを気をつけなければ必須パラメーターが漏れたりしてしまうので、基本的には設定したIDEの実行ボタンを押して起動するようにしましょう。

うまく実行できればエミュレーター上で以下の画面が表示されます。
ここまでできれば環境構築は完了です！

![](https://storage.googleapis.com/zenn-user-upload/9314f41f983f-20230808.png =300x)
