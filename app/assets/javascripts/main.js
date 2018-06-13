$( document ).ready(function() {  
  $('input.autocomplete').autocomplete({
    data: {
      "Lección 1": null,
      "Elementos": null,
      "Mi usuario": null
    },
    limit: 20, // The max amount of results that can be shown at once. Default: Infinity.
    onAutocomplete: function(val) {
      // Callback function when value is autcompleted.
    },
    minLength: 1, // The minimum length of the input for the autocomplete to start. Default: 1.
  });
        

     $( "#mainsearch" )
       .on( "click", function() {
         $( "#search-icon" ).css({ 'color': 'white', 'opacity' : '.4'});
       })
       .mouseleave(function() {
           $( "#search-icon" ).css({ 'color': '#2e2e1f'});
       });
//});
       //Autocomplete

            // Radialize the colors
  /*var scores = new Array;
  var tempparsedcalf;
var getSomeData;
 $.getJSON('/user_quizzes.json', function(data) {
});
console.log(tempparsedcalf);
  //console.log(getSomeData);
  /*var totalcount = scores.length;
  console.log(scores.length);
   for (i = 0; i < totalcount; i++) {
        scores.push([json.scores[i].user1_rating]);
    }*/
    /*
Highcharts.setOptions({
    colors: Highcharts.map(Highcharts.getOptions().colors, function (color) {
        return {
            radialGradient: {
                cx: 0.5,
                cy: 0.3,
                r: 0.7
            },
            stops: [
                [0, color],
                [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
            ]
        };
    })
});

 		// Build the chart
     
Highcharts.chart('container', {
  chart: {
    plotBackgroundColor: null,
    plotBorderWidth: null,
    plotShadow: false,
    type: 'pie'
  },
  title: {
    text: 'Browser market shares in January, 2018'
  },
  tooltip: {
    pointFormat: '{series.score}: <b>{point.percentage:.1f}%</b>'
  },
  plotOptions: {
    pie: {
      allowPointSelect: true,
      cursor: 'pointer',
      dataLabels: {
        enabled: true,
        format: '<b>{point.score}</b>: {point.percentage:.1f} %',
        style: {
          color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
        }
      }
    }
  },
  series: [{
    score: 'Brands',
    colorByPoint: true,
    data: [
  {
    y: 67,
    user_id: 10,
    quiz_id: 9,
    score: 67,
    created_at: '2018-05-17T06:04:31.000Z',
    updated_at: '2018-05-17T06:04:31.000Z',
    url: 'http://localhost:3000/user_quizzes/3.json'
  },
  {
    y: 100,
    user_id: 10,
    quiz_id: 9,
    score: 100,
    created_at: '2018-05-17T06:39:35.000Z',
    updated_at: '2018-05-17T06:39:35.000Z',
    url: 'http://localhost:3000/user_quizzes/4.json'
  }
]
  }]
});*/
        
});

