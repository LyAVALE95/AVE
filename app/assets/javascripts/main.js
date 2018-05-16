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
});
       //Autocomplete

            // Radialize the colors
/*Highcharts.setOptions({
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
                      text: 'Rango de aprovechamiento por grupos, 2018 ENE-JUN'
                  },
                  tooltip: {
                      pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                  },
                  plotOptions: {
                      pie: {
                          allowPointSelect: true,
                          cursor: 'pointer',
                          dataLabels: {
                              enabled: true,
                              format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                              style: {
                                  color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                              },
                              connectorColor: 'silver'
                          }
                      }
                  },
                  series: [{
                      name: 'Share',
                      data: [
                          { name: 'Grupo A. ', y: 61.41 },
                          { name: 'Grupo B', y: 11.84 },
                          { name: 'Grupo C', y: 10.85 },
                          { name: 'Grupo de apoyo A', y: 4.67 },
                          { name: 'Asesorías', y: 4.18 },
                          { name: 'Otros', y: 7.05 }
                      ]
                  }]
              });
});

*/