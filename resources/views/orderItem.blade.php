@extends('layouts.app')
@section('extra-css')
<link rel="stylesheet" type="text/css" href="../../../app-assets/css/vendors.css">
<link rel="stylesheet" type="text/css" href="../../../app-assets/vendors/css/tables/datatable/buttons.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="../../../app-assets/vendors/css/forms/selects/select2.min.css">
<link href="{{asset('autocomplete/jquery-ui.min.css')}}" rel="stylesheet" type="text/css">

<link rel="stylesheet" type="text/css" href="/app-assets/vendors/css/forms/icheck/icheck.css">
  <link rel="stylesheet" type="text/css" href="/app-assets/vendors/css/forms/toggle/switchery.min.css">
  <link rel="stylesheet" type="text/css" href="/app-assets/css/plugins/forms/switch.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
@endsection
@section('section')
<div class="content-wrapper">

    <div class="content-body">     
   
<section id="column-selectors">
    <div class="row">
      <div class="col-12">
        
        <div class="card">
          <div class="card-header">
  <div class="dropdown-item">
    <input <?php echo count($order_item) >0 ? 'readonly' :''?> type="checkbox" name="delivery_option" id="delivery_option" class="switchery-xs" <?php echo $order->delivery_option == 'standard' ? '' : 'checked' ?> />
    <input type="hidden" name="delivery_options" id="delivery_options" value="{{$order->delivery_option}}">
    <label for="switchery4" class="card-title ml-1">Express Delievry</label>
  </div>

  <!-- <div class="dropdown-item">
    <input type="checkbox" name="delivery_option" id="delivery_option" class="switchery-xs" />
    <label for="switchery6" class="card-title ml-1">Express Delievry</label>
  </div> -->
          </div>
      
          <div class="card-content collapse show">
            <div class="card-body card-dashboard">
             <div class="table-responsive">
	            <style type="text/css">
	                .table td{
	                     padding: .0rem !important; 
	                }
	                .table th{
	                     padding: .30rem !important; 
	                }

                  .center{
width: 150px;
  margin: 40px auto;
  
}
	            </style>
	      <form method="post" id="form" enctype="multipart/form-data">
	      {{ csrf_field() }}
        <input type="hidden" name="order_id" id="order_id" value="{{$order->id}}">
          <table id="productTable" class="table table-primary table-bordered mb-0">
            <thead class="thead-primary">
              <tr style="text-align: center;">
                  <th style="width: 25%;" >Item Search</th>
                  <th style="width: 20%" >DRY CLEAN</th>
                  <th style="width: 20%" >WASH & IRON</th>
                  <th style="width: 17%" >Iron</th>
                  <th style="width: 15%" >Total</th>
                  <th style="width: 3%;padding: .0rem !important;" >
                    <button type="button" class="btn btn-default" onclick="addRow()" id="addRowBtn" data-loading-text="Loading..."><i class="icon-plus"></i></button>
                  </th>
              </tr>
            </thead>
              <tbody id="productTabletbody">
              @if(empty($order_item))
              <?php for($x = 1; $x <= 1; $x++) { ?>
 <tr value="{{$x}}" id="row{{$x}}">
    <td>
    <br><input class="form-control" type="text" name="item_search[]" id="item_search{{$x}}" autocomplete="off"  />
    <input type="hidden" name="item_id[]" id="item_id{{$x}}" autocomplete="off" class="form-control" />
  </td>

  <td>
    <input type="hidden" name="dry_clean_price[]" id="dry_clean_price{{$x}}">
    <center><label id="label_dry_clean_price{{$x}}">0</label></center>
    <div class="input-group">
      <span class="input-group-btn">
          <button onclick="changeDryCleanMinus({{$x}})" type="button" class="btn btn-danger btn-number"  data-type="minus" data-field="dry_clean_qty{{$x}}">
            <i class="fa fa-minus" aria-hidden="true"></i>
          </button>
      </span>
      <input type="text" name="dry_clean_qty[]" id="dry_clean_qty{{$x}}" class="form-control input-number" value="0" min="0" max="100">
      <span class="input-group-btn">
          <button onclick="changeDryCleanPlus({{$x}})" type="button" class="btn btn-success btn-number" data-type="plus" data-field="dry_clean_qty{{$x}}">
              <span class="icon-plus"></span>
          </button>
      </span>
    </div>
    <center><label id="dry_clean_total{{$x}}">0</label></center>
  </td>

  <td>
    <input type="hidden" name="wash_iron_price[]" id="wash_iron_price{{$x}}">
    <center><label id="label_wash_iron_price{{$x}}">0</label></center>
    <div class="input-group">
      <span class="input-group-btn">
          <button onclick="changeWashIronMinus({{$x}})" type="button" class="btn btn-danger btn-number"  data-type="minus" data-field="wash_iron_qty{{$x}}">
            <i class="fa fa-minus" aria-hidden="true"></i>
          </button>
      </span>
      <input type="text" name="wash_iron_qty[]" id="wash_iron_qty{{$x}}" class="form-control input-number" value="0" min="0" max="100">
      <span class="input-group-btn">
          <button onclick="changeWashIronPlus({{$x}})" type="button" class="btn btn-success btn-number" data-type="plus" data-field="wash_iron_qty{{$x}}">
              <span class="icon-plus"></span>
          </button>
      </span>
    </div>
    <center><label id="wash_iron_total{{$x}}">0</label></center>
  </td>
  <td>
    <input type="hidden" name="iron_price[]" id="iron_price{{$x}}">
    <center><label id="label_iron_price{{$x}}">0</label></center>
    <div class="input-group">
      <span class="input-group-btn">
          <button onclick="changeIronMinus({{$x}})" type="button" class="btn btn-danger btn-number"  data-type="minus" data-field="iron_qty{{$x}}">
            <i class="fa fa-minus" aria-hidden="true"></i>
          </button>
      </span>
      <input type="text" name="iron_qty[]" id="iron_qty{{$x}}" class="form-control input-number" value="0" min="0" max="100">
      <span class="input-group-btn">
          <button onclick="changeIronPlus({{$x}})" type="button" class="btn btn-success btn-number" data-type="plus" data-field="iron_qty{{$x}}">
              <span class="icon-plus"></span>
          </button>
      </span>
    </div>
    <center><label id="iron_total{{$x}}">0</label></center>
  </td>
  
  <td>
    <br><input style="text-align: right;" value="0" type="text" name="total[]" id="total{{$x}}" autocomplete="off" class="form-control" readonly="true" />
  </td>
  <td align="center">
    <br><button id="removeProductRowBtn{{$x}}" class="btn btn-default removeProductRowBtn" type="button" onclick="removeProductRow({{$x}})"><i class="icon-trash"></i></button>
  </td>
</tr>
              <?php } ?>
              @else
