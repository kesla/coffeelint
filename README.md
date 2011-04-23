# About

Coffelint is a style checker for coffe-script (<http://jashkenas.github.com/coffee-script/>). I use it to make sure that my files follow the same simple style guidelines. Coffelint don't fix any style errors, only warns about them.

Coffelint works for me, it might not work for you.

# Installation

Coffelint depends on optimist (<https://github.com/substack/node-optimist>), so install that first (npm install optimist).
Download coffeelist.coffee from this repository.

# Usage

'coffee foo.coffee bar.coffee' checks the files foo.coffee and bar.coffee for style errors.

# Style rules

Coffelint checks that

- a line is less than 80 characters long
- a line don't end in whitespace
- indentation don't include tabs, only spaces
- there's a space before function arrow (->) and a space or newline afterwards
- there's not two, after each other, empty lines

# License
Copyright (c) 2011 David Björklund

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
