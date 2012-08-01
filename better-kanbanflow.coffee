# autocompile

console.log "Better KanbanFlow loaded"

class BetterKanbanflow
  constructor: ->
    console.log 'Better KanbanFlow initializing'
    console.log $('.task-description').length
    $('.task').each (index, task) =>
      @fixTextAlignment($(task))

    document.addEventListener 'DOMNodeInserted', (e) =>
      el = $(e.target)
      if el.hasClass('task-description')
        console.log "DESCRIPTION: #{el.text()}"
        @fixTextAlignment(el)
        
    $(document.body).on 'change', 'input', (e) =>
      console.log 'CHANGE!'
      console.log e.target

  fixTextAlignment: (el) ->
    if /^[א-ת]/.test(el.text())
      el.css('direction', 'rtl')
  
$ ->
  window.better = new BetterKanbanflow()
