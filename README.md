# vim
My vim configuration
# 启动速度优化  
```vim
vim --startuptime tmp.txt ~/.vimrc  
```  
注意`tmp.txt`为写入的log文件，`~/.vimrc`为打开的文件，顺序颠倒会导致打开的文件被覆盖。  
# 功能快捷键   

| 快捷键   | 功能 
| ---------| ------------- |
| F5       | 行号  |
| F6       | 文件树  |
| F8       | 粘贴模式|  
|`<leader>z` | 挂起`<C>z`| 
|`<leader>q` | 保存退出`:wq<CR>` (or `:x<CR>`)| 