# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

i = 10

if i is 1
  window.alert '変数iは1'

ary1 = { 100, 200, 300, }
hash1 = { a: 100, b: 200, c: 300, }

ary2 = {
  'Red'
  'Yellow'
  'Green'
}

hash2 = {
  a: 'Red'
  b: 'Yellow'
  c: 'Green'
}

picture =
  Landscape:
    title: '雪と梅'
    price: 10000
    delete: false
  Portrait:
    title: '傘さす子供'
    price: 25000
    delete: false
