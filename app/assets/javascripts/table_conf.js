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
  //
  });