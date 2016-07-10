$.fn.switchState = (text, className, delay) ->
  btn = @
  delay ?= 2000
  oldText = btn.html()
  btn.html(text)
    .addClass(className)
  setTimeout(->
    btn.html(oldText)
    .removeClass(className)
  , delay)