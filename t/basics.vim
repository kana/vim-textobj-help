call textobj#help#load()

call textobj#user#map('help', {
\   'any': {
\     'move-n': 'an',
\     'move-p': 'ap',
\     'move-N': 'aN',
\     'move-P': 'aP',
\   },
\   'link': {
\     'move-n': 'ln',
\     'move-p': 'lp',
\     'move-N': 'lN',
\     'move-P': 'lP',
\   },
\   'option': {
\     'move-n': 'on',
\     'move-p': 'op',
\     'move-N': 'oN',
\     'move-P': 'oP',
\   },
\ })

function! Test(il, ic, key, el, ec)
  call cursor(a:il, a:ic)
  execute 'normal' a:key
  let [_, al, ac, _] = getpos('.')
  Expect [a:il, a:ic, a:key, a:el, a:ec] ==# [a:il, a:ic, a:key, al, ac]
endfunction

describe 'textobj-help-any'
  before
    new
    read t/fixtures/sample.txt
  end

  after
    close!
  end

  it 'targets the nearest object'
    call Test(1,  1, 'an', 1, 21)
    call Test(1,  1, 'aN', 1, 25)
    call Test(1, 72, 'ap', 1, 59)
    call Test(1, 72, 'aP', 1, 64)
  end

  it 'targets an object in another line'
    call Test(2,  1, 'an', 3,  1)
    call Test(2,  1, 'aN', 3,  8)
    call Test(2,  1, 'ap', 1, 59)
    call Test(2,  1, 'aP', 1, 64)
  end

  it 'skips invalid formatted object'
    call Test(5,  1, 'an', 5, 31)
    call Test(5,  1, 'aN', 5, 38)
    call Test(5,  1, 'ap', 4, 31)
    call Test(5,  1, 'aP', 4, 36)
  end
end

describe 'textobj-help-link'
  before
    new
    read t/fixtures/sample.txt
  end

  after
    close!
  end

  it 'targets the nearest object'
    call Test(1,  1, 'ln', 1, 21)
    call Test(1,  1, 'lN', 1, 25)
    call Test(3, 76, 'lp', 3, 39)
    call Test(3, 76, 'lP', 3, 47)
  end

  it 'targets an object in another line'
    call Test(2,  1, 'ln', 3, 39)
    call Test(2,  1, 'lN', 3, 47)
    call Test(2,  1, 'lp', 1, 21)
    call Test(2,  1, 'lP', 1, 25)
  end

  it 'skips invalid formatted object'
    call Test(4,  1, 'ln', 4, 31)
    call Test(4,  1, 'lN', 4, 36)
    call Test(4, 70, 'lp', 4, 31)
    call Test(4, 70, 'lP', 4, 36)
  end
end

describe 'textobj-help-option'
  before
    new
    read t/fixtures/sample.txt
  end

  after
    close!
  end

  it 'targets the nearest object'
    call Test(1,  1, 'on', 1, 59)
    call Test(1,  1, 'oN', 1, 64)
    call Test(3, 76, 'op', 3,  1)
    call Test(3, 76, 'oP', 3,  8)
  end

  it 'targets an object in another line'
    call Test(2,  1, 'on', 3,  1)
    call Test(2,  1, 'oN', 3,  8)
    call Test(2,  1, 'op', 1, 59)
    call Test(2,  1, 'oP', 1, 64)
  end

  it 'skips invalid formatted object'
    call Test(5,  1, 'on', 5, 31)
    call Test(5,  1, 'oN', 5, 38)
    call Test(5, 76, 'op', 5, 31)
    call Test(5, 76, 'oP', 5, 38)
  end
end
