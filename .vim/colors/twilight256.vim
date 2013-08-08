" twilight256 color scheme file
" Maintainer: Neal Milstein - neal dot milstein at gmail dot com
" Last Change: 2011 Feb 1
"
" This theme copies the colors from the TextMate theme Twilight.
"
" The theme is designed to be used on a black background. I only tested it
" using a 256-color terminal; I do not think it will work on much else (gvim,
" 8-color terminal, etc.).
"
" The functions in this theme that convert hex color codes to the nearest
" xterm-256 color number are from the theme desert2 (desert256), developed by Henry So, Jr. 
"
" The colors of this theme are based on the TextMate Twilight theme
" – www.macromates.com
" 
" Modified by Brent Lintner - tweaked colours based on:
" http://code.google.com/p/trespams-vim/source/browse/.vim/colors/twilight.vim?r=bcc5eac0fa6813f5832d2b8e2a1e9f75029ed09c

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="twilight256"

if has("gui_running") || &t_Co == 88 || &t_Co == 256
    " functions {{{
    " returns an approximate grey index for the given grey level
    fun <SID>grey_number(x)
        if &t_Co == 88
            if a:x < 23
                return 0
            elseif a:x < 69
                return 1
            elseif a:x < 103
                return 2
            elseif a:x < 127
                return 3
            elseif a:x < 150
                return 4
            elseif a:x < 173
                return 5
            elseif a:x < 196
                return 6
            elseif a:x < 219
                return 7
            elseif a:x < 243
                return 8
            else
                return 9
            endif
        else
            if a:x < 14
                return 0
            else
                let l:n = (a:x - 8) / 10
                let l:m = (a:x - 8) % 10
                if l:m < 5
                    return l:n
                else
                    return l:n + 1
                endif
            endif
        endif
    endfun

    " returns the actual grey level represented by the grey index
    fun <SID>grey_level(n)
        if &t_Co == 88
            if a:n == 0
                return 0
            elseif a:n == 1
                return 46
            elseif a:n == 2
                return 92
            elseif a:n == 3
                return 115
            elseif a:n == 4
                return 139
            elseif a:n == 5
                return 162
            elseif a:n == 6
                return 185
            elseif a:n == 7
                return 208
            elseif a:n == 8
                return 231
            else
                return 255
            endif
        else
            if a:n == 0
                return 0
            else
                return 8 + (a:n * 10)
            endif
        endif
    endfun

    " returns the palette index for the given grey index
    fun <SID>grey_color(n)
        if &t_Co == 88
            if a:n == 0
                return 16
            elseif a:n == 9
                return 79
            else
                return 79 + a:n
            endif
        else
            if a:n == 0
                return 16
            elseif a:n == 25
                return 231
            else
                return 231 + a:n
            endif
        endif
    endfun

    " returns an approximate color index for the given color level
    fun <SID>rgb_number(x)
        if &t_Co == 88
            if a:x < 69
                return 0
            elseif a:x < 172
                return 1
            elseif a:x < 230
                return 2
            else
                return 3
            endif
        else
            if a:x < 75
                return 0
            else
                let l:n = (a:x - 55) / 40
                let l:m = (a:x - 55) % 40
                if l:m < 20
                    return l:n
                else
                    return l:n + 1
                endif
            endif
        endif
    endfun

    " returns the actual color level for the given color index
    fun <SID>rgb_level(n)
        if &t_Co == 88
            if a:n == 0
                return 0
            elseif a:n == 1
                return 139
            elseif a:n == 2
                return 205
            else
                return 255
            endif
        else
            if a:n == 0
                return 0
            else
                return 55 + (a:n * 40)
            endif
        endif
    endfun

    " returns the palette index for the given R/G/B color indices
    fun <SID>rgb_color(x, y, z)
        if &t_Co == 88
            return 16 + (a:x * 16) + (a:y * 4) + a:z
        else
            return 16 + (a:x * 36) + (a:y * 6) + a:z
        endif
    endfun

    " returns the palette index to approximate the given R/G/B color levels
    fun <SID>color(r, g, b)
        " get the closest grey
        let l:gx = <SID>grey_number(a:r)
        let l:gy = <SID>grey_number(a:g)
        let l:gz = <SID>grey_number(a:b)

        " get the closest color
        let l:x = <SID>rgb_number(a:r)
        let l:y = <SID>rgb_number(a:g)
        let l:z = <SID>rgb_number(a:b)

        if l:gx == l:gy && l:gy == l:gz
            " there are two possibilities
            let l:dgr = <SID>grey_level(l:gx) - a:r
            let l:dgg = <SID>grey_level(l:gy) - a:g
            let l:dgb = <SID>grey_level(l:gz) - a:b
            let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
            let l:dr = <SID>rgb_level(l:gx) - a:r
            let l:dg = <SID>rgb_level(l:gy) - a:g
            let l:db = <SID>rgb_level(l:gz) - a:b
            let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
            if l:dgrey < l:drgb
                " use the grey
                return <SID>grey_color(l:gx)
            else
                " use the color
                return <SID>rgb_color(l:x, l:y, l:z)
            endif
        else
            " only one possibility
            return <SID>rgb_color(l:x, l:y, l:z)
        endif
    endfun

    " returns the palette index to approximate the 'rrggbb' hex string
    fun <SID>rgb(rgb)
        let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
        let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
        let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0

        return <SID>color(l:r, l:g, l:b)
    endfun

    " sets the highlighting for the given group
    fun <SID>X(group, fg, bg, attr)
        if a:fg != ""
            exec "hi " . a:group . " guifg=#" . a:fg . " ctermfg=" . <SID>rgb(a:fg)
        endif
        if a:bg != ""
            exec "hi " . a:group . " guibg=#" . a:bg . " ctermbg=" . <SID>rgb(a:bg)
        endif
        if a:attr != ""
            exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
        endif
    endfun
    " }}}

    call <SID>X("Normal", "f0f0f0", "", "")

    " highlight groups
    "call <SID>X("Cursor", "708090", "f0e68c", "")
    "CursorIM
    call <SID>X("Directory", "ececc8", "", "")
    "DiffAdd
    "DiffChange
    "DiffDelete
    "DiffText
    call <SID>X("ErrorMsg", "602020", "", "")
    call <SID>X("VertSplit", "303030", "", "none")
    call <SID>X("Folded", "8a9597", "", "")
    call <SID>X("FoldColumn", "8a9597", "", "")
    "call <SID>X("FoldColumn", "d2b48c", "4d4d4d", "")
    "call <SID>X("IncSearch", "708090", "f0e68c", "")
    call <SID>X("LineNr", "64686c", "", "")
    "call <SID>X("ModeMsg", "D4D4D4", "", "")
    "call <SID>X("MoreMsg", "2e8b57", "", "")
    call <SID>X("NonText", "605958", "", "")
    "call <SID>X("Question", "00ff7f", "", "")
    call <SID>X("Search", "606000", "c0c000", "")
    call <SID>X("SpecialKey", "303030", "", "")
    call <SID>X("StatusLine", "666666", "", "none,underline")
    call <SID>X("StatusLineNC", "606060", "", "none,underline")
    call <SID>X("Title", "d08356", "", "underline")
    call <SID>X("Visual", "404040", "f0f0f0", "reverse")
    "VisualNOS
    "call <SID>X("WarningMsg", "fa8072", "", "")
    "WildMenu
    "Menu
    "Scrollbar
    "Tooltip

    " syntax highlighting groups
    call <SID>X("Comment", "64686C", "", "")
    call <SID>X("Constant", "D08356", "", "")

    call <SID>X("Identifier", "8A9597", "", "none")
    call <SID>X("Function", "A999AC", "", "")
    call <SID>X("Define", "ceb67f", "", "none")
    call <SID>X("Statement", "ceb67f", "", "none")
    call <SID>X("Conditional", "ceb67f", "", "none")
    call <SID>X("Repeat", "ceb67f", "", "none")
    call <SID>X("Structure", "ceb67f", "", "none")

    call <SID>X("String", "a2a96f", "", "")
    call <SID>X("PreProc", "8a9597", "", "")
    call <SID>X("Type", "ececc8", "", "")
    call <SID>X("Special", "c2c98f", "", "")
    call <SID>X("Underlined", "fffedc", "", "underline")
    call <SID>X("Ignore", "666666", "", "")
    call <SID>X("Error", "602020", "", "")
    call <SID>X("Todo", "666666", "eeee00", "")

    if version >= 700
        call <SID>X("CursorLine", "262626", "", "none")
        call <SID>X("CursorColumn", "262626", "", "none")
        call <SID>X("CursorLine", "fffedc", "", "none")

"      "Tabpages
      hi TabLine guifg=#a09998 guibg=#202020 gui=underline
      hi TabLineFill guifg=#a09998 guibg=#202020 gui=underline
      hi TabLineSel guifg=#a09998 guibg=#404850 gui=underline
"
"      "P-Menu (auto-completion)
      hi Pmenu guifg=#605958 guibg=#303030 gui=underline
      hi PmenuSel guifg=#a09998 guibg=#404040 gui=underline
    endif

    " delete functions {{{
    delf <SID>X
    delf <SID>rgb
    delf <SID>color
    delf <SID>rgb_color
    delf <SID>rgb_level
    delf <SID>rgb_number
    delf <SID>grey_color
    delf <SID>grey_level
    delf <SID>grey_number
    " }}}
endif

" vim: set fdl=0 fdm=marker:
