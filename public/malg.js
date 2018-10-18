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
  var burned_assigRow = -1;
  var burned_assigColumn = -1;
  var stopall = false;
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
    addStep(' Como se puede observar, se agregaron campos extra para ingresar la oferta/demanda.');addTable();
    //algdev = algdev +'<table id="DataFab"  class="table table-bordered"><thead><tr></tr></thead><tr class="headerColumn"></tr><tr ng-repeat="datum in data"><th width="50px">F{{$index}} </th><td ng-repeat="field in datum"><p type="text" style="background-color: {{field.cellcolor}}"ng-model="field.costo"s>{{field.costo}}</p></td></tr></table>'; 
    $( ".btnDP").hide();
    $( ".btnD3").show();
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
            }
        $scope.doAssigment = function (){
          addStep(' Se prosigue a realizar el balance entre el total de las fabricas y bodegas <b>('+tfg+' (Fabricas) / '+bfg+' (Bodegas)</b>).');addTable();
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
             columns++;$scope.data[rows][0].valor = tfg-bfg;$scope.doBalance(); addTable(); 
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
              $scope.data.splice(rows,0,newrow); rows++;$scope.data[rows-1][columns].valor = bfg-tfg;$scope.doBalance();addTable();  
            }                     

              for( var i = 0; i < columns ; i++ ){
                columnastxt = columnastxt + "<th>B" + i + "</th>";
                for (var j = 0; j < rows; j++){   
                df =  parseFloat($scope.data[j][columns].valor);
                db =  parseFloat($scope.data[rows][i].valor);  
                console.log("Renglon: " + $scope.data[j][i].valor + " r#" + i+", c#" + j + "\n Demanda F: " + df + " . DB: " + db );
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
                   // console.log("El valor mas pequeño es : " + getShippestCell(rows,i));                                      
                }  
                              
              }
              addStep('<b>Este es el resultado final</b>');
              addTable();
              doOptimization(columns,rows);
              $('.headerColumn').append(columnastxt);
              $('#PleccionR').append(algdev);
        }
        
        function doOptimization(columns,rows){//First step to Optimization.
          var passed = false;var opttries=0;
          if(stopall == true){}
          else{
          for(var c=0;c<columns-1;c++){
          for(var r=0;r<rows-1;r++){
            if($scope.data[r][c].costo || $scope.data[r][c].costo == 0){
              if($scope.data[r][c].costo.toString().trim()=="")
                {$scope.data[r][c].costo == null;console.log("I made clean");} 
            }
          }
          }
          casillas_asignadas = LookForAssigned(columns,rows);
          console.log("Optimization");              
          opttries++;
          addStep('<hr><h1>Optimización</h1><b>¿NF + NC -1 <= # casillas asignadas?</b><br><center>' + (rows + columns -1)+ "<="+ casillas_asignadas + '</center>');
          if((rows + columns -1) <= casillas_asignadas){ 
          addStep('<b style="color:#16b73b;">Es una solución no degenerada</b>')
          addStep('<hr><h3>Método MODI</h3>');
          addStep("Se continuará con la implementación del método MODI. Se agregaran campos extra para obtener los elementos para las formulas del algoritmo MODI.");
          if(stopall == false){doModi();}
          }
          else{addStep('<b style="color:#ea1221;">Es una solución degenerada</b>');
          var dif_ca = (rows + columns -1) - casillas_asignadas;   
          if(stopall == false){doassignZero(columns,rows,dif_ca);}
          }   
         }                  
        }
        function LookForAssigned(columns,rows){
          var temp_assigned = 0;
          console.log("LookForAssigned: "+ columns + "/" + rows);
          for(c=0;c<columns;c++){
            for(r=0;r<rows;r++){ 
              console.log("LookForAssigned c: " +$scope.data[r][c].costo  ); 
               if($scope.data[r][c].costo || $scope.data[r][c].costo == 0)
              {
                if($scope.data[r][c].costo.toString()!="")
                {temp_assigned++;}
              }
            }
          }
          console.log("ASIGNADAS: " + temp_assigned);
          if(temp_assigned<3){stopall=true;}
          return temp_assigned;
        }
        function doassignZero(columns,rows,dif_ca){
          var continue_cell = 0;
          var continue_try = 0;
          //cleanZero(columns,rows);
          console.log("Do 0 c" + columns +" / r"+ rows + ". DIF: " + dif_ca);
          console.log("QUEMADAS: r" + burned_assigRow + " c:" + burned_assigColumn);
          var c,r,ci,ri;
          for(var i=1; i<=dif_ca;i++){            
          for(c=0;c<columns;c++){
            for(r=0;r<rows;r++){
              if($scope.data[r][c].costo || $scope.data[r][c].costo == 0)
              {console.log(" r" + r +" / c"+ c + ":" + $scope.data[r][c].costo );
                //if($scope.data[r][c].costo == "0"){$scope.data[r][c].costo = "";}
              }
              else{
                console.log("Vacia r" + r +" / c"+ c);
                var cell_available = 0;
                /*Buscar columnas hermanas*/
                for(ci=0;ci<columns;ci++){
                  if($scope.data[r][ci].costo)
                  {console.log($scope.data[r][ci].costo);cell_available=1;}
                }
                /*Buscar renglones hermanos*/
                for(ri=0;ri<rows;ri++){
                  if($scope.data[ri][c].costo)
                  {console.log($scope.data[ri][c].costo);cell_available=1;}
                }                 

                if(cell_available==1 && 
                  (burned_assigRow < r && burned_assigColumn < c )){
                  console.log("r" + r +"/c"+c);
                  $scope.data[r][c].costo = 0.0;
                  var continue_cell = 1;
                  console.log("Se agrego 0 en r:" + r + ", c: " + c);
                  r=rows;
                }
                /*if(burned_assigRow == r && burned_assigColumn == c )
                {burned_assigRow = -1; burned_assigColumn = -1; }*/

                if(continue_cell == 1){c=columns;          
                 addStep("Se agrego una casilla con 0");
                  if(modiMaded==0){addTable();}else{addTableOpt();}}
                
              }    
            }          
          }
        }          
          doOptimization(columns,rows);
        }
        function cleanZero(columns,rows){
          var continue_cell = 0;
          var continue_try = 0;
          //console.log("Do 0 c" + columns +" / r"+ rows + ". DIF: " + dif_ca);
          var c,r,ci,ri;                     
          for(c=0;c<columns;c++){
            for(r=0;r<rows;r++){
              if($scope.data[r][c].costo)
              {console.log(" r" + r +" / c"+ c + ":" + $scope.data[r][c].costo );
              }
              else if($scope.data[r][c].costo == 0){
                burned_assigRow = r; burned_assigColumn = c; 
                $scope.data[r][c].costo = null;}
              else{                              
              }    
            }          
          }
        
          //doOptimization(columns,rows);
        }
        function doModi(){
          //R+C+CCA = 0  
          if(stopall == true){}
          else{                
          if(modiMaded<20){  
          addStep("Primero implementaremos la formula para las casillas asignadas, a fin de obtener los valores de columnas y renglones en las casillas auxiliares.<br><center><b>R + C + C.C.A = 0 </b><br>CCA=Costo de la casilla asignada</center>");
          if (modiMaded == 0){ addRowColumn();}modiMaded++;
          var rows; var columns;
          $scope.data.forEach(function($row){
            columns =  $row.length - 1;
          });
          rows =  $scope.data.length - 1;
         // columns++;rows++;
          var high= getFullest(columns,rows);
          var highindex = high.substring(1,high.length);
          if(high.substring(0,1)=="C"){
            addStep("Se ha escogido la bodega con mas casillas asignadas");
            $scope.data[rows][highindex].valor = 0;
          }else if(high.substring(0,1)=="C"){
            addStep("Se ha escogido la fábrica con mas casillas asignadas");
            $scope.data[highindex][columns].valor = 0;
          }else{
            addStep("Se ha escogido la primer fábrica");
            $scope.data[0][columns].valor = 0;
          }
          addTableOpt();
          if(stopall == false){assignAssigned(columns,rows);}
          var continueModi;
          if(stopall == false){addStep("A continuación, implementaremos la formula para las casillas NO asignadas, a fin de verificar nuestra solución.<br><center><b>R + C + C.C.V = ? </b><br>CCA=Costo de la casilla vacía</center>");}
          if(stopall == false){continueModi= assignNotAssigned(columns,rows);}
          if(continueModi == 0){
            addStep("<hr><center><h3 style='color:#52c8e5;'>Este es el resultado final. Es una solución óptima.</h3></center><hr>");
            addTableOpt();
            stopall = true;
          }
          else{
            if(stopall == false){addStep("<center>Se continuará con el cruce del arrollo, para ajustar el resultado.</center>")
            doRiverCross(columns,rows); }//not yet
          }
          //alert('Columns: ' + columns + ' ,Rows:' +rows);
          //R+C+CCV = ?
          }else{
             var rows; var columns;
             $scope.data.forEach(function($row){columns =  $row.length - 1;});rows =  $scope.data.length - 1;
            addStep("Es un ejercicio muy largo");
                for(c=0;c<=columns;c++){
                    for(r=0;r<=rows;r++){
                      if(c==columns || r==rows){$scope.data[r][c].valor = "";}
                    }
                  }
                //cleanZero(columns-1,rows-1);
                //doOptimization(columns-1,rows-1);
            }
         }
        }
        /*MODI EN CASILLAS ASIGNADAS*/
        function assignAssigned(columns,rows){
          var assignedcounter = 0;
          var assignedtries = 0;
          for(var c=0;c<columns-1;c++){
            for(var r=0;r<rows-1;r++){
              if($scope.data[r][c].costo || $scope.data[r][c].costo == 0){
                var rowV= $scope.data[r][columns].valor.toString();
                var columnV = $scope.data[rows][c].valor.toString();
                var CCA = $scope.data[r][c].valor;
                if ((rowV =="" || columnV=="" )&& !(rowV =="" && columnV=="")){
                 addStep(rowV + " (R) + " + columnV + " (C)+ " + CCA + " (CCA) = 0" + " R" + r + "C" +c);                
                if(rowV=="" && rowV!="0" ){
                  addStep("<b>Se agrego el valor de esta Bodega</b>"
                     + rowV+" (R) = -(" + columnV + " (C)+ " + CCA + " (CCA))");
                  $scope.data[r][columns].valor = -(parseInt(columnV)+parseInt(CCA));
                  rowV= $scope.data[r][columns].valor.toString();
                  columnV = $scope.data[rows][c].valor.toString();
                }
                //addStep("a. " +rowV + " (R) + " + columnV + " (C)+ " + CCA + " (CCA) = 0" + " R" + r + "C" +c);
                if(columnV =="" && columnV !="0"){
                  addStep("<b>Se agrego el valor de esta Fabrica</b>"
                    + columnV+" (C) = -(" + rowV + " (R)+ " + CCA + " (CCA))");
                  $scope.data[rows][c].valor = -(parseInt(rowV)+parseInt(CCA));
                  rowV= $scope.data[r][columns].valor.toString();
                  columnV = $scope.data[rows][c].valor.toString();
                }
                assignedcounter++;
                }
                $scope.data[r][c].cellcolor ="#9cff3f";
                addTableOpt();
                $scope.data[r][c].cellcolor ="#fff";
              }
              //console.log("assigned r" + r + "/c"+c + "   -r" + rows + "c " + columns);
              if(c == columns-2 && r == rows-2){if(assignedcounter<casillas_asignadas){
              console.log("No he asignado todo");
              assignedtries++;
                  if(assignedtries>5){c=columns;r=rows; console.log("Oportunidades agotadas");
                  for(c=0;c<=columns;c++){
                    for(r=0;r<=rows;r++){
                      if(c==columns || r==rows){$scope.data[r][c].valor = "";}
                    }
                  }
                cleanZero(columns-1,rows-1);
                doOptimization(columns-1,rows-1);
              }else{ c=-1; console.log("Asignar de nuevo");}
              //doassignZero(columns-1,rows-1);
             
            }}
            }
            
          }
        }
        /*MODI EN CASILLAS ASIGNADAS*/
        function assignNotAssigned(columns,rows){
          var correction = 0;
          for(var c=0;c<columns-1;c++){
            for(var r=0;r<rows-1;r++){
              if($scope.data[r][c].costo || $scope.data[r][c].costo == 0){
                if($scope.data[r][c].costo.toString().trim()==""){
                var rowV= $scope.data[r][columns].valor;
                var columnV = $scope.data[rows][c].valor;
                var CCA = $scope.data[r][c].valor;
                var result = parseFloat(rowV) + parseFloat(columnV) + parseFloat(CCA);
                if (result>=0){
                 addStep(" R" + r + "C" +c + ": <b>" +
                  rowV + " (R) + " + columnV + " (C)+ " + CCA + " (CCA) = " + result +"</b>");}
                 else{correction=1;
                  addStep(" R" + r + "C" +c + ": <b style='color:red;'>" +
                  rowV + " (R) + " + columnV + " (C)+ " + CCA + " (CCA) = " + result + "</b>"  );
                 }
                //I no have time to make this in a  correct way
                }


              }else{
                var rowV= $scope.data[r][columns].valor;
                var columnV = $scope.data[rows][c].valor;
                var CCA = $scope.data[r][c].valor;
                var result = parseFloat(rowV) + parseFloat(columnV) + parseFloat(CCA);
                if (result>=0){
                 addStep(" R" + r + "C" +c + ": <b>" +
                  rowV + " (R) + " + columnV + " (C)+ " + CCA + " (CCA) = " + result +"</b>");}
                 else{correction=1;
                  addStep(" R" + r + "C" +c + ": <b style='color:red;'>" +
                  rowV + " (R) + " + columnV + " (C)+ " + CCA + " (CCA) = " + result + "</b>"  );
                 }
                //Print optional
              }
            }
          }
          return correction;
        }
      function doRiverCross(columns,rows){
      //This is a correction of the original River cross, now based on lists.
      var searchWay = "C";//Pivote of Search Direction
      var continue_doRiver = true;//To keep the cycle on
      successRC = false;//To make sure the River Cross
      $scope.sequence=[];
      $scope.scopetempA=[];//Now the unique, Asc
      $scope.scopetempD=[];
      $scope.tempA=[];//Now unique way, Asc. To save the List of comp.
      $scope.tempD=[];
      $scope.tempSuck=[];//The garbage and undesireds cells.
      var auxr=-1, auxc=-1;
      //First make clean of empty cells.
      for(var c=0;c<columns-1;c++){
            for(var r=0;r<rows-1;r++){
              if($scope.data[r][c].costo || $scope.data[r][c].costo == 0){
                if($scope.data[r][c].costo.toString().trim()=="")
                  {$scope.data[r][c].costo == null;console.log("I made clean");} 
              }
            }
      }
      //Now search our desired values and fill the tempA. ASC 
      for(var r=0;r<rows-1;r++){for(var c=0;c<columns-1;c++){
      if($scope.data[r][c].costo || $scope.data[r][c].costo == 0){
        console.log("to tempA:" + $scope.data[r][c].costo);
        var newPath = {'r':r, 'c': c};
        $scope.tempA.push(newPath);console.log(newPath);              
      }
      else if(!$scope.data[r][c].costo || $scope.data[r][c].costo == null)
      {
      var rowV= $scope.data[r][columns].valor;
      var columnV = $scope.data[rows][c].valor;
      var CCA = $scope.data[r][c].valor;
      var result = parseFloat(rowV) + parseFloat(columnV) + parseFloat(CCA);
      if(auxc<0 && result<0){auxr=r; auxc=c;console.log("CROWNED:" + r + "/"+ c);}}//Just evaluate the first negative value.
      }}
      //Now, just ASC to Start.
        //Search Column.
          do{
          var founded = false; //to evaluate if we got the next path in column.
          var avaible_cell = true; //To have something to determinate if the cell is in tempA already or in Suck.
          var searchC = -1;var SearchR =-1;//The column goal and R.
          if($scope.scopetempA.length==0){searchC=auxc;SearchR=auxr;}
          else{searchC=$scope.scopetempA[$scope.scopetempA.length-1].c;
          SearchR=$scope.scopetempA[$scope.scopetempA.length-1].r;}
          console.log("FOUND: " + SearchR + "/" + searchC + ", sw:"+searchWay);
          //The ScopeA to ev if is not already taked
          var cellC=-1, cellR=-1;//This is a temporal var to find the temp cell
    
          for(var s=0; s<$scope.tempA.length;s++){
            //console.log("Look in tempA: " + $scope.tempA[s].r + "/" +$scope.tempA[s].c);
            var founded = false;
            if(searchWay=="C"){console.log("¿" + $scope.tempA[s].c  + "=" + searchC );
              if($scope.tempA[s].c==searchC){founded=true;cellC=$scope.tempA[s].c;cellR=$scope.tempA[s].r;}
            }else{console.log("¿" + $scope.tempA[s].r  + "=" + SearchR );
              if($scope.tempA[s].r==SearchR){founded=true;cellC=$scope.tempA[s].c;cellR=$scope.tempA[s].r;}
            }
            if(founded==true){  
            avaible_cell=true;            
            for(var i=0; i<$scope.scopetempA.length;i++){
              console.log($scope.scopetempA[i].r + "=" + cellR+ "?");
              console.log($scope.scopetempA[i].c + "=" + cellC+ "?");
              if($scope.scopetempA[i].r==cellR && $scope.scopetempA[i].c==cellC)
                {avaible_cell=false;}
            }
            //The ScopeA to ev if is not already taked in SUCK
            for(var i=0; i<$scope.tempSuck.length;i++){
              console.log($scope.tempSuck[i].r + "=" + cellR+ "?SUCK");
              console.log($scope.tempSuck[i].c + "=" + cellC+ "?SUCK");
              if($scope.tempSuck[i].r==cellR && $scope.tempSuck[i].c==cellC)
                {avaible_cell=false;}
            }
            //if(){}
            if(avaible_cell==true){
              console.log("LONG TEMPA:"+ $scope.tempA.length);
              founded=true;s=$scope.tempA.length;//Turn off the search and go to pushit
              var newPath = {'r':cellR, 'c': cellC};
              $scope.scopetempA.push(newPath);console.log("Added to scopetempA:" + cellR + "/" + cellC);
            }else{founded=false;}
           }          
          }
         
         if(searchWay=="C"){searchWay="R";}else{searchWay="C";}//Change the pivote way

         if(founded==false){
          if($scope.scopetempA.length==0){searchWay="R";}
          $scope.scopetempA.pop();//sacarlo de la busqueda
          var newPath = {'r':SearchR, 'c': searchC};console.log("FOUNDED BAD");
          $scope.tempSuck.push(newPath);}
          else{if(searchWay=="R" && $scope.scopetempA.length>2 && cellR==auxr){continue_doRiver=false;}} 
        }while(continue_doRiver==true);
    
        //Fill the sequence Array and Pounder it
        var ponder="-";//Starts in negative at the first cell
        for(var i=0;i<$scope.scopetempA.length;i++){
          var ir=$scope.scopetempA[i].r;var ic=$scope.scopetempA[i].c;
          var newPath = {'r':ir, 'c': ic,'p':ponder, 'costo':$scope.data[ir][ic].costo,'val':$scope.data[ir][ic].valor};
          $scope.sequence.push(newPath);
          if(ponder=="-"){ponder="+";}else{ponder="-";}
        }
        //Add the last 
        var newPath = {'r':auxr, 'c': auxc,'p':"+", 'costo':"",'val':$scope.data[auxr][auxc].valor};
        $scope.sequence.push(newPath);
        addStep("Está es la secuencia de translación con el método del cruce del arroyo.");
        addTableSmall($scope.sequence);
        if($scope.sequence.length >3){modifyTable($scope.sequence,columns,rows);//addTableSmall($scope.sequence);
        }
        else{addStep("Muy corto");}    
      }
        /*Obtenemos el renglon o columna con mas casillas asignadas*/
        function getFullest(columns,rows){
          var higgest = 0; var CR="";var i=0;
          for(var c=0;c<columns-2;c++){
            var tempo=0;
            for(var r=0;r<rows-2;r++){
              if($scope.data[r][c].costo){tempo++;}
              //console.log( 'C'+c+'/R'+r +':'+$scope.data[r][c].valor);
            }
            if(tempo>higgest){higgest=tempo;CR="C";i=c;}
          }
         for(var r=0;r<rows-2;r++){
            var tempo=0;
            for(var c=0;c<columns-2;c++){
            if($scope.data[r][c].costo){tempo++;}
              //console.log( 'R'+r +'/C'+c+':'+$scope.data[r][c].valor);
            }
             if(tempo>higgest){higgest=tempo;CR="R";i=r;}
          }
          console.log("HIGH: " + CR + i+" : " + higgest);
          return CR+i;
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
        //After do the modi
       function modifyTable($global,columns,rows){
        if($global[0]){
        var firsto = parseFloat($global[0].costo);
        $global.forEach(function($box){
          if($box.p == "+"){
            if($scope.data[$box.r][$box.c].costo ==null){$scope.data[$box.r][$box.c].costo = firsto;}else{
            $scope.data[$box.r][$box.c].costo=parseFloat($scope.data[$box.r][$box.c].costo)+firsto;}
          }else{
            var rest = parseFloat($scope.data[$box.r][$box.c].costo)-firsto;
            if(rest==0){$scope.data[$box.r][$box.c].costo=null;}else{
            $scope.data[$box.r][$box.c].costo=rest;}
          }
        });
         for(c=0;c<=columns;c++){
            for(r=0;r<=rows;r++){
               //addStep("R c" + columns + ":"+c +", r"+ rows + ":"+r);
              if(c==columns || r==rows){ $scope.data[r][c].valor = "";}
            }
          }
        addTableOpt();
        doOptimization(columns-1,rows-1);
        }else{//addTableOpt(); 
        addStep("No encontró secuencia");
        addTableOpt();}
      }
       /*angular.forEach($scope.data,function(value,index){
                console.log(value.v);
        })*/
  
  // add a column
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
  function addRowColumn(){
          $scope.data.forEach(function($row){
        $row.push({valor:"",cellcolor: '#f77e7e'})
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
          newrow.push({valor :'',cellcolor: '#f77e7e'} );
        });
        }
        // add the new row at the end of the array 
          $scope.data.push(newrow);
        }

  //--------------------------------FUNCIONES DE TEXTO----------------------------
  function addStep(text){step++;algdev = algdev + '<br><p><b>#'+ step +':</b>'+ text +'</p>'}
  function addTable(){
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
    algdev = algdev + "</table>";
    //algdev = algdev +"<table id='DataFab' class='table table-bordered'><thead><tr></tr></thead><tr class='headerColumn'></tr><tr ng-repeat= datum in"+ $scope.data +  "><th width='50px'>F $index </th><td ng-repeat='field in datum'><p type='text' style='background-color: field.cellcolor' ng-model=field.costo'>"+$scope.data.costo+"</p></td></tr></table>"; 
  }
