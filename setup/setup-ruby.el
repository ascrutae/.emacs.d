;;;;
;;;; Ruby
;;;;

;; I used ruby-block once, but seem to have stopped.
;; https://github.com/juszczakn/ruby-block

(autoload 'ruby-mode "ruby-mode" "Mode for editing Ruby")
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

;; I use rbenv, so Emacs needs to know about it
;; https://github.com/senny/rbenv.el
(use-package rbenv
  :config
  (setq rbenv-show-active-ruby-in-modeline nil)
  (setq rbenv-modeline-function 'rbenv--modeline-plain)
  (add-hook 'ruby-mode-hook 'global-rbenv-mode)
  )

;; Open up irb with M-x inf-ruby or C-c C-s from a Ruby buffer
(use-package inf-ruby
  :config
  (autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
  (add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
  )

;; Avoid ridiculous Ruby indentation.
(setq ruby-deep-indent-paren nil)

;; Parentheses.
(require 'smartparens-ruby)

;; "Finds all the URLs in the buffer, highlights them, and turns them into clickable buttons."
;; Use C-c RET to follow a link.
;; TODO Make Org's C-c C-o more general and follow these links too.
(add-hook 'ruby-mode-hook #'goto-address-mode)

;; Rubocop for pointing out errors (https://github.com/bbatsov/rubocop)
(use-package rubocop
  :diminish rubocop-mode
  :config
  (add-hook 'ruby-mode-hook 'rubocop-mode)
  )

;; indent-guide ... very nice
(add-hook 'ruby-mode-hook 'indent-guide-mode)

;; Show line numbers
;; (add-hook 'ruby-mode-hook (lambda () (setq display-line-numbers 'relative)))

(provide 'setup-ruby)
;;; setup-ruby.el ends here