<?php $x=1; $sub_total=0; ?>
@foreach($order_item as $row)
<tr value="{{$x}}" id="row{{$x}}">
    <td>
    <br><input value="{{$row->name}}" class="form-control" type="text" name="item_search[]" id="item_search{{$x}}" autocomplete="off"  />
    <input value="{{$row->item_id}}" type="hidden" name="item_id[]" id="item_id{{$x}}" autocomplete="off" class="form-control" />
  </td>

  <td>
    <input value="{{$row->dry_clean_price}}" type="hidden" name="dry_clean_price[]" id="dry_clean_price{{$x}}">
    <center><label id="label_dry_clean_price{{$x}}">{{$row->dry_clean_price}}</label></center>
    <div class="input-group">
      <span class="input-group-btn">
          <button onclick="changeDryCleanMinus({{$x}})" type="button" class="btn btn-danger btn-number"  data-type="minus" data-field="dry_clean_qty{{$x}}">
            <i class="fa fa-minus" aria-hidden="true"></i>
          </button>
      </span>
      <input type="text" name="dry_clean_qty[]" id="dry_clean_qty{{$x}}" class="form-control input-number" value="{{$row->dry_clean_qty}}" min="0" max="100">
      <span class="input-group-btn">
          <button onclick="changeDryCleanPlus({{$x}})" type="button" class="btn btn-success btn-number" data-type="plus" data-field="dry_clean_qty{{$x}}">
              <span class="icon-plus"></span>
          </button>
      </span>
    </div>
    <center><label id="dry_clean_total{{$x}}">{{$row->dry_clean_price * $row->dry_clean_qty}}</label></center>
  </td>

  <td>
    <input value="{{$row->laundry_price}}" type="hidden" name="wash_iron_price[]" id="wash_iron_price{{$x}}">
    <center><label id="label_wash_iron_price{{$x}}">{{$row->laundry_price}}</label></center>
    <div class="input-group">
      <span class="input-group-btn">
          <button onclick="changeWashIronMinus({{$x}})" type="button" class="btn btn-danger btn-number"  data-type="minus" data-field="wash_iron_qty{{$x}}">
            <i class="fa fa-minus" aria-hidden="true"></i>
          </button>
      </span>
      <input type="text" name="wash_iron_qty[]" id="wash_iron_qty{{$x}}" class="form-control input-number" value="{{$row->laundry_qty}}" min="0" max="100">
      <span class="input-group-btn">
          <button onclick="changeWashIronPlus({{$x}})" type="button" class="btn btn-success btn-number" data-type="plus" data-field="wash_iron_qty{{$x}}">
              <span class="icon-plus"></span>
          </button>
      </span>
    </div>
    <center><label id="wash_iron_total{{$x}}">{{$row->laundry_price * $row->laundry_qty}}</label></center>
  </td>
  <td>
    <input value="{{$row->iron_price}}" type="hidden" name="iron_price[]" id="iron_price{{$x}}">
    <center><label id="label_iron_price{{$x}}">{{$row->iron_price}}</label></center>
    <div class="input-group">
      <span class="input-group-btn">
          <button onclick="changeIronMinus({{$x}})" type="button" class="btn btn-danger btn-number"  data-type="minus" data-field="iron_qty{{$x}}">
            <i class="fa fa-minus" aria-hidden="true"></i>
          </button>
      </span>
      <input type="text" name="iron_qty[]" id="iron_qty{{$x}}" class="form-control input-number" value="{{$row->iron_qty}}" min="0" max="100">
      <span class="input-group-btn">
          <button onclick="changeIronPlus({{$x}})" type="button" class="btn btn-success btn-number" data-type="plus" data-field="iron_qty{{$x}}">
              <span class="icon-plus"></span>
          </button>
      </span>
    </div>
    <center><label id="iron_total{{$x}}">{{$row->iron_price * $row->iron_qty}}</label></center>
  </td>
  
  <td>
    <br><input style="text-align: right;" value="{{$row->total}}" type="text" name="total[]" id="total{{$x}}" autocomplete="off" class="form-control" readonly="true" />
  </td>
  <td align="center">
    <br><button id="removeProductRowBtn{{$x}}" class="btn btn-default removeProductRowBtn" type="button" onclick="removeProductRow({{$x}})"><i class="icon-trash"></i></button>
  </td>
