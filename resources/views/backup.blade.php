@extends('layouts.app')
@section('extra-css')
<link rel="stylesheet" type="text/css" href="../../../app-assets/css/vendors.css">
  <link rel="stylesheet" type="text/css" href="../../../app-assets/vendors/css/tables/datatable/datatables.min.css">
  <link rel="stylesheet" type="text/css" href="../../../app-assets/vendors/css/tables/extensions/buttons.dataTables.min.css">
  <link rel="stylesheet" type="text/css" href="../../../app-assets/vendors/css/tables/datatable/buttons.bootstrap4.min.css">
  
@endsection
@section('section')
<div class="content-wrapper">

    <div class="content-body">     
   
<section id="column-selectors">
    <div class="row">
      <div class="col-12">
        
        <div class="card">
          <div class="card-header">
            
                <a id="open_model" href="{{ url('backup/create') }}" class="btn btn-success round btn-glow px-2">Create New Backup</a>

         
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
             
            @if (count($backups))
              <table class="table table-striped table-bordered zero-configuration">
                <thead>
                   
                  <tr>
                    <th>#</th>
                    <th>File Name</th>              
                    
                    <th>Size</th>
                    <th>Date</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                    @foreach($backups as $key=> $backup)
                    <tr>
                        <td>{{$key+1}}</td>
                        <td>{{ $backup['file_name'] }}</td>
                        <td>{{ $backup['file_size'] }}</td>
                        <td>
                            {{ $backup['last_modified']}}
                        </td>
                        
                        <td class="text-right">
                            <a class="btn btn-xs btn-primary"
                               href="{{ url('backup/download/'.$backup['file_name']) }}"><i
                                    class="fa fa-cloud-download"></i> Download</a>
                            <a class="btn btn-xs btn-danger" data-button-type="delete"
                               href="{{ url('backup/delete/'.$backup['file_name']) }}"><i class="fa fa-trash-o"></i>
                                Delete</a>
                        </td>
                    </tr>
                @endforeach
                </tbody>
                <tfoot>
                  <tr>
                    <th>#</th>
                    <th>File Name</th>              
                    
                    <th>Size</th>
                    <th>Date</th>
                    <th>Action</th>
                  </tr>
                </tfoot>
              </table>
              @else
                <div class="well">
                    <h4 class="text-center">There are no backups</h4>
                </div>
            @endif
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

<script>

    
</script>


@endsection