###
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
###

argv =  require('optimist').argv
fs = require 'fs'

String::isWhiteSpace = () ->
  /^\s+$/.test this

String::indentation = () ->
  this.split((/\S/))[0]

String::last = () ->
  this[this.length-1]

# Remove strings from input, replace them with dummy variable
removeStrings = (input) ->
  input = input.replace /\\\"/g, ""
  input = input.replace /\\\'/g, ""
  input = input.replace /\"[^\"]*\"/g, "a"
  input = input.replace /\'[^\']*\'/g, "a"
  input

printError = (filename, lineNr, msg) ->
  console.log "#{filename}:#{lineNr} #{msg}"

checkStyle = (filename, lineNr, line) ->
  if line.length > 80
    printError filename, lineNr, "Line is > 80 characters long."

  if line.length > 0 and line.last().isWhiteSpace()
    printError filename, lineNr, "Line ends in whitespace."

  if /\t/.test line.indentation()
    printError filename, lineNr,
      "Tab found in indentation, only spaces allowed."

  clean = removeStrings line
  if (i = clean.indexOf("->")) isnt -1
    unless clean[i-1].isWhiteSpace()
      printError filename, lineNr,
        "No space before function declaration ('->')"
    unless i is clean.length - 2 or clean[i+2].isWhiteSpace()
      printError filename, lineNr,
        "No space or newline after function declaration ('->')."

argv._.forEach (filename) ->
  fs.readFile filename, "utf8", (err, data) ->
    lines = data.split('\n')
    checkStyle(filename, 0, lines[0])
    for i in [1...lines.length]
      checkStyle(filename, i+1, lines[i])
      if lines[i] is "" and lines[i-1] is ""
        printError filename, i, "Two empty lines found."
