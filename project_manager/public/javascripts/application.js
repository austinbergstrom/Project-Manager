function updateColorExample(select){
  var values = select.value.split(":");
  var div = document.getElementById('projectColorExample');
  div.style.color = values[2];
  div.style.backgroundColor = values[1];
}

var current;

function initializeSlider(){
  if(document.getElementById('slidee') != null){
    var top = $("#slidee").position().top;
    var width = $("#slidee").innerWidth();
    var left = -(width/2);
    $("#slidee").offset({top:top,left:left});
    $("#slider").slider({
      min:0,
      max:100,
      step:1,
      value:50,
      start:function(event, ui){
  //      alert($(this).slider( "option", "value" ));
      },
      slide:function(event, ui){
        var previous = current;
        var val = 0;
        current = $(this).slider( "option", "value" );
        if(current > previous){
          val = -100;
        } else {
          val = 100
        }
        var slidee = $("#slidee");
        var left = slidee.position().left;
        var top = slidee.position().top;
        slidee.offset({top:top,left:left+val});
  //      $("#slidee").offsetLeft = $("#slidee").offsetLeft + 10;
  //      $("#values").append($(this).slider( "option", "value" ));

      },
      change:function(event, ui){
  //      alert($(this).slider( "option", "value" ));

      },
      stop:function(event, ui){
  //      alert($(this).slider( "option", "value" ));

      }
    });
  }
}

function setSelectedHeaderOption(){
  var path = window.location.pathname;
  $("#headerOptions :radio").each(function(){
    var el = $(this);
    if(path == el.attr('href')){
      var widget = el.button("widget");
      widget.attr("aria-pressed", true);
      widget.addClass("ui-state-active");
    }
  });
}

function equalizeProjectDroppableHeight(){
  var proj = document.getElementById('droppable-project');
  var tech = document.getElementById('droppable-technician-container');
  if(proj && tech){
    var techH = tech.offsetHeight;
    var projH = proj.offsetHeight;
    if(techH > projH){
      proj.style.height = (techH)+"px";
      tech.style.height = (techH)+"px";
    } else {
      tech.style.height = (projH)+"px";
      proj.style.height = (projH)+"px";
    }
  }
}

function initializeCalendar(){
  $('#calendar').fullCalendar({
    header:{
      left: 'prevYear, nextYear',
      center:   'title',
      right:  'today,agendaDay,agendaWeek,month,prev,next'
    },
    events: "/home/json_feed",
    eventRender: function(event, element) {
      element.append(event.technicians);
    },
    timeFormat:""
  });
  $(".draggable-technician").draggable({
    revert:true,
    revertDuration:0,
    scroll:true,
    helper: 'clone'
  });
  $("#droppable-project").droppable({
    drop: function(event, ui) {
      var technician_id = ui.draggable.attr('id').split('_')[1];
      var project_id = $(this).attr('project_id');
      $(this)
          .find("#added-technicians")
          .prepend(ui.draggable);
      $.get("/projects/add_technician", {
        project_id:project_id,
        technician_id:technician_id
      });
      ui.draggable.attr('added', 'true');
    }
  });
  $("#droppable-technician-container").droppable({
    drop: function(event, ui) {
      var technician_id = ui.draggable.attr('id').split('_')[1];
      var project_id = $(this).attr('project_id');
      $(this)
          .find("#available-technicians")
          .prepend(ui.draggable);
      $.get("/projects/remove_technician", {
        project_id:project_id,
        technician_id:technician_id
      });
      var spans = document.getElementsByClassName("zoneTechnician");
      for(var i = 0; i < spans.length; i ++){
        if(spans[i].getAttribute('technician_id') == technician_id){
          spans[i].parentNode.removeChild(spans[i]);
        }
      }
      ui.draggable.attr('added', 'false');
    }
  });
}
function initializeZoneDroppables(){
  $(".zone-line-item").droppable({
    drop: function(event, ui) {
      var zone_id = $(this).attr('id').split('_')[1];
      var technician_id = ui.draggable.attr('id').split('_')[1];
      var span_id = 'zone_'+zone_id+'_tech_X'+technician_id;
      if(!document.getElementById(span_id)){
        var project_id = $(this).attr('project_id');
        var span = document.createElement("span");
        var technician_draggable = $('#technician_'+technician_id);
        span.setAttribute('class', 'zoneTechnician');
        span.setAttribute('technician_id', technician_id);
        span.setAttribute('id', span_id);
        span.innerHTML = document.getElementById(ui.draggable.attr('id')).innerHTML + " | ";
        $(this)
            .find(".assignedTechnicians")
            .append(span);
        if(technician_draggable.attr('added') != 'true'){
          $('#added-technicians').prepend(ui.draggable);
          technician_draggable.attr('added', 'true');
        }
      }
    }
  });
}