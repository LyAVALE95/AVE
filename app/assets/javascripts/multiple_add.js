/*function addMethod(){
	$.ajax{
	url: '/amethods/count',
    method: 'POST', 
    dataType: 'JSON'
	}	
}*/
$(document).ready(function(){
	var Questioncounter = 0;
	$('.destroyamethods').on('click', function(){
		$.ajax({
			url: '/amethods'+this.parentElement.id,
			type: 'DELETE',
			successs: function(r){

			}
		});
	});

	/*APPEND TEXT BOX FOR QUESTION IN QUIZ */
	$('#btnAddQuestionField').on('click', function(){
		Questioncounter++;
		var tempiddivQ= 'Q' + Questioncounter;
		$("#addquestions").append("<div id='Q"+Questioncounter+"' style='display:inline-block;'>"
		+"<input class='QuestionQuiz col-md-10' id='"+Questioncounter
		+"' style='border-bottom: 5px solid pink;'/>"
		+"<button type='button' class='btnAddQuestionOption col-md-1 btn btn-info' onclick='addOptionQuiz(&#039QO"+Questioncounter+"&#039)'>+</button>"
		+"<button type='button' class='col-md-1 btn btn-danger red'>x</button></div><div id='QO"+Questioncounter+"'></div>");
	});
});
function addOptionQuiz(Pers){
console.log(Pers);
var tempdiv = "#" +Pers;
console.log(tempdiv);
$(tempdiv).append("<input class='QuestionQuiz col-md-10 O"+ Pers
		+"' style='border-bottom: 4px solid light-blue;'/>");
var idq = $(this).parent().prop('class');
}