
@extends('layouts.app')
@section('extra-css')

@endsection
@section('section')
<div class="content-wrapper">
  <div class="content-header row">
          <div class="content-header-left col-md-6 col-12 mb-2 breadcrumb-new">
            <h3 class="content-header-title mb-0 d-inline-block">Invoice Template</h3>
            <div class="row breadcrumbs-top d-inline-block">
              <div class="breadcrumb-wrapper col-12">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="/order">Order</a>
                  </li>
                  <li class="breadcrumb-item active">Order Details
                  </li>
                  
                </ol>
              </div>
            </div>
          </div>
          <div class="content-header-right col-md-6 col-12">
            <div class="btn-group float-md-right">
              <button class="btn btn-info dropdown-toggle mb-1" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="order_status_button">
                @if($order->status == 0)
                  Pending
                @elseif($order->status == 1)
                Confirmed
                @elseif($order->status == 2)
                Picked Up
                @elseif($order->status == 3)
                In Process
                @elseif($order->status == 4)
                Shipped
                @elseif($order->status == 5)
                Delivered
                @else
                Failed
                @endif
               
              </button>
              <div class="dropdown-menu arrow" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 40px, 0px);">
                <a class="dropdown-item" href="#" onclick="orderStatusChange(0)"><i class="fa fa-calendar-check mr-1"></i> Pending</a>
                <a class="dropdown-item" href="#" onclick="orderStatusChange(1)"><i class="fa fa-calendar-check mr-1"></i> Confirmed</a>
                <a class="dropdown-item" href="#" onclick="orderStatusChange(2)"><i class="fa fa-calendar-check mr-1"></i> Picked Up</a>
                <a class="dropdown-item" href="#" onclick="orderStatusChange(3)"><i class="fa fa-calendar-check mr-1"></i> In Process</a>
                <a class="dropdown-item" href="#" onclick="orderStatusChange(4)"><i class="fa fa-calendar-check mr-1"></i> Shipped</a>
                <a class="dropdown-item" href="#" onclick="orderStatusChange(5)"><i class="fa fa-calendar-check mr-1"></i> Delivered</a>

               
              </div>
            </div>

            
          </div>
        </div>
    <div class="content-body">     
          <div class="content-header row">
        <div class="content-header-left col-md-6 col-12 mb-2">
         
          <div class="row breadcrumbs-top">
            <div class="breadcrumb-wrapper col-12">
          
              <a href="/add-item/{{$order->id}}"><button data-backdrop="false" class="btn btn-success round btn-glow px-2" data-toggle="modal">Add Item</button></a>
            </div>
          </div>
        
              <!-- </div>
              <div class="media-body"> -->
              {{-- <div class="col-md-4">
                <div class="form-group">
                  <label for="projectinput5">Assign Agent</label>
                  <select id="agent" name="agent" class="form-control">
                    <option value="" selected="" disabled="">Select One</option>
                    @foreach ($agent as $agent1)
                    @if($order->agent_id == $agent1->id)
                    <option selected="" value="{{$agent1->id}}">{{$agent1->name}}</option>
                    @else
                    <option value="{{$agent1->id}}">{{$agent1->name}}</option>
                    @endif
                    @endforeach
                  </select>
                  </div>
                  </div>
                  <div class="col-md-4">
                  <button type="button" class="btn btn-primary mr-1" id="addAgent">
                  <i class="la la-check-circle"></i> Apply
                  </button>
                </div> --}}
              
        </div>
   
    </div>

