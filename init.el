;;C configuration
(require 'cc-mode)
(setq-default c-basic-offset 8)
(setq c-default-style "linux"
          c-basic-offset 8)
(setq-default tab-width 4 indent-tabs-mode t)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
(add-hook 'c-mode-hook
       (lambda ()
         (setq-local electric-indent-chars
                     (remq ?\n electric-indent-chars))))

(defun my-newline-and-indent-mode-hook ()
  (local-set-key (kbd "RET") (key-binding (kbd "M-j")))
  (local-set-key (kbd "<C-return>") #'electric-indent-just-newline)
)

;INSERT ANY CODE BELOW
(eval-after-load "cc-mode"
  '(define-key c-mode-map (kbd "TAB")
	 'self-insert-command))

(global-set-key (kbd "DEL") 'backward-delete-char)
(setq c-backspace-function 'backward-delete-char)
