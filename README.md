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
|`<leader>lz` | 挂起`<c>z`| 
|`<leader>lq` | 保存退出`:wq<CR>` (or `:x<CR>`)| 
|`<leader>lw` | 保存`:w`|
|`<leader>l/`  | 取消高亮|
|`<leader>wh` | 跳转`<c-w>h`| 
|`<leader>wj` | 跳转`<c-w>j`|
|`<leader>wk` | 跳转`<c-w>k`|
|`<leader>ff` | 两字符查找，来自`easymotion`插件|
|`<leader>fd` | 行查找，来自`easymotion`插件|
|`<leader>cc`| 行注释|
|`<leader>cu`| 解注释|
|`w!!`       | 临时sudo保存|

# 其他
当前配置未加载语法，`syntax on`语句未写。
---------