<div class="content-body">
  <section class="card">
    <div id="invoice-template" class="card-body">
      <div id="invoice-company-details" class="row">
      <div class="col-sm-6 col-12 text-center text-sm-left">
        <div class="media row">
          <div class="col-12 col-sm-3 col-xl-2">
            <img src="/image/logo-png.png" alt="company logo" class="mb-1 mb-sm-0" width="100px">
          </div>
          <div class="col-12 col-sm-9 col-xl-10">
            <div class="media-body">
              <ul class="ml-2 px-0 list-unstyled">
                <li class="text-bold-800">U Clean</li>
                <li>12 Al Athmar St,</li>
                <li>Abu Dhabi,</li>
                <li>UAE</li>
            
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-12 text-center text-sm-right">
        <h2>INVOICE</h2>
        <p class="pb-sm-3"># {{$order->id}}</p>
        <ul class="px-0 list-unstyled">
          @if($order->payment_status == 0)
          <li style="color: #FF0000;font-size: 24px;">Balance Due</li>
          <li class="lead text-bold-800">AED {{$order->total}}</li>
          @else
          <li style="color: #32CD32;font-size: 24px;">Paid</li>
          <li class="lead text-bold-800">AED {{$order->total}}</li>
          @endif
        </ul>
      </div>
    </div>
    <div id="invoice-customer-details" class="row pt-2">
      <div class="col-12 text-center text-sm-left">
        <p class="text-muted">Bill To</p>
      </div>
      <div class="col-sm-6 col-12 text-center text-sm-left">
        <ul class="px-0 list-unstyled">
          <!-- <li class="text-bold-800">Mr. Bret Lezama</li>
          <li>4879 Westfall Avenue,</li>
          <li>Albuquerque,</li>
          <li>New Mexico-87102.</li> -->
          @if(!empty($customer))
            <li style="font-size: 14px">{{$customer->name}}</li>
            @if(!empty($address))
            <li><span style="width:100px;" id="tmp_billing_address" style="white-space: pre-wrap;">{{$address->map_title}}<br>{{$address->area}}<br>{{$address->city}}
            </span></li>
            @endif
            <li><span id="tmp_billing_address" style="white-space: pre-wrap;">{{$customer->mobile}}<br>{{$customer->email}}
            </span></li>
          @endif
        </ul>
      </div>
      <div class="col-sm-6 col-12 text-center text-sm-right">
        <p><span class="text-muted">Invoice Date :</span> {{$order->date}}</p>
        <p><span class="text-muted">Terms :</span> Due on Receipt</p>
        <p>
          @if(!empty($order->delivery_option))
          <span class="text-muted">Delivery :</span> {{strtoupper($order->delivery_option)}}
          @endif
          
        </p>
      </div>
    </div>
                <!-- Invoice Items Details -->
                <div id="invoice-items-details" class="pt-2">
                  <div class="row">
                    <div class="table-responsive col-sm-12">
                      <table class="table">
                      <tr style="text-align: center;">
                        <th>Item</th>
                        <th>Laundry</th>
                        <th>Dry Clean</th>
                        <th>Iron</th>
                        <th>Total</th>
                      </tr>
                      @foreach($order_item as $row)
                      <tr style="text-align: center;">
                        <td>
                        @foreach ($item as $item1)
                          @if($item1->id == $row->item_id)
                          {{$item1->name}}
                          @endif
                        @endforeach
                        </td>
                 
                        <td>
                          @if(!empty($row->laundry_qty))
                          {{$row->laundry_price}} * {{$row->laundry_qty}}
                          @else
                          <p>-</p>
                          @endif
                        </td>
                        <td>
                          @if(!empty($row->dry_clean_qty))
                          {{$row->dry_clean_price}} * {{$row->dry_clean_qty}}
                          @else
                          <p>-</p>
                          @endif
                        </td>
                        <td>
                          @if(!empty($row->iron_qty))
                          {{$row->iron_price}} * {{$row->iron_qty}}
                          @else
                          <p>-</p>
                          @endif
                        </td>
                        <td>{{$row->total}}</td>
                      </tr>
                      @endforeach
                      </table>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-7 col-sm-12 text-center text-md-left">
                      <p class="text-muted">Pick Up Date & Time <a href="#" onclick="EditPickupTime({{$order->id}})"><i class="ft-edit"></i></a></p>
                      <ul class="px-0 list-unstyled">
                          <li style="font-size: 14px">{{$order->pickup_date}}</li>
                          <li style="font-size: 14px">{{$order->pickup_time}}</li>
                      </ul>
                    </div> 
                    <div class="col-md-5 col-sm-12">
                      <p class="lead">Calculation</p>
                      <div class="table-responsive">
                        <table class="table">
                          <tbody>
                            <tr>
                              <td>Total</td>
                              
                              @if($order->payment_status == 0)
                              <td style="color: #FF0000;">AED {{$order->total}}</td>
                              @else
                              <td style="color: #32CD32;">AED {{$order->total}}</td>
                              @endif
                            </tr>
                           
                          </tbody>
                        </table>
                      </div>
                      
                    </div>
                  </div>
                </div>
       <div id="invoice-footer">
      <div class="row">
        <div class="col-sm-7 col-12 text-center text-sm-left">
          <button onclick="orderDelete({{$order->id}})" type="button" class="btn btn-danger btn-print btn-lg my-1"><i class="la la-paper-plane-o mr-50"></i>
            Delete</button>
        </div>
        <div class="col-sm-5 col-12 text-center">
          <a target="_blank" href="/order-print/{{$order->id}}">
            <button type="button" class="btn btn-info btn-print btn-lg my-1"><i class="ft-printer mr-50"></i>
            Print Invoice</button></a>
          <button onclick="SendMail({{$order->id}})" type="button" class="btn btn-success btn-print btn-lg my-1"><i class="la la-paper-plane-o mr-50"></i>
            Send
            Invoice</button>
        </div>
      </div>
    </div>
              </div>
              
            </section>
          </div>
    </div>
    
  </div>