</tr>
<?php $x++;
$sub_total = $sub_total + $row->total;
 ?>
@endforeach
              @endif
              </tbody>
              <tfoot>
                <tr>
                      <td>
                        <button type="button" onclick="addRow()" class="btn btn-danger btn-wth-icon icon-wthot-bg btn-sm"><span class="icon-label"><i class="fa fa-plus"></i> </span><span class="btn-text">Add Row</span></button>
                      </td>
                      <td colspan="2"></td>
                      <td style="text-align: center;font-weight: bold;font-size: 18px;">Sub Total</td>
                      <td><input style="text-align: right;" value="{{$sub_total}}" type="text" name="final_total" id="final_total" autocomplete="off" class="form-control" readonly="true" /></td>
                      <td></td>
                  </tr>
              </tfoot>
          </table>
        	</form>
            <hr>
            <button id="btnSave" style="float: right;margin-right: 100px;" onclick="Save()" class="btn btn-primary" type="button">Save</button>
			</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section> 
</div>
    </div>
  </div>



@endsection
@section('extra-js')

  <script src="../../../app-assets/vendors/js/tables/jszip.min.js" type="text/javascript"></script>
  <script src="../../../app-assets/vendors/js/tables/pdfmake.min.js" type="text/javascript"></script>
  <script src="../../../app-assets/vendors/js/tables/vfs_fonts.js" type="text/javascript"></script>
  <script src="../../../app-assets/vendors/js/tables/buttons.html5.min.js" type="text/javascript"></script>
  <script src="../../../app-assets/vendors/js/tables/buttons.print.min.js" type="text/javascript"></script>
  <script src="../../../app-assets/vendors/js/tables/buttons.colVis.min.js" type="text/javascript"></script>
  <script src="../../../app-assets/vendors/js/forms/select/select2.full.min.js" type="text/javascript"></script>
  <script src="../../../app-assets/js/scripts/forms/select/form-select2.js" type="text/javascript"></script>
  <script src="{{ asset('autocomplete/jquery-ui.min.js') }}"></script>

  <script src="/app-assets/vendors/js/forms/icheck/icheck.min.js" type="text/javascript"></script>
  <script src="/app-assets/vendors/js/forms/toggle/switchery.min.js" type="text/javascript"></script>
  <script src="/app-assets/js/scripts/dropdowns/dropdowns.js" type="text/javascript"></script>