function addTableOpt(){
  if(stopall == false){
    var rows; var columns;tablehead="<th width='50px'></th>";
     $scope.data.forEach(function($row){
     columns =  $row.length - 1;
     });
    rows =  $scope.data.length - 1;
    algdev = algdev +"<table id='DataFab' class='table table-bordered'><thead><tr><th width='50px'></th>";
    for( var i = 0; i < columns; i++){algdev = algdev + '<th>B' + i + '</th>';}
    algdev = algdev +"<th>BT</th></tr></thead>";
    for( var i = 0; i <= rows ; i++ ){
      if(i==rows-1){algdev = algdev +"<tr><th width='50px'>FT</th>";}
       else if(i==rows){algdev = algdev +"<tr><th width='50px'>F</th>";}
       else{algdev = algdev +"<tr><th width='50px'>F" + (i+1) + "</th>";}
      for (var j = 0; j <= columns; j++){
        if(i==0 && j==columns -1){tablehead = tablehead + '<th>BT</th>';}
        else if(i==0 && j==columns){tablehead = tablehead + '<th>B</th>';}
        else{tablehead = tablehead + '<th>B'+(j+1)+'</th>';}
        if((i==rows) || (j==columns))
        {algdev = algdev +"<td><b>"+$scope.data[i][j].valor+"</b></td>";}
        else if((i==rows -1 && j!=columns) || (j==columns -1 && i!=rows))
        {algdev = algdev +"<td style='background-color:#EFED7A'><b>"+$scope.data[i][j].valor+"</b></td>";}
        else{
        if($scope.data[i][j].costo || $scope.data[i][j].costo == 0 ){algdev = algdev +"<td style='background-color:"+ $scope.data[i][j].cellcolor + ";'><b>"+$scope.data[i][j].costo+"</b>($"+$scope.data[i][j].valor+")</td>";}
        else{algdev = algdev +"<td><b>($"+$scope.data[i][j].valor+"</b>)</td>";}
        }
      }
      algdev = algdev +"</tr>";
    }
    algdev = algdev + "</table>";
    //algdev = algdev +"<table id='DataFab' class='table table-bordered'><thead><tr></tr></thead><tr class='headerColumn'></tr><tr ng-repeat= datum in"+ $scope.data +  "><th width='50px'>F $index </th><td ng-repeat='field in datum'><p type='text' style='background-color: field.cellcolor' ng-model=field.costo'>"+$scope.data.costo+"</p></td></tr></table>"; 
   }
  }
  //Esta es la impresión del cuadrito
  function addTableSmall($global){
    algdev = algdev +"<br><center><table id='DataFab' style='width:100px;' class='table table-bordered'><tr>";
    $global.forEach(function($box){
      algdev = algdev + "<td>";
      algdev = algdev + "R" + $box.r + " C" +$box.c+ ": " + $box.p + $box.costo + "($"+$box.val +")" ;
      algdev = algdev + "</td>";
    });
    algdev = algdev +"</tr>";
    algdev = algdev + "</table></center>";
    //algdev = algdev +"<table id='DataFab' class='table table-bordered'><thead><tr></tr></thead><tr class='headerColumn'></tr><tr ng-repeat= datum in"+ $scope.data +  "><th width='50px'>F $index </th><td ng-repeat='field in datum'><p type='text' style='background-color: field.cellcolor' ng-model=field.costo'>"+$scope.data.costo+"</p></td></tr></table>"; 
  }
  //Esta es la impresión del cuadrito
  function addTableSmall2(row,column,cost,ponder){
    algdev = algdev + "<br><p> Renglón: " + row + ", columna: "+ column +"</p>";
    algdev= algdev  + "<th width='50px'></th>";
    algdev = algdev +"<center><table id='DataFab' style='width:100px;' class='table table-bordered'><thead><tr><th width='50px'>";
    algdev = algdev + ponder + cost;
    algdev = algdev +"</th></tr>";
    algdev = algdev + "</table></center>";
    //algdev = algdev +"<table id='DataFab' class='table table-bordered'><thead><tr></tr></thead><tr class='headerColumn'></tr><tr ng-repeat= datum in"+ $scope.data +  "><th width='50px'>F $index </th><td ng-repeat='field in datum'><p type='text' style='background-color: field.cellcolor' ng-model=field.costo'>"+$scope.data.costo+"</p></td></tr></table>"; 
  }
});



