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
- a line is less than 80 charachters long
- a line don't end in whitespace