<script>
  $('.select2').css("width","100%");
  // $('.select2').select2();

$(".select2").select2({
    dropdownParent: $("#popup_model")
});


$( "#item_search1" ).autocomplete({
    source: function( request, response ) {
      // Fetch data
      $.ajax({
        url:"/get-item",
        dataType: "json",
        data: request, 
        success: function( data ) {
            if(data.response == 'true') 
            {
                response(data.message);
            }
        }
      });
    },
    select: function (event, ui) {
      $(this).val(ui.item.label); 
      var pro_id = ui.item.id; 
      $.ajax({
          url : '/get-item/'+pro_id,
          type: "GET",
          dataType: "JSON",
          success:function(data) 
          {
            $("#item_id"+count).val(pro_id);
            var count = 1;
            AutoCalculation(data,count);
          }
      });
    }       
});


function addRow() {
  var tableLength = $("#productTable tbody tr").length;

  var tableRow;
  var arrayNumber;
  var count;

  if(tableLength > 0) {   
    tableRow = $("#productTable tbody tr:last").attr('id');
    arrayNumber = $("#productTable tbody tr:last").attr('class');
    count = tableRow.substring(3);  
    count = Number(count) + 1;
    arrayNumber = Number(arrayNumber) + 1;          
  } else {
    count = 1;
    arrayNumber = 0;
  }


var tr = '<tr value="'+count+'" id="row'+count+'">'+
    '<td>'+
    '<br><input class="form-control" type="text" name="item_search[]" id="item_search'+count+'" autocomplete="off"  />'+
    '<input type="hidden" name="item_id[]" id="item_id'+count+'" autocomplete="off" class="form-control" />'+
  '</td>'+


 '<td>'+
    '<input type="hidden" name="dry_clean_price[]" id="dry_clean_price'+count+'">'+
    '<center><label id="label_dry_clean_price'+count+'">0</label></center>'+
    '<div class="input-group">'+
      '<span class="input-group-btn">'+
          '<button onclick="changeDryCleanMinus('+count+')" type="button" class="btn btn-danger btn-number"  data-type="minus" data-field="dry_clean_qty'+count+'">'+
            '<i class="fa fa-minus" aria-hidden="true"></i>'+
          '</button>'+
      '</span>'+
      '<input type="text" name="dry_clean_qty[]" id="dry_clean_qty'+count+'" class="form-control input-number" value="0" min="0" max="100">'+
      '<span class="input-group-btn">'+
          '<button onclick="changeDryCleanPlus('+count+')" type="button" class="btn btn-success btn-number" data-type="plus" data-field="dry_clean_qty'+count+'">'+
              '<span class="icon-plus"></span>'+
          '</button>'+
      '</span>'+
    '</div>'+
    '<center><label id="dry_clean_total'+count+'">0</label></center>'+
  '</td>'+

  '<td>'+
    '<input type="hidden" name="wash_iron_price[]" id="wash_iron_price'+count+'">'+
    '<center><label id="label_wash_iron_price'+count+'">0</label></center>'+
    '<div class="input-group">'+
      '<span class="input-group-btn">'+
          '<button onclick="changeWashIronMinus('+count+')" type="button" class="btn btn-danger btn-number"  data-type="minus" data-field="wash_iron_qty'+count+'">'+
            '<i class="fa fa-minus" aria-hidden="true"></i>'+
          '</button>'+
      '</span>'+
      '<input type="text" name="wash_iron_qty[]" id="wash_iron_qty'+count+'" class="form-control input-number" value="0" min="0" max="100">'+
      '<span class="input-group-btn">'+
          '<button onclick="changeWashIronPlus('+count+')" type="button" class="btn btn-success btn-number" data-type="plus" data-field="wash_iron_qty'+count+'">'+
              '<span class="icon-plus"></span>'+
          '</button>'+
      '</span>'+
    '</div>'+
    '<center><label id="wash_iron_total'+count+'">0</label></center>'+
  '</td>'+

  '<td>'+
    '<input type="hidden" name="iron_price[]" id="iron_price'+count+'">'+
    '<center><label id="label_iron_price'+count+'">0</label></center>'+
    '<div class="input-group">'+
      '<span class="input-group-btn">'+
          '<button onclick="changeIronMinus('+count+')" type="button" class="btn btn-danger btn-number"  data-type="minus" data-field="iron_qty'+count+'">'+
            '<i class="fa fa-minus" aria-hidden="true"></i>'+
          '</button>'+
      '</span>'+
      '<input type="text" name="iron_qty[]" id="iron_qty'+count+'" class="form-control input-number" value="0" min="0" max="100">'+
      '<span class="input-group-btn">'+
          '<button onclick="changeIronPlus('+count+')" type="button" class="btn btn-success btn-number" data-type="plus" data-field="iron_qty'+count+'">'+
              '<span class="icon-plus"></span>'+
          '</button>'+
      '</span>'+
    '</div>'+
    '<center><label id="iron_total'+count+'">0</label></center>'+
  '</td>'+
  
  '<td>'+
    '<br><input style="text-align: right;" value="0" type="text" name="total[]" id="total'+count+'" autocomplete="off" class="form-control" readonly="true" />'+
  '</td>'+

  '<td align="center">'+
    '<br><button id="removeProductRowBtn'+count+'" class="btn btn-default removeProductRowBtn" type="button" onclick="removeProductRow('+count+')"><i class="icon-trash"></i></button>'+
  '</td>'+
'</tr>';


if(tableLength > 0) {             
  $("#productTable tbody tr:last").after(tr);
} else {        
  $("#productTable tbody").append(tr);
}   
$("#item_search"+count).focus();


$( "#item_search"+count ).autocomplete({
    source: function( request, response ) {
      // Fetch data
      $.ajax({
        url:"/get-item",
        dataType: "json",
        data: request, 
        success: function( data ) {
            if(data.response == 'true') 
            {
                response(data.message);
            }
        }
      });
    },
    select: function (event, ui) {
        $(this).val(ui.item.label); 
        var pro_id = ui.item.id; 
        $.ajax({
            url : '/get-item/'+pro_id,
            type: "GET",
            dataType: "JSON",
            success:function(data) 
            { 
              $("#item_id"+count).val(pro_id);
              AutoCalculation(data,count);
            }
        });
    }       
});

autoIncrementNumber();


} // /add row


