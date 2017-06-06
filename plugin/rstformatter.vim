" Init {{{
if !exists('g:rstformatter_default_keys')
    let g:rstformatter_default_keys = 1
endif
if !exists('g:rstformatter_headline_chars')
    let g:rstformatter_headline_chars = ['=', '-', '^', '"']
endif
" }}}

" Functions {{{
function! RstHeadline(headchar) " {{{
    " Transform line to headline in rst notation
    " using a:headchar to underline it
    if (strlen(a:headchar) > 1)
        return 1
    endif
    let l:linelength = strlen(getline("."))
    let l:linenum = line(".")
    let l:headline = repeat(a:headchar, l:linelength)
    " if we already are on a headline, we'll replace the underlining line
    let l:nextline = getline(l:linenum + 1)
    let l:is_headline = 0
    for l:cur_char in g:rstformatter_headline_chars
        if (match(l:nextline, l:cur_char . '\+') > -1)
            let l:is_headline = 1
        endif
    endfor
    if l:is_headline == 1
        let failed = setline(l:linenum + 1, l:headline)
    else
        let failed = append(l:linenum + 1, l:headline)
        let failed = append(l:linenum + 1, "\n")
    endif
endfunction "}}}

function! RstHeadlineUp() " {{{
    let l:next_line = getline(line(".") + 1)
    if l:next_line ==# ""
        let l:cur_head_char = "x"
    else
        let l:cur_head_char = nr2char(strgetchar(l:next_line, 0))
    endif
    let l:new_level = max([index(g:rstformatter_headline_chars, l:cur_head_char) - 1, 0])
    let l:new_headchar = g:rstformatter_headline_chars[l:new_level]
    call RstHeadline(l:new_headchar)
endfunction "}}}

function! RstHeadlineDown() " {{{
    let l:next_line = getline(line(".") + 1)
    if l:next_line ==# ""
        let l:cur_head_char = "x"
    else
        let l:cur_head_char = nr2char(strgetchar(l:next_line, 0))
    endif
    let l:new_level = (index(g:rstformatter_headline_chars, l:cur_head_char) + 1) % len(g:rstformatter_headline_chars)
    let l:new_headchar = g:rstformatter_headline_chars[l:new_level]
    call RstHeadline(l:new_headchar)
endfunction "}}}

function! RstHeadlineFromChar() " {{{
    "prompt for char and call Headline function
    echom "Type char to underline with"
    let l:headchar = nr2char(getchar())
    call RstHeadline(l:headchar)
endfunction "}}}

"}}}

" Key Mappings {{{
if g:rstformatter_default_keys == 1
    silent! execute 'nnoremap <localleader>rhc :call RstHeadlineFromChar()<cr>'
    silent! execute 'nnoremap <localleader>rhu :call RstHeadlineUp()<cr>'
    silent! execute 'nnoremap <localleader>rhd :call RstHeadlineDown()<cr>'
endif
"}}}
