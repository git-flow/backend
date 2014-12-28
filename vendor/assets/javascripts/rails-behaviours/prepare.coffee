# click:prepare event
#
# This event is psuedo click capture event that event works in
# browsers without DOM Level 3 events. The prepare event is always
# fired before any other click handlers are ran. Calling
# stopPropagation or returning false will prevent the other handlers.
#
# Eventually, if jQuery 2 moves to the standard event and dispatch
# model, all this can go away and we'll just use capture as intended.

# All browsers that support Zepto have addEventListener, we can just
# use native capture here.
dispatchPrepare = (originalEvent) ->
  event = document.createEvent 'Events'
  event[k] = v for k, v of originalEvent
  event.initEvent "#{originalEvent.type}:prepare", true, true

  # Forward event calls back to originalEvent
  combine = (f, g) -> -> f.apply originalEvent; g.apply event
  event.preventDefault = combine originalEvent.preventDefault, event.preventDefault
  event.stopPropagation = combine originalEvent.stopPropagation, event.stopPropagation
  event.stopImmediatePropagation = combine originalEvent.stopImmediatePropagation, event.stopImmediatePropagation

  originalEvent.target.dispatchEvent event
  event.result

window.addEventListener 'click', dispatchPrepare, true
window.addEventListener 'submit', dispatchPrepare, true

