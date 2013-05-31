
;delete selection.
(delete-selection-mode t)

;something that humans like.
;(setq behave-like-something-actually-usable-by-humans t)


;enable line-numbers mode
;(global-linum-mode t)
(setq line-number-mode t)

;enable column-number mode.
(setq column-number-mode t)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; Swap line numbers using C-<f5>, you can change this of course
(autoload 'linum-mode "linum" "toggle line numbers on/off" t)
(global-set-key (kbd "C-<f5>") 'linum-mode)

;; Show all line numbering by default (you can turn this off if you
;; would like)
(line-number-mode 1)
(linum-mode 1)

;; Adjust Spacing
(setq linum-format "%d  ")
