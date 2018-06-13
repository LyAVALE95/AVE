
$( document ).ready(function() {        
        $( ".btnD2").hide();
        $( ".btnD3").hide();
});

function completeTableJS() {
        $( ".btnD").attr("disabled", true);
        $( ".btnD").hide();

        numCols = $("#DataFab").find('tr')[0].cells.length;
        //$('#DataFab > thead tr').append('<th> <center> Destinos</center></th>');
        //alert('Total columns : '+numCols);
        $('#Pleccion').html('')
        $('#Pleccion').append('<p>Se prosigue con el desarrollo del método,a fin de completar la oferta y demanda solicitada. </p>');
        //$( ".btnD2").hide();
        //$( ".btnD3").show();
}