function removeProductRow(row = null)
{
  if(confirm('Are you sure delete this row?'))
  {
      var tableProductLength = $("#productTable tbody tr").length;

    if(tableProductLength > '1') {
      $("#row"+row).remove();
      var previous_row = row - 1;
      var next_row = row + 1;
      $("#item_search"+previous_row).focus();    
      $("#item_search"+next_row).focus();    
    }
  }
}

$('#delivery_option').on('change',function(){
  var delivery_option = $("#delivery_option").val();
  if ($("input[name=delivery_option]").is(":checked")) { 
    $("input[name=delivery_options]").val('express');
  }
  else{
   $("input[name=delivery_options]").val('standard'); 
  }
});

function AutoCalculation(data,count)
{

var delivery_option = $("#delivery_option").val();
if ($("input[name=delivery_option]").is(":checked")) { 
  if(data[0].cat_id == '1'){
      $("#dry_clean_price"+count).val(data[0].price_2);
      $("#label_dry_clean_price"+count).text(data[0].price_2);
  }
  else if(data[0].cat_id == '2'){
      $("#wash_iron_price"+count).val(data[0].price_2);
      $("#label_wash_iron_price"+count).text(data[0].price_2);
  }
  else if(data[0].cat_id == '3'){
      $("#iron_price"+count).val(data[0].price_2);
      $("#label_iron_price"+count).text(data[0].price_2);
  }

  if(data[1].cat_id == '1'){
      $("#dry_clean_price"+count).val(data[1].price_2);
      $("#label_dry_clean_price"+count).text(data[1].price_2);
  }
  else if(data[1].cat_id == '2'){
      $("#wash_iron_price"+count).val(data[1].price_2);
      $("#label_wash_iron_price"+count).text(data[1].price_2);
  }
  else if(data[1].cat_id == '3'){
      $("#iron_price"+count).val(data[1].price_2);
      $("#label_iron_price"+count).text(data[1].price_2);
  }

  if(data[2].cat_id == '1'){
      $("#dry_clean_price"+count).val(data[2].price_2);
      $("#label_dry_clean_price"+count).text(data[2].price_2);
  }
  else if(data[2].cat_id == '2'){
      $("#wash_iron_price"+count).val(data[2].price_2);
      $("#label_wash_iron_price"+count).text(data[2].price_2);
  }
  else if(data[2].cat_id == '3'){
      $("#iron_price"+count).val(data[2].price_2);
      $("#label_iron_price"+count).text(data[2].price_2);
  }
}
else{
  if(data[0].cat_id == '1'){
      $("#dry_clean_price"+count).val(data[0].price_1);
      $("#label_dry_clean_price"+count).text(data[0].price_1);
  }
  else if(data[0].cat_id == '2'){
      $("#wash_iron_price"+count).val(data[0].price_1);
      $("#label_wash_iron_price"+count).text(data[0].price_1);
  }
  else if(data[0].cat_id == '3'){
      $("#iron_price"+count).val(data[0].price_1);
      $("#label_iron_price"+count).text(data[0].price_1);
  }

  if(data[1].cat_id == '1'){
      $("#dry_clean_price"+count).val(data[1].price_1);
      $("#label_dry_clean_price"+count).text(data[1].price_1);
  }
  else if(data[1].cat_id == '2'){
      $("#wash_iron_price"+count).val(data[1].price_1);
      $("#label_wash_iron_price"+count).text(data[1].price_1);
  }
  else if(data[1].cat_id == '3'){
      $("#iron_price"+count).val(data[1].price_1);
      $("#label_iron_price"+count).text(data[1].price_1);
  }

  if(data[2].cat_id == '1'){
      $("#dry_clean_price"+count).val(data[2].price_1);
      $("#label_dry_clean_price"+count).text(data[2].price_1);
  }
  else if(data[2].cat_id == '2'){
      $("#wash_iron_price"+count).val(data[2].price_1);
      $("#label_wash_iron_price"+count).text(data[2].price_1);
  }
  else if(data[2].cat_id == '3'){
      $("#iron_price"+count).val(data[2].price_1);
      $("#label_iron_price"+count).text(data[2].price_1);
  }
}

  var dry_clean_price = $("#dry_clean_price"+count).val();
  var wash_iron_price = $("#wash_iron_price"+count).val();
  var iron_price = $("#iron_price"+count).val();

  var dry_clean_qty = $("#dry_clean_qty"+count).val('0');
  var wash_iron_qty = $("#wash_iron_qty"+count).val('0');
  var iron_qty = $("#iron_qty"+count).val('0');

  var dry_clean_total = 0 * dry_clean_price;
  var wash_iron_total = 0 * wash_iron_price;
  var iron_total = 0 * iron_price;

  $("#dry_clean_total"+count).text(dry_clean_total);
  $("#wash_iron_total"+count).text(wash_iron_total);
  $("#iron_total"+count).text(iron_total);
  

  var total=Number((dry_clean_total + wash_iron_total + iron_total));
  total = total.toFixed(2);
  $("#total"+count).val(total);

  subAmount();
}

