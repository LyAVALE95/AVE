 var gtexto;
 function getAlg(texto){
      gtexto = texto;
 }
 function gettheAlg(){
   console.log("T: " + gtexto);
   $("#palg").append(gtexto);
 }
$( document ).ready(function() {
  //Tables
  $('#dataTablestb').DataTable(
     {
        columnDefs: [ {
            targets: [ 0 ],
            orderData: [ 0, 1 ]
        }, {
            targets: [ 1 ],
            orderData: [ 1, 0 ]
        }]
    } );
  $('#dataTablesUserSt').DataTable(
     {
      
        columnDefs: [ {
            targets: [ 0 ],
            orderData: [ 0, 1 ]
        }, {
            targets: [ 1 ],
            orderData: [ 1, 0 ]
        }]
    } );
  //
  });