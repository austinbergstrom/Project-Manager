/**
 * Unobtrusive scripting adapter for jQuery
 *
 * Requires jQuery 1.4.3 or later.
 * https://github.com/rails/jquery-ujs
 */

//var current;
//
//function initializeSlider(){
//  var top = $("#slidee").position().top;
//  var width = $("#slidee").innerWidth();
//  var left = -(width/2);
//  $("#slidee").offset({top:top,left:left});
//  $("#slider").slider({
//    min:0,
//    max:100,
//    step:1,
//    value:50,
//    start:function(event, ui){
////      alert($(this).slider( "option", "value" ));
//    },
//    slide:function(event, ui){
//      var previous = current;
//      var val = 0;
//      current = $(this).slider( "option", "value" );
//      if(current > previous){
//        val = 100;
//      } else {
//        val = -100
//      }
//      var slidee = $("#slidee");
//      var left = slidee.position().left;
//      var top = slidee.position().top;
//      slidee.offset({top:top,left:left+val});
////      $("#slidee").offsetLeft = $("#slidee").offsetLeft + 10;
////      $("#values").append($(this).slider( "option", "value" ));
//
//    },
//    change:function(event, ui){
////      alert($(this).slider( "option", "value" ));
//
//    },
//    stop:function(event, ui){
////      alert($(this).slider( "option", "value" ));
//
//    }
//  });
//}

$(document).ready(function() {


//  initializeSlider();


  $('#calendar').fullCalendar({
    header:{
      left: 'prevYear, nextYear',
      center:   'title',
      right:  'today,agendaDay,agendaWeek,month,prev,next'
    },
    events: "/home/json_feed",
    eventRender: function(event, element) {
      element.append(event.technicians);
//        element.qtip({
//            content: event.technicians
//        });
    }

    // put your options and callbacks here
  });
  $(".draggable-technician").draggable({
    revert:true,
    revertDuration:0
  });
  $("#droppable-project").droppable({
    drop: function(event, ui) {
      var technician_id = ui.draggable.attr('id').split('_')[1];
      var project_id = $(this).attr('project_id');
      $(this)
          .find("#added-technicians")
          .append(ui.draggable);
      $.get("/projects/add_technician", {
        project_id:project_id,
        technician_id:technician_id
      });
    }
  });
  $("#droppable-technician-container").droppable({
    drop: function(event, ui) {
      var technician_id = ui.draggable.attr('id').split('_')[1];
      var project_id = $(this).attr('project_id');
      $(this)
          .find("#available-technicians")
          .append(ui.draggable);
      $.get("/projects/remove_technician", {
        project_id:project_id,
        technician_id:technician_id
      });
    }
  });
});

(function($) {
  // Triggers an event on an element and returns the event result
  function fire(obj, name, data) {
    var event = new $.Event(name);
    obj.trigger(event, data);
    return event.result !== false;
  }

  // Submits "remote" forms and links with ajax
  function handleRemote(element) {
    var method, url, data,
        dataType = element.attr('data-type') || ($.ajaxSettings && $.ajaxSettings.dataType);

    if (element.is('form')) {
      method = element.attr('method');
      url = element.attr('action');
      data = element.serializeArray();
      // memoized value from clicked submit button
      var button = element.data('ujs:submit-button');
      if (button) {
        data.push(button);
        element.data('ujs:submit-button', null);
      }
    } else {
      method = element.attr('data-method');
      url = element.attr('href');
      data = null;
    }

    $.ajax({
      url: url, type: method || 'GET', data: data, dataType: dataType,
      // stopping the "ajax:beforeSend" event will cancel the ajax request
      beforeSend: function(xhr, settings) {
        if (settings.dataType === undefined) {
          xhr.setRequestHeader('accept', '*/*;q=0.5, ' + settings.accepts.script);
        }
        return fire(element, 'ajax:beforeSend', [xhr, settings]);
      },
      success: function(data, status, xhr) {
        element.trigger('ajax:success', [data, status, xhr]);
      },
      complete: function(xhr, status) {
        element.trigger('ajax:complete', [xhr, status]);
      },
      error: function(xhr, status, error) {
        element.trigger('ajax:error', [xhr, status, error]);
      }
    });
  }

  // Handles "data-method" on links such as:
  // <a href="/users/5" data-method="delete" rel="nofollow" data-confirm="Are you sure?">Delete</a>
  function handleMethod(link) {
    var href = link.attr('href'),
        method = link.attr('data-method'),
        csrf_token = $('meta[name=csrf-token]').attr('content'),
        csrf_param = $('meta[name=csrf-param]').attr('content'),
        form = $('<form method="post" action="' + href + '"></form>'),
        metadata_input = '<input name="_method" value="' + method + '" type="hidden" />';

    if (csrf_param !== undefined && csrf_token !== undefined) {
      metadata_input += '<input name="' + csrf_param + '" value="' + csrf_token + '" type="hidden" />';
    }

    form.hide().append(metadata_input).appendTo('body');
    form.submit();
  }

  function disableFormElements(form) {
    form.find('input[data-disable-with]').each(function() {
      var input = $(this);
      input.data('ujs:enable-with', input.val())
          .val(input.attr('data-disable-with'))
          .attr('disabled', 'disabled');
    });
  }

  function enableFormElements(form) {
    form.find('input[data-disable-with]').each(function() {
      var input = $(this);
      input.val(input.data('ujs:enable-with')).removeAttr('disabled');
    });
  }

  function allowAction(element) {
    var message = element.attr('data-confirm');
    return !message || (fire(element, 'confirm') && confirm(message));
  }

  $('a[data-confirm], a[data-method], a[data-remote]').live('click.rails', function(e) {
    var link = $(this);
    if (!allowAction(link)) return false;

    if (link.attr('data-remote')) {
      handleRemote(link);
      return false;
    } else if (link.attr('data-method')) {
      handleMethod(link);
      return false;
    }
  });

  $('form').live('submit.rails', function(e) {
    var form = $(this);
    if (!allowAction(form)) return false;

    if (form.attr('data-remote')) {
      handleRemote(form);
      return false;
    } else {
      disableFormElements(form);
    }
  });

  $('form input[type=submit], form button[type=submit], form button:not([type])').live('click.rails', function() {
    var button = $(this);
    if (!allowAction(button)) return false;
    // register the pressed submit button
    var name = button.attr('name'), data = name ? {name:name, value:button.val()} : null;
    button.closest('form').data('ujs:submit-button', data);
  });

  $('form').live('ajax:beforeSend.rails', function(event) {
    if (this == event.target) disableFormElements($(this));
  });

  $('form').live('ajax:complete.rails', function(event) {
    if (this == event.target) enableFormElements($(this));
  });
})(jQuery);
