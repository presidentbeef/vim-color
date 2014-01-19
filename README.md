_Still a bit rough_

This is a little script to facilitate using Vim's HTML output for syntax highlighting.

Given a text file in some supported language, it will output HTML with syntax highlighting.

### Install

No official gem, yet. Feel bad about stealing the name for something so silly.

```bash
git clone https://github.com/presidentbeef/vim-color.git
cd vim-color
gem build vim-color.gemspec
gem install vim-color*.gem
```

### Usage

Simplest:

    vim-color INFILE

Or specify output file name:

    vim-color INFILE OUTFILE

Or be really specific:

    vim-color --input INFILE --output OUTFILEn

#### Other Options

Use CSS:

    --css

Use line numbers:

    --line-numbers

Set language:

    --syntax LANGUAGE


### License

MIT
