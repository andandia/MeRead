# IsarからDriftへの移行計画 (TODOリスト)

本ドキュメントは、プロジェクトのデータベースをIsarからDrift (SQLite) へ移行するための具体的なステップを定義したものです。

**前提条件**:
* 既存ユーザーのIsarデータからDriftへのデータマイグレーションは**不要**です（新規インストールと同様の扱いとします）。
* 移行作業中、各ステップ（フェーズ）の途中や完了時において一時的にビルドエラーが発生することは許容されます。最終ステップが完了した段階でビルドが通り、動作することを目指します。

---

## 移行ステップ（TODOリスト）

### Step 1: パッケージの入れ替えと設定
- [x] `pubspec.yaml` からIsar関連の依存関係を削除する。
  - `isar`, `isar_flutter_libs`
  - `dev_dependencies` の `isar_generator`
- [x] `pubspec.yaml` にDrift関連の依存関係を追加する。
  - `drift`, `sqlite3_flutter_libs`, `path_provider`, `path`
  - `dev_dependencies` に `drift_dev`, `build_runner` (すでにあれば更新確認)
- [x] `flutter pub get` を実行してパッケージを同期する。

### Step 2: テーブル定義（スキーマ）の作成
Isarのモデル（Category, Feed, Post）をDriftのTableクラスとして再定義します。
- [x] `lib/db/tables.dart`（新規作成）などにテーブル定義を作成する。
  - [x] `Categories` テーブルの定義（`id`, `name`, `createdAt`, `updatedAt`）。
  - [x] `Feeds` テーブルの定義（`id`, `categoryId` (外部キー), `title`, `url`, `description`, `fullText`, `openType`）。
  - [x] `Posts` テーブルの定義（`id`, `feedId` (外部キー), `title`, `link`, `content`, `pubDate`, `read`, `favorite`, `fullText`）。

### Step 3: DriftDatabaseクラスの作成とクエリの実装
Driftデータベースを管理するクラスと、必要なデータベース操作（CRUD）を実装します。
- [x] `lib/db/database.dart`（新規作成）を作成し、`@DriftDatabase(tables: [Categories, Feeds, Posts])` アノテーションをつけて `AppDatabase` クラスを定義する。
- [x] データベース接続ロジック（`NativeDatabase` 等）を実装する。
- [x] `AppDatabase` 内にDAO（Data Access Object）的なメソッド、または別ファイルでDAOを作成し、以下のクエリを実装する。
  - [x] フィード一覧取得・保存・削除（FeedとCategoryのJOINを含む）
  - [x] 投稿一覧取得・保存（PostとFeedのJOINを含む）
  - [x] 特定のフィードIDに基づく投稿取得・ソート（`pubDate`降順）
  - [x] タイトルまたは内容による投稿の検索機能
  - [x] 未読/既読状態の更新（単一・一括）
  - [x] カテゴリの保存・一覧取得・名前による検索
- [x] `flutter pub run build_runner build --delete-conflicting-outputs` を実行し、Driftの生成コード（`database.g.dart`等）を生成する。

### Step 4: 既存モデルのDrift DataClassへの置き換え（または変換ロジックの実装）
Isar固有のモデルファイル（`lib/models/*.dart`）を、Driftが生成するDataClassに置き換えるか、UI層向けのドメインモデルとして維持しつつ相互変換処理を入れます。
- [x] UIや別ロジックが直接 `lib/models/` のクラスを参照している部分を、Driftで生成されたクラス（`Category`, `Feed`, `Post` など。重複回避に注意）に切り替える方針を確定する。
- [x] 既存の `lib/models/category.dart`, `lib/models/feed.dart`, `lib/models/post.dart` から `@collection`, `IsarLink`, `Id` などのIsar固有アノテーションを削除するか、ファイルごと削除してDriftの生成クラスに依存させる。
  - *注: Isarの `IsarLink` で解決されていた「FeedがCategoryを持つ」「PostがFeedを持つ」というオブジェクトネストについては、JOINを利用したクエリとモデルの再構成（例: `FeedWithCategory` のようなクラスの定義）が必要になります。*

### Step 5: DBHelper（旧 IsarHelper）のリファクタリング
- [x] `lib/helpers/isar_helper.dart` を `lib/helpers/db_helper.dart` にリネーム（または新設）する。
- [x] `IsarHelper` クラス名を `DbHelper` に変更する。
- [x] 各スタティックメソッド（`init()`, `getFeeds()`, `saveFeed()`, `getPostsByFeeds()` 等）の内部実装を、Step 3で作成した `AppDatabase` のメソッド呼び出しに置き換える。
- [x] トランザクション処理（`_isar.writeTxnSync()`）を、Driftのトランザクション（`transaction()` または `batch()`）に置き換える。同期処理（Sync）から非同期処理（Future）への変更に伴い、戻り値の型を適宜修正する。

### Step 6: アプリケーション全体のコンパイルエラーの修正
データベースアクセス層とモデルの非同期化（Futureベース）および構造変化により、UI側のコード（ProviderやControllerなど）でエラーが発生します。
- [x] 各画面や状態管理クラス（例: `lib/ui/`, `lib/helpers/` 内の他のファイル等）において、`DbHelper` のメソッド呼び出しが `Future` になったことに合わせた `await` の追加や、モデル構造変更（`IsarLink` へのアクセスをなくし、JOIN結果を使う等）への対応を行う。
- [x] 全体のコンパイルエラーを取り除く。

### Step 7: 既存のIsar関連不要ファイルの削除
- [x] `lib/models/category.g.dart`, `feed.g.dart`, `post.g.dart` などのIsarによる自動生成ファイルを削除する。
- [x] Isarに依存していた不要なインポートを全て削除する。

### Step 8: ビルドテストと動作確認
- [ ] `flutter build apk` (または iOS等) を実行し、最終的にビルドが通ることを確認する。
- [ ] アプリを起動し、以下の基本動作を確認する。
  - フィードの追加、一覧表示
  - 投稿（記事）の取得、未読/既読の切り替え
  - 記事の検索
  - フィードの削除（関連する投稿のカスケーディング削除ができているか）
