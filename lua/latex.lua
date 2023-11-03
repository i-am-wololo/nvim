function renderMath()
	require"nabla".enable_virt({
	  autogen = true, -- auto-regenerate ASCII art when exiting insert mode
	  silent = true,     -- silents error messages
	})
end

-- For .md files
vim.cmd("autocmd BufRead,BufNewFile *.md lua renderMath()")

-- For .txt files
vim.cmd("autocmd BufRead,BufNewFile *.txt lua renderMath()")
