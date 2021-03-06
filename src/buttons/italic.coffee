
class ItalicButton extends Button

  name: 'italic'

  icon: 'italic'

  title: '斜体文字'

  htmlTag: 'i'

  disableTag: 'pre'

  shortcut: 'cmd+73'

  render: ->
    if @editor.util.os.mac
      @title = @title + ' ( Cmd + i )'
    else
      @title = @title + ' ( Ctrl + i )'
      @shortcut = 'ctrl+73'

    super()

  status: ($node) ->
    @setDisabled $node.is(@disableTag) if $node?
    return @disabled if @disabled

    active = document.queryCommandState('italic') is true
    @setActive active
    active

  command: ->
    document.execCommand 'italic'
    @editor.trigger 'valuechanged'

    # italic command won't trigger selectionchange event automatically
    $(document).trigger 'selectionchange'


Simditor.Toolbar.addButton(ItalicButton)

