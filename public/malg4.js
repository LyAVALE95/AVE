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
    $( "#dobalance").show();
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
    $( "#dobalance").hide();
    $scope.metodoinput="";
  }
 $scope.doBalance = function(){
    //$scope.data[0,0].push({valor :'0',cellcolor: '#EFED7A'} );
            //$('#PleccionR').html('');
            //console.log($scope.data);
            var nf = 0; //Numero  de la fábrica
            var tf = 0, bf=0;
            var nb = 0; //Numero de bodega
            //console.log($scope.data.length);
            angular.forEach($scope.data,function(value,index){
                
                var long = value.length;
                for(i = 0; i< long;i++) {//var i in value
                 if ((index + 1 ) < $scope.data.length ) {
                  if (i == long -1 ){ nf++;
                  //$('#PleccionR').append('<p>La oferta de la Fábrica #' + nf + ' es ' +  value[i].valor + '</p>');
                  tf = tf +  parseInt(value[i].valor);
                }      
                  }
                  else{                    
                    if(i < long -1){ nb++;
                     //$('#PleccionR').append('<p>La demanda de la Bodega #' + nb + ' es ' +  value[i].valor + '</p>');
                     bf = bf +  parseInt(value[i].valor);
                    }                       
                  }
                }
              });           
            //addStep(' Se prosigue a realizar el balance entre el total de las fabricas y bodegas <b>('+tf+' (Fabricas) / '+bf+' (Bodegas)</b>).');
            //$('#PleccionR').append('<br><p> El balance es '+ tf +'(Fabricas)/'+ bf +'(Bodegas)</p>');

                angular.forEach($scope.data,function(value,index){
                    var columnas = value.length;
                    var renglones = $scope.data.length;
                  angular.forEach(value, function(val, indo) {
                    if ((indo + 1)== columnas && (index + 1 ) == renglones && (tf != 0 && bf != 0)){
                      if(tf==bf){
                      //$('#PleccionR').append('<br><p>Esta balanceado</p>');
                      //addStep('<b style="color:#16b73b;"> Esta balanceado.</b>');addTable();
                      //val.valor = (tf + bf)/2;
                      val.valor = tf +"/"+ bf;
                      val.cellcolor = '#aaf74c';
                      }else
                      {//$('#PleccionR').append('<br><p>NO Esta balanceado</p>');
                      //addStep('<b>No esta balanceado.</b>');addTable();                      
                        //val.valor = (tf + bf)/2;
                        val.valor = tf +"/"+ bf;
                        val.cellcolor = '#EFED7A';
                      }
                    }
                  });
                });
             tfg = tf; bfg=bf;
             //addTable();
            }
   $scope.doAssigment = function (){
          //addStep(' Se prosigue a realizar el balance entre el total de las fabricas y bodegas <b>('+tfg+' (Fabricas) / '+bfg+' (Bodegas)</b>).');addTable();
           //$scope.metodoinput="";
           columnastxt= "<td width='50px'></td>";
           var rows; var columns; var df = 0; var db = 0;
            $scope.data.forEach(function($row){
            columns =  $row.length - 1;
            });
           rows =  $scope.data.length - 1;
        if(tfg==bfg){addStep('<b style="color:#16b73b;"> Esta balanceado.</b>');}
        if(tfg>bfg){
            addStep('<b style="color:#ea1221;">No esta balanceado.</b> Se agrega una bodega ficticia.');
             $scope.data.forEach(function($row){
               $row.splice(0,0,{valor:0, cellcolor: '#e5b5f2'})
              });
             columns++;$scope.data[rows][0].valor = tfg-bfg;//$scope.doBalance(); addTable(); 
            }
             if(bfg>tfg){   
               addStep('<b style="color:#ea1221;">No esta balanceado.</b> Se agrega una fábrica ficticia.');
             //console.log("Mas bodega");     
             var newrow = [];     
             // if array is blank add a standard item
                if ($scope.data.length === 0) {
                  newrow = [{'F':''}];
                } else {
                  // else cycle thru the first row's columns
                  // and add the same number of items
                  $scope.data[0].forEach(function (row) {
                    newrow.push({valor :0, cellcolor: '#e5b5f2'});
                  });
                }
              // add the new row at the end of the array 
              $scope.data.splice(rows,0,newrow); rows++;$scope.data[rows-1][columns].valor = bfg-tfg;//$scope.doBalance();addTable();  
            }                     
            addTable();
                for(var i = 0; i < columns ; i++)
                {
                  columnastxt = columnastxt + "<th>B" + i + "</th>";
                for (var j = 0; j < rows; j++)
                {   
                df =  parseFloat($scope.data[j][columns].valor);
                db =  parseFloat($scope.data[rows][i].valor);  
                if(df==0){ 
                   $scope.data[j][i].cellcolor = "#e8ff9e";
                  addStep('Al llegar a esta celda notamos que la fabrica ya agoto su oferta, por lo que pasamos de ella.');
                  addTable(); $scope.data[j][i].cellcolor='#FFF';
                }//Quemamos la celda
                else if(db==0){
                  $scope.data[j][i].cellcolor = "#e8ff9e";
                  addStep('Al llegar a esta celda notamos que la bodega ya agoto su demanda, por lo que pasamos de ella por completo.');
                  addTable(); $scope.data[j][i].cellcolor='#FFF';
                  j = rows; break;}
                else{ 
                   var smallerindex = parseFloat(getShippestCell(rows,i));
                   //console.log( columns + "C/r. " + rows);             
                   //console.log("Renglon: " + $scope.data[j][i].valor + " r#" + i+", c#" + j + "\n Demanda F: " + df + " . DB: " + db );
                   if(db>df && j==smallerindex){//La demanda de la bodega es mas grande que la de la fabrica
                    //$scope.data[j][i].costo = df;//Asignamos el valor de la bodega a la celda
                    $scope.data[smallerindex][i].costo = df;//Asignamos el valor de la bodega a la celda con el valor de costo mas chiquito
                    $scope.data[rows][i].valor = db-df;
                    $scope.data[rows][i].costo = db-df;
                    $scope.data[smallerindex][columns].costo = 0;
                    $scope.data[smallerindex][columns].valor = 0; j=-1;
                    $scope.data[smallerindex][i].cellcolor = "#e8ff9e";
                    addStep('La demanda de la bodega es mas grande que de la fábrica. Por lo tanto, asignamos la diferencia entre la bodega y la fábrica (valor menor entre bodega-fábrica) a esta celda. El valor resultante de la disyunción entre la bodega y la fábrica es asignado al total de la fábrica.');
                    addTable(); $scope.data[smallerindex][i].cellcolor='#FFF';casillas_asignadas++;
                   }
                   else if(df>db && j==smallerindex){//La demanda de la fabrica es mas grande que la de la bodega
                    //$scope.data[j][i].costo = db;//Asignamos el valor de la fabrica a la celda
                    $scope.data[smallerindex][i].costo = db;//Asignamos el valor de la fabrica a la celda con el valor de costo mas chiquito
                    $scope.data[smallerindex][columns].valor = df-db;
                    $scope.data[smallerindex][columns].costo = df-db;
                    $scope.data[rows][i].valor = 0;j=-1;
                    $scope.data[rows][i].costo = 0;
                    $scope.data[smallerindex][i].cellcolor = "#e8ff9e";
                    addStep('La demanda de la fábrica es mas grande que de la bodega. Por lo tanto, asignamos la diferencia entre la bodega y la fábrica (valor menor entre bodega-fábrica) a esta celda. El valor resultante de la disyunción entre la fábrica y la bodega es asignado al total de la bodega.');
                    addTable(); $scope.data[smallerindex][i].cellcolor='#FFF';casillas_asignadas++;
                   }
                
                   else if(db==df && j==smallerindex){//Son iguales
                    $scope.data[smallerindex][i].costo = df;//Asignamos el valor del que sea
                    $scope.data[rows][i].valor = 0;
                    $scope.data[rows][i].costo = 0
                    $scope.data[smallerindex][columns].valor = 0;j=-1;
                    $scope.data[smallerindex][columns].costo = 0;
                    $scope.data[smallerindex][i].cellcolor = "#e8ff9e";
                    addStep('Son iguales, se toma el primero.');
                    addTable(); $scope.data[smallerindex][i].cellcolor='#FFF';casillas_asignadas++;
                   }
                 }
                }
              }
              addStep('<b>Este es el resultado final</b>');
              addTable();
              $('#PleccionR').append(algdev);
        }
    function getShippestCell(rows,column){
          var smaller = 78124999999999965;//parseFloat($scope.data[0][column].valor);
          var columns = 0;
            $scope.data.forEach(function($row){
            columns =  $row.length - 1;
            });
          var smallerindex = 0; 
          for(var i=0;i<rows;i++){
            var db =  parseFloat($scope.data[i][columns].valor); 
            //console.log("El valor total de este renglon es: " + $scope.data[i][column].valor + ',db:'+ db);
            var value =  parseFloat($scope.data[i][column].valor);
            var costo =  parseFloat($scope.data[i][column].costo);
            if(value<smaller && (!costo) && db>0){smaller = value;smallerindex=i;}  //costo>=0
          }
          return smallerindex;
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
    function addStep(text){step++;algdev = algdev + '<br><p><b>#'+ step +':</b>'+ text +'</p>'}
    function addTable(){
     // $('#PleccionR').text= "";
    var rows; var columns;tablehead="<th width='50px'></th>";
     $scope.data.forEach(function($row){
     columns =  $row.length - 1;
     });
    rows =  $scope.data.length - 1;
    algdev = algdev +"<table id='DataFab' class='table table-bordered'><thead><tr><th width='50px'></th>";
    for( var i = 0; i < columns; i++){algdev = algdev + '<th>B' + i + '</th>';}
    algdev = algdev +"<th>BT</th></tr></thead>";
    for( var i = 0; i <= rows ; i++ ){
      if(i==rows){algdev = algdev +"<tr><th width='50px'>FT</th>";}else{algdev = algdev +"<tr><th width='50px'>F" + (i+1) + "</th>";}
      for (var j = 0; j <= columns; j++){
        if(i==0 && j==columns){tablehead = tablehead + '<th>BT</th>';}else{tablehead = tablehead + '<th>B'+(j+1)+'</th>';}
        if(i==rows || j==columns){algdev = algdev +"<td style='background-color:#EFED7A'><b>"+$scope.data[i][j].valor+"</b></td>";}
        else{
        if($scope.data[i][j].costo || $scope.data[i][j].costo == 0){algdev = algdev +"<td style='background-color:"+ $scope.data[i][j].cellcolor + ";'><b>"+$scope.data[i][j].costo+"</b>($"+$scope.data[i][j].valor+")</td>";}
        else{algdev = algdev +"<td><b>($"+$scope.data[i][j].valor+"</b>)</td>";}
        }
      }
      algdev = algdev +"</tr>";     
    }
     //$('#PleccionR').append(algdev);
  }

});

