@extends('layouts.app')
@section('extra-css')
<link rel="stylesheet" type="text/css" href="../../../app-assets/css/vendors.css">
  <link rel="stylesheet" type="text/css" href="../../../app-assets/vendors/css/tables/datatable/datatables.min.css">
  <style>
  .clickable-Product-row{
    cursor: pointer;
  }
  </style>
@endsection
@section('section')
<div class="content-wrapper">

    <div class="content-body">
          
<section id="column-selectors">
    <div class="row">
      <div class="col-12">

        <div class="card">

          <div class="card-content collapse show">
            <div class="card-body card-dashboard">

              <table class="table table-striped table-bordered zero-configuration">
                <thead>
                  <tr>
                    <th>Customer</th>
                    <th>E-mail</th>
                    <th>Phone</th>  
                     <th>Created_at</th> 
                      <th>update_at</th> 
                    <th>Action</th>  
                  </tr>
                </thead>
                <tbody>

                </tbody>

              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>
    </div>
  </div>



<div class="modal fade text-left" id="user_model" tabindex="-1" role="dialog" aria-labelledby="myModalLabel8"
  aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header bg-primary white">
          <h4 class="modal-title white" id="myModalLabel8">Create Customer</h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <form id="user_form" method="post">
            {{ csrf_field() }}
            <input type="hidden" name="customer_id">
        <div class="modal-body">
          <div class="form-group row">
            <label class="col-md-3 label-control" for="Name">Name</label>
            <div class="col-md-9">
              <input type="text" id="name" name="name" class="form-control" placeholder="Name"
              name="name">
            </div>
          </div>
          <div class="form-group row">
            <label class="col-md-3 label-control" for="Email">Email</label>
            <div class="col-md-9">
              <input type="text" id="email" name="email" class="form-control" placeholder="Email">
            </div>
          </div>
          <div class="form-group row">
            <label class="col-md-3 label-control" for="Mobile">Mobile</label>
            <div class="col-md-9">
              <input type="text" id="mobile" name="mobile" class="form-control" placeholder="Mobile">
            </div>
          </div>
          <div class="form-group row">
            <label id="labelpass" class="col-md-3 label-control" for="Password">New Password</label>
            <div class="col-md-9">
              <input type="password" class="form-control" placeholder="Password" name="password" id="password">
            </div>
          </div>
          
        </div>
      </form>
        <div class="modal-footer">
          <button type="button" class="btn grey btn-outline-secondary" data-dismiss="modal">Close</button>
          <button type="button" onclick="Save()" id="saveButton" class="btn btn-outline-primary">Save changes</button>
        </div>
      </div>
    </div>
  </div>

@endsection
@section('extra-js')


<script src="../../../app-assets/vendors/js/tables/datatable/datatables.min.js" type="text/javascript"></script>
<script>
    var status_id = null;
    $('.customer').addClass('active');
    var orderPageTable = $('.zero-configuration').DataTable(
    {
      processing: true,
      serverSide: true,
      "ajax":'/get-customer',
      columns: [
          { data: 'name', name: 'name' },
          { data: 'email', name: 'email' },
          { data: 'mobile', name: 'mobile' },
          { data: 'created_at', name: 'created_at' },
          { data: 'updated_at', name: 'updated_at' },
          { data: 'action', name: 'action' },
      ],
    });
    </script>

    <script>
// $('#page-reload').click(function(){
//     location.reload();
// });
// $('#orderFilter').click(function(){
//     var orderStatus = $('#orderStatus').val();
//     console.log(orderStatus);
//     var new_url = '/admin/get-customer/'+orderStatus;
//     orderPageTable.ajax.url(new_url).load();
//     //orderPageTable.draw();
// })



function Save(){
    var formData = new FormData($('#user_form')[0]);
    $.ajax({
      url : 'update-customer',
      type: "POST",
      data: formData,
      contentType: false,
      processData: false,
      dataType: "JSON",
      success: function(data)
      {
        console.log(data);                
        $("#user_form")[0].reset();
        $('#user_model').modal('hide');

        var new_url = '/get-customer';
        orderPageTable.ajax.url(new_url).load();
        
        toastr.success('Category Store Successfully', 'Successfully Updated');
      },error: function (data, errorThrown) {
      var errorData = data.responseJSON.errors;
        $.each(errorData, function(i, obj) {
          toastr.error(obj[0]);
        });
      }
  });
}

  function Edit(id){
      $.ajax({
        url : 'edit-customer/'+id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
          $('#myModalLabel8').text('Update Customer');
          $('#saveButton').text('Save Change');
          $('input[name=name]').val(data.name);
          $('input[name=email]').val(data.email);
          $('input[name=mobile]').val(data.mobile);
          $('input[name=customer_id]').val(data.id);
          $('#user_model').modal('show');
          action_type = 2;
        }
      });
    }
</script>


@endsection
