#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  SED_ARGS=(-i '')
else
  SED_ARGS=(-i)
fi

sed "${SED_ARGS[@]}" -e 's/- \[ \] UIや別ロジックが直接 `lib\/models\/` のクラスを参照している部分を、Driftで生成されたクラス（`Category`, `Feed`, `Post` など。重複回避に注意）に切り替える方針を確定する。/- \[x\] UIや別ロジックが直接 `lib\/models\/` のクラスを参照している部分を、Driftで生成されたクラス（`Category`, `Feed`, `Post` など。重複回避に注意）に切り替える方針を確定する。/g' drift_migration_plan.md
sed "${SED_ARGS[@]}" -e 's/- \[ \] 既存の `lib\/models\/category.dart`, `lib\/models\/feed.dart`, `lib\/models\/post.dart` から `@collection`, `IsarLink`, `Id` などのIsar固有アノテーションを削除するか、ファイルごと削除してDriftの生成クラスに依存させる。/- \[x\] 既存の `lib\/models\/category.dart`, `lib\/models\/feed.dart`, `lib\/models\/post.dart` から `@collection`, `IsarLink`, `Id` などのIsar固有アノテーションを削除するか、ファイルごと削除してDriftの生成クラスに依存させる。/g' drift_migration_plan.md

sed "${SED_ARGS[@]}" -e 's/- \[ \] `lib\/helpers\/isar_helper.dart` を `lib\/helpers\/db_helper.dart` にリネーム（または新設）する。/- \[x\] `lib\/helpers\/isar_helper.dart` を `lib\/helpers\/db_helper.dart` にリネーム（または新設）する。/g' drift_migration_plan.md
sed "${SED_ARGS[@]}" -e 's/- \[ \] `IsarHelper` クラス名を `DbHelper` に変更する。/- \[x\] `IsarHelper` クラス名を `DbHelper` に変更する。/g' drift_migration_plan.md
sed "${SED_ARGS[@]}" -e 's/- \[ \] 各スタティックメソッド（`init()`, `getFeeds()`, `saveFeed()`, `getPostsByFeeds()` 等）の内部実装を、Step 3で作成した `AppDatabase` のメソッド呼び出しに置き換える。/- \[x\] 各スタティックメソッド（`init()`, `getFeeds()`, `saveFeed()`, `getPostsByFeeds()` 等）の内部実装を、Step 3で作成した `AppDatabase` のメソッド呼び出しに置き換える。/g' drift_migration_plan.md
sed "${SED_ARGS[@]}" -e 's/- \[ \] トランザクション処理（`_isar.writeTxnSync()`）を、Driftのトランザクション（`transaction()` または `batch()`）に置き換える。同期処理（Sync）から非同期処理（Future）への変更に伴い、戻り値の型を適宜修正する。/- \[x\] トランザクション処理（`_isar.writeTxnSync()`）を、Driftのトランザクション（`transaction()` または `batch()`）に置き換える。同期処理（Sync）から非同期処理（Future）への変更に伴い、戻り値の型を適宜修正する。/g' drift_migration_plan.md

sed "${SED_ARGS[@]}" -e 's/- \[ \] 各画面や状態管理クラス（例: `lib\/ui\/`, `lib\/helpers\/` 内の他のファイル等）において、`DbHelper` のメソッド呼び出しが `Future` になったことに合わせた `await` の追加や、モデル構造変更（`IsarLink` へのアクセスをなくし、JOIN結果を使う等）への対応を行う。/- \[x\] 各画面や状態管理クラス（例: `lib\/ui\/`, `lib\/helpers\/` 内の他のファイル等）において、`DbHelper` のメソッド呼び出しが `Future` になったことに合わせた `await` の追加や、モデル構造変更（`IsarLink` へのアクセスをなくし、JOIN結果を使う等）への対応を行う。/g' drift_migration_plan.md
sed "${SED_ARGS[@]}" -e 's/- \[ \] 全体のコンパイルエラーを取り除く。/- \[x\] 全体のコンパイルエラーを取り除く。/g' drift_migration_plan.md