function subAmount() {
  var tableProductLength = $("#productTable tbody tr").length;
  var total = 0;

  for(x = 0; x < tableProductLength; x++) {
    var tr = $("#productTable tbody tr")[x];
    var count = $(tr).attr('id');
    count = count.substring(3);

    total = Number(total) + Number($("#total"+count).val());
  } 
  $("#final_total").val(Math.round(total));
}

function Save(){
    //$("#btnSave").attr("disabled", true);
    var formData = new FormData($('#form')[0]);
    var delivery_option = $("#delivery_options").val();
    alert(delivery_option);
    formData.append('delivery_option', delivery_option);
    // $.ajax({
    //     url : '/save-item',
    //     type: "POST",
    //     data: formData,
    //     contentType: false,
    //     processData: false,
    //     dataType: "JSON",
    //     success: function(data)
    //     {
    //       console.log(data);                
    //       $("#form")[0].reset();
    //       toastr.success('Successfully Dave');

    //       location.reload();
    //     },error: function (data, errorThrown) {
    //         var errorData = data.responseJSON.errors;
    //         $("#btnSave").attr("disabled", false);
    //     }
    // });
}


function changeDryCleanPlus(count){
  var dry_clean_price = $("#dry_clean_price"+count).val();
  var wash_iron_price = $("#wash_iron_price"+count).val();
  var iron_price = $("#iron_price"+count).val();

  var dry_clean_qty = $("#dry_clean_qty"+count).val();
  var wash_iron_qty = $("#wash_iron_qty"+count).val();
  var iron_qty = $("#iron_qty"+count).val();

  var dry_clean_total = (Number(dry_clean_qty) + 1) * dry_clean_price;
  var wash_iron_total = wash_iron_qty * wash_iron_price;
  var iron_total = iron_qty * iron_price;

  $("#dry_clean_total"+count).text(dry_clean_total);
  $("#wash_iron_total"+count).text(wash_iron_total);
  $("#iron_total"+count).text(iron_total);

  var total=Number((dry_clean_total + wash_iron_total + iron_total));
  total = total.toFixed(2);
  $("#total"+count).val(total);

  subAmount();
}

