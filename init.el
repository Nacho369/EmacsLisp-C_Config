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

;(define-key map "backspace" 'backward-delete-char global-map)
;(global-set-key (kbd "backspace") 'delete-backward-char)
;(global-set-key (kbd "C-u backspace") 'C-backspace)

(global-set-key (kbd "Backspace") 'backward-delete-whitespace-to-column)
(defun backward-delete-whitespace-to-column ()
  "delete back to the previous column of whitespace, or as much whitespace as possible,
or just one char if that's not possible"
  (interactive)
  (if indent-tabs-mode
      (call-interactively 'backward-delete-char)
    (let ((movement (% (current-column) tab-width))
          (p (point)))
      (when (= movement 0) (setq movement tab-width))
      (save-match-data
        (if (string-match "\\w*\\(\\s-+\\)$" (buffer-substring-no-properties (- p movement) p))
            (backward-delete-char (- (match-end 1) (match-beginning 1)))
        (call-interactively 'backward-delete-char))))))
