@extends('layouts.app')
@section('extra-css')
<link rel="stylesheet" type="text/css" href="../../../app-assets/css/vendors.css">
  <link rel="stylesheet" type="text/css" href="../../../app-assets/vendors/css/tables/datatable/datatables.min.css">
  <link rel="stylesheet" type="text/css" href="../../../app-assets/vendors/css/tables/extensions/buttons.dataTables.min.css">
  <link rel="stylesheet" type="text/css" href="../../../app-assets/vendors/css/tables/datatable/buttons.bootstrap4.min.css">
  <link rel="stylesheet" type="text/css" href="../../../app-assets/vendors/css/forms/selects/select2.min.css">
  <style>
  .select2-container--default .select2-selection--multiple {
    width: 100% !important;
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
          <div class="card-header">
            
                <button id="open_model" data-backdrop="false" class="btn btn-success round btn-glow px-2" data-toggle="modal">Create Notification</button>
         
            <div class="heading-elements">
               
              <ul class="list-inline mb-0">
                
                <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li>
                <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                
              </ul>
            </div>
          </div>
          <div class="card-content collapse show">
            <div class="card-body card-dashboard">
             
              <table class="table table-striped table-bordered dataex-html5-selectors">
                <thead>
                  <tr>
                    <th>S.No</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                @php ($x = 0) @endphp
                @foreach($push_notification as $row)
                @php $x++ @endphp
                  <tr>
                    <td>{{$x}}</td>
                    <td>{{$row->title}}</td>
                    <td>{{$row->description}}</td>
                    <td class="text-center">
                    <span class="dropdown">
                      <button id="btnSearchDrop2" type="button" data-toggle="dropdown" aria-haspopup="true"
                      aria-expanded="true" class="btn btn-primary dropdown-toggle dropdown-menu-right"><i class="ft-settings"></i></button>
                      <span aria-labelledby="btnSearchDrop2" class="dropdown-menu mt-1 dropdown-menu-right">            
                        <a href="javascript:void(null)" onclick="Edit({{$row->id}})" class="dropdown-item"><i class="ft-edit"></i> Edit</a>
                        <a href="javascript:void(null)" onclick="Delete({{$row->id}})" class="dropdown-item"><i class="ft-trash-2"></i> Delete</a>
                        
                        <a href="javascript:void(null)" onclick="Send({{$row->id}})" class="dropdown-item">Send</a>
                      </span>
                    </span>
                    </td>
                  </tr>
                @endforeach                  
                </tbody>
                <tfoot>
                  <tr>
                    <th>S.No</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Action</th>
                  </tr>
                </tfoot>
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
          <h4 class="modal-title white" id="myModalLabel8">Create Notification</h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <form id="user_form" method="post">
            {{ csrf_field() }}
            <input type="hidden" name="id">
        <div class="modal-body">
          <div class="form-group row">
            <label class="col-md-3 label-control">Title</label>
            <div class="col-md-9">
              <input type="text" id="title" name="title" class="form-control">
            </div>
          </div>

          <div class="form-group row">
            <label class="col-md-3 label-control">Description</label>
            <div class="col-md-9">
              <textarea id="description" name="description" class="form-control">
              </textarea>
            </div>
          </div>

          <div class="form-group row">
            <label class="col-md-3 label-control" for="userinput5">User Type</label>
            <div class="col-md-9">
              <select onchange="usertype()" id="user_type" name="user_type" class="form-control">
                <option value="0" selected="" >All</option>
                <option value="1">Selected User</option>
              </select>
            </div>
          </div>

          <div class="form-group row" id="usershow">
            <label class="col-md-3 label-control" for="userinput3">Select the User</label>
            <div class="col-md-9">
              <select style="width:100% !imporatnt;" id="user_id" name="user_id[]" class="select2 form-control" multiple="multiple">
                <optgroup label="Select service">
                @foreach ($user as $user1)
                  <option value="{{$user1->id}}">{{$user1->email}}</option>
                @endforeach
                </optgroup>
              </select>
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
  <script src="../../../app-assets/vendors/js/tables/datatable/dataTables.buttons.min.js"
  type="text/javascript"></script>
  <script src="../../../app-assets/vendors/js/tables/datatable/buttons.bootstrap4.min.js"
  type="text/javascript"></script>
  <script src="../../../app-assets/vendors/js/tables/jszip.min.js" type="text/javascript"></script>
  <script src="../../../app-assets/vendors/js/tables/pdfmake.min.js" type="text/javascript"></script>
  <script src="../../../app-assets/vendors/js/tables/vfs_fonts.js" type="text/javascript"></script>
  <script src="../../../app-assets/vendors/js/tables/buttons.html5.min.js" type="text/javascript"></script>
  <script src="../../../app-assets/vendors/js/tables/buttons.print.min.js" type="text/javascript"></script>
  <script src="../../../app-assets/vendors/js/tables/buttons.colVis.min.js" type="text/javascript"></script>
  <script src="../../../app-assets/js/scripts/tables/datatables-extensions/datatable-button/datatable-html5.js"
  type="text/javascript"></script>
  <script src="../../../app-assets/vendors/js/forms/select/select2.full.min.js" type="text/javascript"></script>
<script src="../../../app-assets/js/scripts/forms/select/form-select2.js" type="text/javascript"></script>

<script>
$("#usershow").hide();
  var action_type;
  $('#open_model').click(function(){
    $('#user_model').modal('show');
    action_type = 1;
    $('#saveButton').text('Save');
    $('#myModalLabel8').text('Create Notification');
  })

function usertype(){
  var user_type = $("#user_type").val();
  if(user_type == '1'){
    $("#usershow").show();
  }
  else{
    $("#usershow").hide();
  }
}
    function Save(){
      var formData = new FormData($('#user_form')[0]);
      if(action_type == 1){

        $.ajax({
                url : 'save-notification',
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
                  $('.table').load(location.href+' .table');
                  toastr.success('Notification Store Successfully', 'Successfully Save');
                },error: function (data, errorThrown) {
          var errorData = data.responseJSON.errors;
            //console.log(errorData);
            //console.log(Object.keys(errorData).length);
            $.each(errorData, function(i, obj) {
              //console.log(obj[0]);
              //console.log(i);  
              toastr.error(obj[0]);
          });

                }

        });
      }else{
        $.ajax({
          url : 'update-notification',
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
                  $('.table').load(location.href+' .table');
                  toastr.success('Notification Store Successfully', 'Successfully Updated');
                },error: function (data, errorThrown) {
          var errorData = data.responseJSON.errors;
            //console.log(errorData);
            //console.log(Object.keys(errorData).length);
            $.each(errorData, function(i, obj) {
              //console.log(obj[0]);
              //console.log(i);  
              toastr.error(obj[0]);
          });

                }
      });
      }
      
    }

    function Edit(id){
      
      $.ajax({
        url : 'notification/'+id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
          $('#myModalLabel8').text('Update Notification');
          $('#saveButton').text('Save Change');
          $('input[name=title]').val(data.title);
          $('textarea[name=description]').val(data.description);
          $('input[name=id]').val(data.id);

 if(data.user_type == 1){
    $("#usershow").show();
    get_notification_user(data.id);
  }
  else{
    $("#usershow").hide();
  }

          $('#user_model').modal('show');
          action_type = 2;
        }
      });
    }

function get_notification_user(id)
{
    $.ajax({
        url : '/get_notification_user/'+id,
        type: "GET",
        success: function(data)
        {
           $('#user_id').html(data);
        }
   });
}

     function Delete(id){
      var r = confirm("Are you sure");
      if (r == true) {
      $.ajax({
        url : 'notification-delete/'+id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
          toastr.success('Area Delete Successfully', 'Successfully Delete');
          $('.table').load(location.href+' .table');
        }
      });
    } 
     }

     function Send(id){
          toastr.error('Currently Not Avalaible This Function');
     }
    
</script>


@endsection