;; 環境を日本語、UTF-8にする
(set-locale-environment nil)
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;; スタートアップメッセージを表示させない
(setq inhibit-startup-message t)

;; バックアップファイルを作成させない
(setq make-backup-files nil)

;; タブにスペースを使用する
(setq-default tab-width 4 indent-tabs-mode nil)

;; 対応する括弧を光らせる
(show-paren-mode 1)

;; スクロールは１行ごとに
(setq scroll-conservatively 1)

;; タグジャンプで元に戻る
;(global-set-key (kbd "M-*") 'pop-tag-mark)