function changeWashIronPlus(count){
  var dry_clean_price = $("#dry_clean_price"+count).val();
  var wash_iron_price = $("#wash_iron_price"+count).val();
  var iron_price = $("#iron_price"+count).val();

  var dry_clean_qty = $("#dry_clean_qty"+count).val();
  var wash_iron_qty = $("#wash_iron_qty"+count).val();
  var iron_qty = $("#iron_qty"+count).val();

  var dry_clean_total = dry_clean_qty * dry_clean_price;
  var wash_iron_total = (Number(wash_iron_qty) + 1) * wash_iron_price;
  var iron_total = iron_qty * iron_price;

  $("#dry_clean_total"+count).text(dry_clean_total);
  $("#wash_iron_total"+count).text(wash_iron_total);
  $("#iron_total"+count).text(iron_total);

  var total=Number((dry_clean_total + wash_iron_total + iron_total));
  total = total.toFixed(2);
  $("#total"+count).val(total);

  subAmount();
}

function changeIronPlus(count){
  var dry_clean_price = $("#dry_clean_price"+count).val();
  var wash_iron_price = $("#wash_iron_price"+count).val();
  var iron_price = $("#iron_price"+count).val();

  var dry_clean_qty = $("#dry_clean_qty"+count).val();
  var wash_iron_qty = $("#wash_iron_qty"+count).val();
  var iron_qty = $("#iron_qty"+count).val();

  var dry_clean_total = dry_clean_qty * dry_clean_price;
  var wash_iron_total = wash_iron_qty * wash_iron_price;
  var iron_total = (Number(iron_qty) + 1) * iron_price;

  $("#dry_clean_total"+count).text(dry_clean_total);
  $("#wash_iron_total"+count).text(wash_iron_total);
  $("#iron_total"+count).text(iron_total);

  var total=Number((dry_clean_total + wash_iron_total + iron_total));
  total = total.toFixed(2);
  $("#total"+count).val(total);

  subAmount();
}

function changeDryCleanMinus(count){
  var dry_clean_price = $("#dry_clean_price"+count).val();
  var wash_iron_price = $("#wash_iron_price"+count).val();
  var iron_price = $("#iron_price"+count).val();

  var dry_clean_qty = $("#dry_clean_qty"+count).val();
  var wash_iron_qty = $("#wash_iron_qty"+count).val();
  var iron_qty = $("#iron_qty"+count).val();

  var dry_clean_total = (Number(dry_clean_qty) - 1) * dry_clean_price;
  var wash_iron_total = wash_iron_qty * wash_iron_price;
  var iron_total = iron_qty * iron_price;

  $("#dry_clean_total"+count).text(dry_clean_total);
  $("#wash_iron_total"+count).text(wash_iron_total);
  $("#iron_total"+count).text(iron_total);

  var total=Number((dry_clean_total + wash_iron_total + iron_total));
  total = total.toFixed(2);
  $("#total"+count).val(total);

  subAmount();
}

