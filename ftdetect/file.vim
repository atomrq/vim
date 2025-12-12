" Define a dedicated Autocommand group for performance optimizations
augroup PerformanceOptimization
    " Clear any existing autocommands in this group to prevent duplicate definitions upon sourcing
    au!

    " 1. XML File: Disable syntax highlighting if file size exceeds 1MB (1,000,000 bytes)
    " This prevents performance lag when opening very large XML files.
    autocmd Filetype xml if getfsize(@%) > 1000000 | setlocal syntax=OFF | endif

    " 2. LAMMPS Trajectory File: Disable syntax highlighting if file size exceeds 1MB
    autocmd Filetype lammpstraj if getfsize(@%) > 1000000 | setlocal syntax=OFF | endif
    
    " 3. Example: You can add rules for other large filetypes like log or json
    " autocmd Filetype log,json if getfsize(@%) > 2000000 | setlocal syntax=OFF | endif

augroup END
