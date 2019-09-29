;;; lsp-sample --- Test integration for workspace/workspaceFolders

;;; Commentary:

;;; Code:
(require 'lsp)

(defgroup lsp-sample nil
  "Lsp support for Lsp sample"
  :group 'lsp-mode
  :tag "Lsp sample")

(defcustom lsp-clients-sample-server "/home/ry/vscode-extension-samples/lsp-sample/server/out/server.js"
  "The server js file to use."
  :group 'lsp-sample
  :risky t
  :type 'file)

(defcustom lsp-clients-sample-server-args '("--stdio")
  "Command line arguments to launch lsp-sample server"
  :group 'lsp-sample
  :risky t
  :type '(repeat string))

;; (add-to-list 'lsp-language-id-configuration '(matlab-mode . "MATLAB"))

(defun lsp-sample-command ()
  "Build the launch command."
  (message "Computed command")
  `("node" ,lsp-clients-sample-server,@lsp-clients-sample-server-args))

(lsp-register-client
 (make-lsp-client :new-connection (lsp-stdio-connection 'lsp-sample-command)
                  :major-modes '(text-mode)
                  :priority -2
                  :server-id 'lsp-sample
                  :multi-root t
                  :language-id "text"))

(provide 'lsp-sample)

;;; lsp-sample.el ends here
