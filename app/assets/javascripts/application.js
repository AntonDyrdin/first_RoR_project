//= require rails-ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){
	$(".todo_text").click(function(){
		if($(".todo_text").val()=="Название задачи...")
			$(".todo_text").attr("value","");
	});
	
	$('.todo_row[data-isChecked="true"]').attr("style","height: 30px;width: 30px;border: 1px solid #D2D2D2;margin: 20px;background-color: #54AEDA;")
	$('.todo_row[data-isChecked="false"]').attr("style","height: 30px;width: 30px;border: 1px solid #D2D2D2;margin: 20px;");
	
	$('.todo_row_text[data-isChecked="true"]').attr("style","text-decoration: line-through");
	$('.todo_row_text[data-isChecked="false"]').attr("style","");
});


function plusOnClick(){
	
	$('#mask').show();
	$('#mask').attr("style","display: flex;align-items: center;justify-content: center;");
}


function OnOkClick(){
	var text=$(".todo_text").val();
	if(text!=""&&text!="Название задачи..."){
		var project=$(".project_selector").val()
		$.ajax({
			type: 'POST',
			dataType : "json",
			contentType: "application/json; charset=utf-8",
			url: 'projects/create',
			data:  "{\"text\":\""+text+"\",\"project\":\""+project+"\"}"
		});
		window.location.reload();
	}
	else
	{	
		$('#mask').hide();
	}
}

function onCancleClick(){
	$('#mask').hide();
}

function done(id) {
	var todo_id=$("#"+id).attr("data-todoid");

	if($("#check_box"+todo_id).attr("data-isChecked")=="true")
	{	
		$.ajax({
			type: 'POST',
			dataType : "json",
			contentType: "application/json; charset=utf-8",
			url: 'projects/update',
			data:  "{\"todo_id\":\""+todo_id+"\",\"isCompleted\":\"false\"}"
		});
			//убрать галочку
			$("#check_box"+todo_id).attr("style","height: 30px;width: 30px;border: 1px solid #D2D2D2;margin: 20px;");
		//убрать зачёркивание
		$("#todo_text"+todo_id).attr("style","");

		$("#check_box"+todo_id).attr("data-isChecked","false")
	}
	else
	{
		$.ajax({
			type: 'POST',
			dataType : "json",
			contentType: "application/json; charset=utf-8",
			url: 'projects/update',
			data: "{\"todo_id\":\""+todo_id+"\",\"isCompleted\":\"true\"}"
		});
		//поставить галочку
		$("#check_box"+todo_id).attr("style","height: 30px;width: 30px;border: 1px solid #D2D2D2;margin: 20px;background-color: #54AEDA;");
		//зачеркнуть
		$("#todo_text"+todo_id).attr("style","text-decoration: line-through");

		$("#check_box"+todo_id).attr("data-isChecked","true")
	}
}
