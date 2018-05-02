/*function addMethod(){
	$.ajax{
	url: '/amethods/count',
    method: 'POST', 
    dataType: 'JSON'
	}	
}*/
$(document).ready(function(){
	var dataId = $('body').data('params-id');
	var Questioncounter = 0;
	$('.destroyamethods').on('click', function(){
		$.ajax({
			url: '/amethods'+this.parentElement.id,
			type: 'DELETE',
			successs: function(r){

			}
		});
	});
	/*SAVE THE QUESTIONS*/
	$('#btnSaveQuestionsAndOptions').on('click', function(){
	for(i=0;i<=Questioncounter;i++){
		var myQ='#Q'+i;
		var myQO='#QO'+i;
		if($(myQ).length){
			$("div" + myQ + " input#"+i).each(function(){
				console.log(this.value);
				$.ajax({
				url: '/questions/',
				type: 'POST',
				contentType: "application/json",
				data: JSON.stringify({
					question: { 
					description: this.value,
					quiz_id: dataId,
					commit: "Create Question"
					}}),
				successs: function(r){
					alert(this.value + '..Guardado');
				}, error: function(error) {
                	alert(error);
                }				               
				});
			});
		}
		$( "div"+ myQO+" input[type=text]").each(function() {
			console.log(this.value);
		});		
	}			
	});
	/*APPEND TEXT BOX FOR QUESTION IN QUIZ */
	$('#btnAddQuestionField').on('click', function(){
		Questioncounter++;
		var tempiddivQ= 'Q' + Questioncounter;
		$("#addquestions").append("<div id='Q"+Questioncounter+"' style='display:inline-block;'>"
		+"<input class='QuestionQuiz col-md-10' id='"+Questioncounter
		+"' style='border-bottom: 5px solid pink;'/>"
		+"<button type='button' class='btnAddQuestionOption btn-floating col-md-1 btn btn-info' onclick='addOptionQuiz(&#039QO"+Questioncounter+"&#039)'>+</button>"
		+"<button type='button' class='col-md-1 btn-floating btn btn-danger red' onclick='removeOption(&#039Q"+Questioncounter+"&#039)'>x</button><div id='QO"+Questioncounter+"'></div></div>");
	});
});
function addOptionQuiz(Pers){
var tempdiv = "#" +Pers;
$(tempdiv).append(
		"<div class='O"+Pers+"' id='O"+Pers+"' style='display:inline-block;'>"
		+"<input type='text' id='QO"+Pers+"' class='QuestionQuiz col-md-10 O"+ Pers
		+"' style='border-bottom: 4px solid light-blue;'/>"
		+"<button type='button' class='col-md-2 btn-floating btn btn-sm btn-danger red' onclick='removeOption(&#039O"+Pers+"&#039)'>x</button></div> ");
var idq = $(this).parent().prop('class');
}
function removeOption(Pers){
var r=confirm('Seguro que desea eliminar?');
	if(r == true){
	var tempdiv = "#" +Pers;
	console.log(tempdiv);
	$(tempdiv).remove();
	}
}