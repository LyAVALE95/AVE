// Products Table Angular App
angular.module('productsTableApp', [])

// create a controller for the table
.controller('ProductsController', function($scope){
  // initialize the array
  $scope.showD = "visible";
$scope.widthD = "135px";
$scope.metodoinput="";
var columnastxt="";
var casillas_asignadas = 0;
var tablehead="<th width='50px'></th>";
  var algdev = ""; var step = 0;
  var tfg = 0, bfg=0;
  var modiMaded = 0;
//Total de fabricas y bodegas 

  $scope.data=[[{valor:0}]
               /*,[{valor:"0"}]
               ,[{valor:"0"}]
               ,[{valor:"0"}]*/
               ,[{valor:0}]];

  //Complete Table and disabled buttons.
  $scope.completeTable = function(){
    //$scope. = "red";
    $scope.data.forEach(function($row){
      $row.push({valor:0,cellcolor: '#EFED7A'})
    });
     // create a blank array
    var newrow = [];
     
      // if array is blank add a standard item
      if ($scope.data.length === 0) {
        newrow = [{valor:0}];
      } else {
        // else cycle thru the first row's columns
        // and add the same number of items
        $scope.data[0].forEach(function (row) {
          newrow.push({valor :0,cellcolor: '#EFED7A'} );
        });
      }
    // add the new row at the end of the array 
    $scope.data.push(newrow);
     $scope.showD = "hidden";
     $scope.widthD = "0px";//Agregar el siguiente paso
    //$('#Pleccion').append('<p>Como se puede observar, se agregaron campos extra para ingresar la oferta/demanda. </p>');
    //addStep(' Como se puede observar, se agregaron campos extra para ingresar la oferta/demanda.');addTable();
    //algdev = algdev +'<table id="DataFab"  class="table table-bordered"><thead><tr></tr></thead><tr class="headerColumn"></tr><tr ng-repeat="datum in data"><th width="50px">F{{$index}} </th><td ng-repeat="field in datum"><p type="text" style="background-color: {{field.cellcolor}}"ng-model="field.costo"s>{{field.costo}}</p></td></tr></table>'; 
    $( ".btnDP").hide();
    $( "#goback").show();
    $scope.metodoinput="doBalance()";
    //$('#PleccionR').append(algdev);
  }
  $scope.goBack = function(){
    var rows; var columns;
    $scope.data.forEach(function($row){
      columns =  $row.length - 1;
    });
     rows =  $scope.data.length - 1;

    //console.log(rows + '/'+ columns);
    $scope.data.forEach(function (row) {
      row.splice(columns, 1);
    
      //if no columns left in the row push a blank array
      if (row.length === 0) {
        row.data = [];
      }
    });
     $scope.data.splice( rows, 1);
    // if no rowws left in the array create a blank array
    if ($scope.data.length === 0){
      $scope.data = [];
    }
    $scope.showD = "visible";
    $scope.widthD = "130px";
    $( ".btnDP").show();
    $( ".btnD").show();
    $( ".btnD").attr("disabled", false);
    $( ".btnD3").hide();
    $scope.metodoinput="";
  }
 
  $scope.addColumn = function(){
    //you must cycle all the rows and add a column 
    //to each one
      $scope.data.forEach(function($row){
      $row.push({valor:0})
    });
  };

  // remove the selected column
  $scope.removeColumn = function (index) {
    // remove the column specified in index
    // you must cycle all the rows and remove the item
    // row by row
      $scope.data.forEach(function (row) {
      row.splice(index, 1);
    
      //if no columns left in the row push a blank array
      if (row.length === 0) {
        row.data = [];
      }
    });
  };

  // remove the selected row
  $scope.removeRow = function(index){
    // remove the row specified in index
    $scope.data.splice( index, 1);
    // if no rows left in the array create a blank array
    if ($scope.data.length === 0){
      $scope.data = [];
    }
  };

  //add a row in the array
  $scope.addRow = function(){
    // create a blank array
    var newrow = [];
     
      // if array is blank add a standard item
      if ($scope.data.length === 0) {
        newrow = [{'F':''}];
      } else {
        // else cycle thru the first row's columns
        // and add the same number of items
        $scope.data[0].forEach(function (row) {
          newrow.push({valor :0});
        });
      }
    // add the new row at the end of the array 
    $scope.data.push(newrow);
  };


  //--------------------------------FUNCIONES DE TEXTO----------------------------

});

