# vim
My vim configuration
# 启动速度优化  
```vim
vim --startuptime tmp.txt ~/.vimrc  
```  
注意`tmp.txt`为写入的log文件，`~/.vimrc`为打开的文件，顺序颠倒会导致打开的文件被覆盖。  
# key mappings   

| 快捷键   | 功能 
| ---------| ------------- |
| `F5`       | 行号  |
| `F8`       | 粘贴模式|  
|`<leader>z` | 挂起`<c>z`| 
|`<leader>q` | 保存退出`:wq<CR>` (or `:x<CR>`)| 
|`<leader>a` | 保存`:w`|
|`<leader>w` | 替换`<Esc>`|
|`<Space>/`  | 取消高亮|
|`<leader>h` | 跳转`<c-w>h`| 
|`<leader>j` | 跳转`<c-w>j`|
|`<leader>k` | 跳转`<c-w>k`|
|`<leader>l` | 跳转`<c-w>l`|
|`<leader>s` | 两字符查找，来自`easymotion`插件|
|`<leader>L` | 行跳转，来自`easymotion`插件|
|`<leader>cc`| 行注释，来自`easymotion`插件|
|`<leader>cu`| 行解注释，来自`easymotion`插件|
|`w!!`       | 临时sudo保存|

# 其他
当前配置未加载语法，`syntax on`语句未写。