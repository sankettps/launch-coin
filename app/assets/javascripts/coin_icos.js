jQuery(document).ready(function($) {
	var current_fs, next_fs, previous_fs; //fieldsets
	var left, opacity, scale; //fieldset properties which we will animate
	var animating; //flag to prevent quick multi-click glitches
	$(document).on('click', '.next', function(event) {
	  // $(".next").click(function(){
	  if(animating) return false;
	  animating = true;
	  
	  current_fs = $(this).parent();
	  next_fs = $(this).parent().next();
	  
	  //activate next step on progressbar using the index of next_fs
	  $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
	  
	  //show the next fieldset
	  next_fs.show(); 
	  //hide the current fieldset with style
	  current_fs.animate({opacity: 0}, {
	    step: function(now, mx) {
	      //as the opacity of current_fs reduces to 0 - stored in "now"
	      //1. scale current_fs down to 80%
	      scale = 1 - (1 - now) * 0.2;
	      //2. bring next_fs from the right(50%)
	      left = (now * 50)+"%";
	      //3. increase opacity of next_fs to 1 as it moves in
	      opacity = 1 - now;
	      current_fs.css({'transform': 'scale('+scale+')'});
	      next_fs.css({'left': left, 'opacity': opacity});
	    }, 
	    duration: 800, 
	    complete: function(){
	      current_fs.hide();
	      animating = false;
	    }, 
	    //this comes from the custom easing plugin
	    easing: 'easeInOutBack'
	  });
	});

	$(document).on('click', '.previous', function(event) {
	  // $(".previous").click(function(){
	  if(animating) return false;
	  animating = true;
	  
	  current_fs = $(this).parent();
	  previous_fs = $(this).parent().prev();
	  
	  //de-activate current step on progressbar
	  $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");
	  
	  //show the previous fieldset
	  previous_fs.show(); 
	  //hide the current fieldset with style
	  current_fs.animate({opacity: 0}, {
	    step: function(now, mx) {
	      //as the opacity of current_fs reduces to 0 - stored in "now"
	      //1. scale previous_fs from 80% to 100%
	      scale = 0.8 + (1 - now) * 0.2;
	      //2. take current_fs to the right(50%) - from 0%
	      left = ((1-now) * 50)+"%";
	      //3. increase opacity of previous_fs to 1 as it moves in
	      opacity = 1 - now;
	      current_fs.css({'left': left});
	      previous_fs.css({'transform': 'scale('+scale+')', 'opacity': opacity});
	    }, 
	    duration: 800, 
	    complete: function(){
	      current_fs.hide();
	      animating = false;
	    }, 
	    //this comes from the custom easing plugin
	    easing: 'easeInOutBack'
	  });
	});

	$(document).on('change', '#noOfRound', function(event) {
			// var html = '';
		// for (i = 0; i < $(this).val(); i++) { 
		// 	html += "<div class='container'><div class='col-md-5'><div class='form-group'><div class='input-group date' id='startdatepicker"+i+"'><input type='text' class='form-control' name='coin_ico[rounds]["+i+"][start_date]'/><span class='input-group-addon'><span class='glyphicon glyphicon-calendar'></span></span></div></div></div><div class='col-md-5'><div class='form-group'><div class='input-group date' id='enddatepicker"+i+"'><input type='text' class='form-control' name='coin_ico[rounds]["+i+"][start_date]'/><span class='input-group-addon'><span class='glyphicon glyphicon-calendar'></span></span></div></div></div></div>"
		// }
		$(".release-round").hide();
		$(".release-round input").prop('disabled', true);
		for (i = 1; i <= $(this).val(); i++) {
			$(".round"+i).show();
			console.log($(".round"+i).find('input'))
			$(".round"+i).find('input').prop('disabled', false);
		}


	});
	$('#startdatepicker1').datetimepicker({
		minDate: new Date,
    format: 'DD/MM/YYYY HH:mm'
  });
  $('#enddatepicker1').datetimepicker({
    format: 'DD/MM/YYYY HH:mm',
    useCurrent: false
  });
  $('#startdatepicker1').on('dp.change', function(e) {
    $('#enddatepicker1').data('DateTimePicker').minDate(e.date);
  });
  $('#enddatepicker1').on('dp.change', function(e) {
    $('#startdatepicker1').data('DateTimePicker').maxDate(e.date);
  });

  $('#startdatepicker2').datetimepicker({
		minDate: new Date,
    format: 'DD/MM/YYYY HH:mm'
  });
  $('#enddatepicker2').datetimepicker({
    format: 'DD/MM/YYYY HH:mm',
    useCurrent: false
  });
  $('#startdatepicker2').on('dp.change', function(e) {
    $('#enddatepicker2').data('DateTimePicker').minDate(e.date);
  });
  $('#enddatepicker2').on('dp.change', function(e) {
    $('#startdatepicker2').data('DateTimePicker').maxDate(e.date);
  });

  $('#startdatepicker3').datetimepicker({
		minDate: new Date,
    format: 'DD/MM/YYYY HH:mm'
  });
  $('#enddatepicker3').datetimepicker({
    format: 'DD/MM/YYYY HH:mm',
    useCurrent: false
  });
  $('#startdatepicker3').on('dp.change', function(e) {
    $('#enddatepicker3').data('DateTimePicker').minDate(e.date);
  });
  $('#enddatepicker3').on('dp.change', function(e) {
    $('#startdatepicker3').data('DateTimePicker').maxDate(e.date);
  });
});