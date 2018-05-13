/*function addMethod(){
	$.ajax{
	url: '/amethods/count',
    method: 'POST', 
    dataType: 'JSON'
	}	
}*/
$(document).ready(function(){

	var tempo = $('#TempId').text();
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
	/*LOOK LAST QUESTION
	$.ajax({
				url: '/questions/getlast',
				type: 'GET',
				contentType: "application/json",
				successs: function(r){
					alert("Get" + r);
				}, error: function(error) {
                	alert("Error" + error);
                }				               
				});*/

	$('#btnSaveQuestionsAndOptions').on('click', function(){
	var QuestionAdded = 0;
	for(i=0;i<=Questioncounter;i++){
		var myQ='#Q'+i;
		var myQO='#QO'+i;
		console.log(lasquestionindex);
		if($(myQ).length){
			$("div" + myQ + " input#"+i).each(function(){
				console.log(this.value);
				QuestionAdded++;
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
					//alert(this.value + '..Guardado');
				}, error: function(error) {
                	//alert(error);
                }				               
				});
			});
		}
		var lasquestionindex = parseInt(tempo) + QuestionAdded;
		/*SAVE OPTIONS TO THAT QUESTION*/
		$( "div"+ myQO+" input[type=text]").each(function() {
			var QOR= $(this).next('p').find('.iscorrect');
			console.log(this.value);
			var thep = $(this).next('p');
			//console.log($(thep).find('.iscorrect').prop('nodeName'));
			//console.log($(this).next().next().next().next().find('.iscorrect').prop('nodeName'));
			if ($(QOR).is(":checked"))
			{
  				QOR = "1";
			}else{
				QOR = "0";
			}
			$.ajax({
				url: '/question_options/',
				type: 'POST',
				contentType: "application/json",
				data: JSON.stringify({
					question_option: { 
					description: this.value,
					question_id: lasquestionindex,
					value: QOR,
					commit: "Create Question"
					}}),
				successs: function(r){
					//alert(this.value + '..Guardado');
				}, error: function(error) {
                	console.log(error);
                }				               
				});
		});				
	}
	});
	
	$('#btnAddQuestionField').on('click', function(){
		Questioncounter++;
		var tempiddivQ= 'Q' + Questioncounter;
		$("#addquestions").append("<div id='Q"+Questioncounter+"' style='display:inline-block;'>"
		+"<input class='QUESTION QuestionQuiz col-md-10' id='"+Questioncounter
		+"' style='border-bottom: 5px solid pink;'/>"
		+"<button type='button' class='btnAddQuestionOption btn-floating col-md-1 btn btn-info' onclick='addOptionQuiz(&#039QO"+Questioncounter+"&#039)'>+</button>"
		+"<button type='button' class='col-md-1 btn-floating btn btn-danger red' onclick='removeOption(&#039Q"+Questioncounter+"&#039)'>x</button><div id='QO"+Questioncounter+"'></div></div>");
	
		});
});
function getNumQ()
{
	//alert($("div" + myQ + " input.QUESTION").length());


}
	/*SAVE THE QUESTIONS*/

function saveQuestionsAndOptions(){
	
}
/*APPEND TEXT BOX FOR QUESTION IN QUIZ */
function addQuestionField(){
	}
function addOptionQuiz(Pers){
var tempdiv = "#" +Pers;
$(tempdiv).append(
		"<div class='O"+Pers+"' id='O"+Pers+"' style='display:inline-block;'>"
		+"<input type='text' id='QO"+Pers+"' class='QuestionQuiz col-md-10 O"+ Pers
		+"' style='border-bottom: 4px solid light-blue;'/>"
		+"<p><label>"
		+ "<input type='radio' class='iscorrect' name='MG"+Pers+"' id='QOR"+Pers+"' /><span>C</span></p>"
		+"<button type='button' class='col-md-3 btn-floating btn btn-sm btn-danger red' onclick='removeOption(&#039O"+Pers+"&#039)'>x</button></div> ");
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
function reloadthisPage(){
	 location.reload();
}