<div class="modal fade text-left" id="user_model" tabindex="-1" role="dialog" aria-labelledby="myModalLabel8" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header bg-primary white">
        <h4 class="modal-title white" id="myModalLabel8">Edit Pickup Date & Item</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="user_form" method="post">
          {{ csrf_field() }}
          <input type="hidden" name="order_id">
      <div class="modal-body">

        <div class="form-group row">
          <label class="col-md-3 label-control" for="Item">Weeks</label>
          <div class="col-md-9">
            <select onchange="ChangeTime()" id="weeks" name="weeks" class="form-control">
              <option value="">SELECT</option>
              @foreach($week as $weeks)
              <option value="{{$weeks->id}}">{{$weeks->weeks}}</option>
              @endforeach
            </select>
          </div>
        </div>

        <div class="form-group row">
          <label class="col-md-3 label-control" for="Item">Time</label>
          <div class="col-md-9">
            <select id="time" name="time" class="form-control">
              <option value="">SELECT</option>
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

<script>
// $('#orderStatusChangr').click(function(){
  function orderStatusChange(id){
      $.ajax({
            url:"/changeStatusview",
            method:"get",
            data:{id:"{{$order->id}}",status:id},
            success:function(data){
                toastr.success(data);
               
                if(id==0){
                  $('#order_status_button').html("Pending");
                }
                else if(id==1){
                  $('#order_status_button').html("Confirmed");   
                } 
                else if(id==2){
                  $('#order_status_button').html("Picked Up");
                }
                else if(id==3){
                  $('#order_status_button').html("In Process");
                }
                else if(id==4){
                  $('#order_status_button').html("Shipped");
                }
                else if(id==5){
                  $('#order_status_button').html("Delivered");
                }
                
            }
        })
  }
//     var orderStatus = $('#orderStatus').val();
  
// })
$('#addAgent').click(function(){
    var agent = $('#agent').val();
    $.ajax({
            url:"/assign-agent-view",
            method:"get",
            data:{id:"{{$order->id}}",agent:agent},
            success:function(data){
                toastr.success('Add Agent Successfully', 'Successfully Save');
            }
        });
});

    function SendMail(id){

      $.ajax({
        url : '/invoice-send-mail/'+id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
          toastr.success(data.statusdesc);
        }
      });
    }


function EditPickupTime(id){
    $('#myModalLabel8').text('Edit Pickup Date & Item');
    $('#saveButton').text('Save Change');
    $('input[name=order_id]').val(id);
    $('#user_model').modal('show');
}

function ChangeTime()
{
    var id = $('#weeks').val();
    $.ajax({
    url : '/get-change-weeks-time/'+id,
    type: "GET",
    success: function(data)
    {
        $('#time').html(data);
    }
  });
}


function Save(){
  var formData = new FormData($('#user_form')[0]);
    $.ajax({
      url : '/update-pickup-time',
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
        toastr.success('Successfully Updated');
        location.reload();
      },error: function (data, errorThrown) {
      var errorData = data.responseJSON.errors;
        $.each(errorData, function(i, obj) {
          toastr.error(obj[0]);
        });
      }
    });     
}


function orderDelete(id){
    var r = confirm("Are you sure");
    if (r == true) {
      $.ajax({
        url : '/order-delete/'+id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
          toastr.success('Order Delete Successfully', 'Successfully Delete');
          window.location.href = "/order";
        }
      });
    }
  }
</script>

@endsection