function changeWashIronMinus(count){
  var dry_clean_price = $("#dry_clean_price"+count).val();
  var wash_iron_price = $("#wash_iron_price"+count).val();
  var iron_price = $("#iron_price"+count).val();

  var dry_clean_qty = $("#dry_clean_qty"+count).val();
  var wash_iron_qty = $("#wash_iron_qty"+count).val();
  var iron_qty = $("#iron_qty"+count).val();

  var dry_clean_total = dry_clean_qty * dry_clean_price;
  var wash_iron_total = (Number(wash_iron_qty) - 1) * wash_iron_price;
  var iron_total = iron_qty * iron_price;

  $("#dry_clean_total"+count).text(dry_clean_total);
  $("#wash_iron_total"+count).text(wash_iron_total);
  $("#iron_total"+count).text(iron_total);

  var total=Number((dry_clean_total + wash_iron_total + iron_total));
  total = total.toFixed(2);
  $("#total"+count).val(total);

  subAmount();
}

function changeIronMinus(count){
  var dry_clean_price = $("#dry_clean_price"+count).val();
  var wash_iron_price = $("#wash_iron_price"+count).val();
  var iron_price = $("#iron_price"+count).val();

  var dry_clean_qty = $("#dry_clean_qty"+count).val();
  var wash_iron_qty = $("#wash_iron_qty"+count).val();
  var iron_qty = $("#iron_qty"+count).val();

  var dry_clean_total = dry_clean_qty * dry_clean_price;
  var wash_iron_total = wash_iron_qty * wash_iron_price;
  var iron_total = (Number(iron_qty) - 1) * iron_price;

  $("#dry_clean_total"+count).text(dry_clean_total);
  $("#wash_iron_total"+count).text(wash_iron_total);
  $("#iron_total"+count).text(iron_total);

  var total=Number((dry_clean_total + wash_iron_total + iron_total));
  total = total.toFixed(2);
  $("#total"+count).val(total);

  subAmount();
}

autoIncrementNumber();

function autoIncrementNumber(){
$('.btn-number').click(function(e){
    e.preventDefault();
    
    fieldName = $(this).attr('data-field');
    type      = $(this).attr('data-type');
    var input = $("#"+fieldName);
    var currentVal = parseInt(input.val());
    if (!isNaN(currentVal)) {
        if(type == 'minus') {
            
            if(currentVal > input.attr('min')) {
                input.val(currentVal - 1).change();
            } 
            if(parseInt(input.val()) == input.attr('min')) {
                $(this).attr('disabled', true);
            }

        } else if(type == 'plus') {

            if(currentVal < input.attr('max')) {
                input.val(currentVal + 1).change();
            }
            if(parseInt(input.val()) == input.attr('max')) {
                $(this).attr('disabled', true);
            }
        }
    } else {
        input.val(0);
    }
});

$('.input-number').focusin(function(){
   $(this).data('oldValue', $(this).val());
});

$('.input-number').change(function() {
    
    minValue =  parseInt($(this).attr('min'));
    maxValue =  parseInt($(this).attr('max'));
    valueCurrent = parseInt($(this).val());
    
    name = $(this).attr('id');
    if(valueCurrent >= minValue) {
        $(".btn-number[data-type='minus'][data-field='"+name+"']").removeAttr('disabled')
    } else {
        alert('Sorry, the minimum value was reached');
        $(this).val($(this).data('oldValue'));
    }
    if(valueCurrent <= maxValue) {
        $(".btn-number[data-type='plus'][data-field='"+name+"']").removeAttr('disabled')
    } else {
        alert('Sorry, the maximum value was reached');
        $(this).val($(this).data('oldValue'));
    }
});

$(".input-number").keydown(function (e) {
    // Allow: backspace, delete, tab, escape, enter and .
    if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 190]) !== -1 ||
         // Allow: Ctrl+A
        (e.keyCode == 65 && e.ctrlKey === true) || 
         // Allow: home, end, left, right
        (e.keyCode >= 35 && e.keyCode <= 39)) {
             // let it happen, don't do anything
             return;
    }
    // Ensure that it is a number and stop the keypress
    if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
        e.preventDefault();
    }
});

}
</script>


@endsection