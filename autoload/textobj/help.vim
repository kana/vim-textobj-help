" textobj-help - Text objects for Vim help documents
" Version: 0.0.0
" Copyright (C) 2014 Kana Natsuno <http://whileimautomaton.net/>
" License: MIT license  {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}




function! textobj#help#load()
endfunction

let s:pattern_link = '|[^ |]\+|'
let s:pattern_option = '''[A-Za-z0-9_-]\{2,}'''
let s:pattern_any = join([s:pattern_link, s:pattern_option], '\|')

call textobj#user#plugin('help', {
\   'any': {
\     'pattern': s:pattern_any,
\     'move-n': [],
\     'move-p': [],
\     'move-N': [],
\     'move-P': [],
\   },
\   'link': {
\     'pattern': s:pattern_link,
\     'move-n': [],
\     'move-p': [],
\     'move-N': [],
\     'move-P': [],
\   },
\   'option': {
\     'pattern': s:pattern_option,
\     'move-n': [],
\     'move-p': [],
\     'move-N': [],
\     'move-P': [],
\   },
\ })




" __END__  "{{{1
" vim: foldmethod=marker
