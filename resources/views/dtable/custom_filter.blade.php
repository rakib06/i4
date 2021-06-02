@extends('backend.layouts.app')

@section('title', __('Job Management'))

@section('breadcrumb-links')
    @include('backend.auth.user.includes.breadcrumb-links')
@endsection

@section('content')


 <x-backend.card>
        <x-slot name="header">
            @lang('Job Management')
        </x-slot>
        @if ($logged_in_user->hasAllAccess())
            <x-slot name="headerActions">
                <x-utils.link
                    icon="c-icon cil-plus"
                    class="card-header-action"
                    :href="route('admin.jobs.store')"
                    :text="__('Create Job')"
                />
            </x-slot>
        @endif
    </x-backend.card>
    <div class="form-group col-md-6">
    <h5>Start Date <span class="text-danger"></span></h5>
    <div class="controls">
        <input type="date" name="start_date" id="start_date" class="form-control datepicker-autoclose" placeholder="Please select start date"> <div class="help-block"></div></div>
    </div>
    <div class="form-group col-md-6">
    <h5>End Date <span class="text-danger"></span></h5>
    <div class="controls">
        <input type="date" name="end_date" id="end_date" class="form-control datepicker-autoclose" placeholder="Please select end date"> <div class="help-block"></div></div>
    </div>
    <div class="text-left" style="
    margin-left: 15px;
    ">
    <button type="text" id="btnFiterSubmitSearch" class="btn btn-info">Submit</button>
    </div>
    
    <br>
 
    <table class="table table-bordered table-striped" id="laravel_datatable">
       <thead>
          <tr>
             <th>ID</th>
             <th>Title</th>
             <th>Body</th>
             <th>Created at</th>
          </tr>
       </thead>
    </table>
<script>

 
</script>
 


@endsection

