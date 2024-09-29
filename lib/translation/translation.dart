import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': {
          'MeRead': 'MeRead',
          'confirm': '确定',
          'cancel': '取消',
          'open': '开启',
          'close': '关闭',
          'copied': '複製的',

          // Route: /
          'markAllAsRead': '全标已读',
          'fullTextSearch': '全文搜索',
          'FeedIsEmpty': '订阅源为空，请添加订阅源后再尝试',
          'refreshFailed': '@count 个订阅源更新失败',
          'refreshSuccess': '更新成功',
          'allFeeds': '全部订阅',

          // Route: /add_feed
          'addFeed': '添加订阅',
          'feedAddress': '订阅源地址',
          'pasteAddress': '粘贴地址',
          'resloveAddress': '解析地址',
          'feedAlreadyExists': '订阅源已存在',
          'feedResolveError': '解析订阅源失败',
          'feedCategory': '订阅源分类',
          'defaultCategory': '默认分类',
          'fullText': '获取全文',
          'fullTextInfo': '自动抓取文章全文内容',
          'openType': '打开方式',
          'openInApp': '内置阅读器',
          'openInAppTab': '内置标签页',
          'openInBrowser': '系统浏览器',
          'saveFeed': '保存',
          'deleteFeed': '删除',

          // Route: /edit_feed
          'editFeed': '编辑订阅源',
          'feedName': '订阅源名称',

          // Route: /setting
          'moreSetting': '更多设置',

          // Route: /setting/display
          'displaySetting': '显示设置',
          'displaySettingInfo': '主题，动效，缩放，语言',
          'darkMode': '深色模式',
          'followSystem': '跟随系统',
          'dynamicColor': '动态颜色',
          'dynamicColorInfo': '根据壁纸自动调整主题颜色',
          'globalFont': '全局字体',
          'defaultFont': '默认字体',
          'importFont': '导入',
          'animationEffect': '动画效果',
          'animationEffectInfo': '重启应用后生效',
          'smoothScrolling': '平滑滚动',
          'fadeInAndOut': '淡入淡出',
          'textScale': '字体缩放',
          'textScaleFactor': '字体缩放系数：',
          'language': '语言',
          'systemLanguage': '系统语言',
          'zh_CN': '简体中文',
          'en_US': 'English',
          'ja_JP': '日本語',

          // Route: /setting/read
          'readSetting': '阅读设置',
          'readSettingInfo': '字体，行高，边距，对齐',
          'fontSize': '字体大小',
          'lineHeight': '行高',
          'pagePadding': '页面边距',
          'textAlign': '文本对齐',
          'leftAlign': '左对齐',
          'rightAlign': '右对齐',
          'justifyAlign': '两端对齐',
          'centerAlign': '居中对齐',

          // Route: /setting/resolve
          'resolveSetting': '解析设置',
          'resolveSettingInfo': '启动时刷新，屏蔽词，使用代理',
          'refreshOnStartup': '启动时刷新',
          'refreshOnStartupInfo': '启动应用时自动拉取订阅源更新',
          'blockWords': '屏蔽词',
          'blockWordsInfo': '屏蔽包含关键词的文章',
          'add': '添加',
          'addBlockWord': '添加屏蔽词',
          'useProxy': '使用代理',
          'useProxyInfo': '网络请求时使用代理服务器',
          'useProxyFailedInfo': '代理地址和端口不能为空',
          'proxyAddress': '代理地址',
          'proxyPort': '代理端口',
          'notSet': '未设置',

          // Route: /setting/data_manage
          'dataManage': '数据管理',
          'dataManageInfo': '导入，导出，清除数据',
          'importOpml': '导入 OPML',
          'importOpmlInfo': '从 OPML 文件导入订阅源',
          'exportOpml': '导出 OPML',
          'exportOpmlInfo': '导出所有订阅源到 OPML 文件',

          // Route: /setting/about
          'aboutApp': '关于应用',
          'aboutAppInfo': '版本，开源地址，联系作者',
          'appInfo': 'Material You 风格的 RSS 阅读器',
          'openSource': '开源地址',
          'contactAuthor': '联系作者',
        },
        'en_US': {},
        'ja_JP': {
          'MeRead': 'MeRead',
          'confirm': '決定',
          'cancel': 'キャンセル',
          'open': '開く',
          'close': '閉じる',
          'copied': 'コピーしました',

          // Route: /
          'markAllAsRead': '全て既読にする',
          'fullTextSearch': '全文検索',
          'FeedIsEmpty': 'フィードが空です。フィードを追加してもう一度お試しください',
          'refreshFailed': '@count フィードの更新に失敗しました',
          'refreshSuccess': '更新成功',
          'allFeeds': '全てのフィード',

          // Route: /add_feed
          'addFeed': 'フィードに追加',
          'feedAddress': 'フィードアドレス',
          'pasteAddress': 'URLを貼り付け',
          'resloveAddress': 'URLを解析する',
          'feedAlreadyExists': 'フィードはすでに存在します',
          'feedResolveError': 'URLの解析に失敗しました',
          'feedCategory': 'フィードカテゴリ',
          'defaultCategory': 'デフォルトカテゴリ',
          'fullText': '全文を取得する',
          'fullTextInfo': '記事の全文コンテンツを自動的に取得します',
          'openType': '開き方',
          'openInApp': '内蔵リーダー',
          'openInAppTab': '組み込みタブ',
          'openInBrowser': 'システムブラウザ',
          'saveFeed': '保存',
          'deleteFeed': '削除',

          // Route: /edit_feed
          'editFeed': 'フィードの編集',
          'feedName': 'フィード名',

          // Route: /setting
          'moreSetting': '設定',

          // Route: /setting/display
          'displaySetting': '表示設定',
          'displaySettingInfo': 'テーマ、アニメーション、スケーリング、言語',
          'darkMode': 'ダークモード',
          'followSystem': 'システムに従ってください',
          'dynamicColor': 'ダイナミックカラー',
          'dynamicColorInfo': '壁紙に基づいてテーマの色を自動的に調整します',
          'globalFont': 'グローバルフォント',
          'defaultFont': 'デフォルトフォント',
          'importFont': 'インポート',
          'animationEffect': 'アニメーション効果',
          'animationEffectInfo': 'アプリケーションを再起動すると有効になります',
          'smoothScrolling': 'スムーズスクロール',
          'fadeInAndOut': 'フェードインとフェードアウト',
          'textScale': '文字サイズ',
          'textScaleFactor': 'フォントの倍率:',
          'language': '言語',
          'systemLanguage': 'システム設定',
          'zh_CN': '简体中文',
          'en_US': 'English',
          'ja_JP': '日本語',

          // Route: /setting/read
          'readSetting': '読み取り設定',
          'readSettingInfo': 'フォント、行の高さ、余白、配置',
          'fontSize': 'フォントサイズ',
          'lineHeight': '行高',
          'pagePadding': 'ページ余白',
          'textAlign': 'テキストの配置',
          'leftAlign': '左揃え',
          'rightAlign': '右揃え',
          'justifyAlign': '両端揃え',
          'centerAlign': '中央揃え',

          // Route: /setting/resolve
          'resolveSetting': '解析設定',
          'resolveSettingInfo': '起動時に更新、ワードをブロック、プロキシを使用',
          'refreshOnStartup': '起動時に更新',
          'refreshOnStartupInfo': 'アプリの起動時にフィードを自動的に更新する',
          'blockWords': 'ブロックワード',
          'blockWordsInfo': 'キーワードを含む記事をブロックする',
          'add': '追加',
          'addBlockWord': 'ブロックワードを追加する',
          'useProxy': 'プロキシを使用する',
          'useProxyInfo': 'ネットワークリクエストを行うときにプロキシサーバーを使用する',
          'useProxyFailedInfo': 'プロキシアドレスとポートを空にすることはできません',
          'proxyAddress': 'プロキシアドレス',
          'proxyPort': 'プロキシポート',
          'notSet': '設定されていません',

          // Route: /setting/data_manage
          'dataManage': 'データ管理',
          'dataManageInfo': 'データのインポート、エクスポート、クリア',
          'importOpml': 'インポートOPMLファイル',
          'importOpmlInfo': 'OPMLファイルからフィードをインポートする',
          'exportOpml': 'OPMLのエクスポート',
          'exportOpmlInfo': 'すべてのフィードをOPMLファイルにエクスポートします',

          // Route: /setting/about
          'aboutApp': 'アプリケーションについて',
          'aboutAppInfo': 'バージョン、オープンソースのアドレス、作成者に連絡する',
          'appInfo': 'Material You スタイリッシュ RSSリーダー',
          'openSource': 'Github',
          'contactAuthor': '作者に連絡する',
        },
      };
}
