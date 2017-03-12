$(document).ready ->
  $('.step .continue.button').on 'click', ->
    parent = ($(this).parents '.step')[0];

    $(parent).toggleClass 'hidden';
    $($(parent).next()).toggleClass 'hidden';

    current = $('.ui.steps .active.step');
    current.addClass 'completed';
    current.next().removeClass 'disabled';
    toggle_active current

    #$('form.segment.hidden')

  $('.step .previous.button').on 'click', ->
    parent = ($(this).parents '.step')[0];

    $(parent).toggleClass 'hidden';
    $($(parent).prev()).toggleClass 'hidden';

    current = $('.ui.steps .active.step');
    toggle_active current, true

  $('input[type="text",readonly="readonly"]').on 'click focus', ->
    $(this).select()
    document.execCommand("copy")

toggle_active = (current, prev) =>
  current.toggleClass 'active';
  if prev
    current.prev().toggleClass 'active';
  else
    current.next().toggleClass 'active';
