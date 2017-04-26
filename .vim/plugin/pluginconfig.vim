" Plugins
" Pathogen
Helptags " Needed to generate help for plugins
" solarized
colorscheme solarized
call togglebg#map("") " Fix background toggle function
" bbye
nnoremap <leader>dd :Bdelete<cr>
nnoremap <leader>da :bufdo :Bdelete<cr>
" ensime
nnoremap <leader>ec :EnTypeCheck<cr>
nnoremap <leader>ep :EnShowPackage
nnoremap <leader>ed :EnDeclaration<cr>
nnoremap <leader>eD :EnDeclarationSplit<cr>
nnoremap <leader>eb :EnDocBrowse<cr>
nnoremap <leader>et :EnInspectType<cr>
nnoremap <leader>es :EnSearch 
" vim-rooter
let g:rooter_silent_chdir = 1
" vifm
nnoremap <leader>fe :EditVifm<cr>
nnoremap <leader>fs :SplitVifm<cr>
nnoremap <leader>fv :VsplitVifm<cr>
nnoremap <leader>ft :TabVifm<cr>
nnoremap <leader>fd :DiffVifm<cr>
" MiniBufExpl (Fork by fholgado)
nnoremap <leader>b :MBEToggle<cr>
nnoremap <c-h> :MBEbp<cr>
nnoremap <c-l> :MBEbn<cr>
" NERD Tree
nnoremap <leader>e :NERDTreeToggle<cr>
let g:NERDTreeDirArrows = 0
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
" vim-orgmode
let g:org_indent=0
" Fugitive
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gd :Git pull --rebase<cr>
nnoremap <leader>gu :Gpush<cr>
nnoremap <leader>gca :Gcommit -a<cr>
nnoremap <leader>gcc :Gcommit<cr>
nnoremap <leader>gb :Gblame<cr>
" Syntastic
nnoremap <leader>c :SyntasticCheck<cr>
let g:syntastic_mode_map = {"mode":"passive", "active_filetypes":[], "passive_filetypes":["sbt"]}
" Maven (via maven-compiler)
augroup maven
	autocmd!
	autocmd Filetype java compiler mvn
	autocmd Filetype pom compiler mvn
augroup END
nnoremap <leader>mc :make compile<cr>
nnoremap <leader>mt :make test<cr>
nnoremap <leader>mp :make compile test assembly:single<cr>
nnoremap <leader>me :make eclipse:clean eclipse:eclipse<cr>
" SBT (via vim-scala)
augroup sbt
	autocmd!
	autocmd Filetype scala compiler sbt
	autocmd Filetype sbt compiler sbt
augroup END

