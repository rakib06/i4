@inject('model', '\App\Domains\Auth\Models\User')

@extends('backend.layouts.app')

@section('title', __('Create Job'))



@section('content')

    <x-forms.post :action="route('admin.jobs.store')">
        <x-backend.card>
            <x-slot name="header">
                @lang('Create Job')
                <link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css" rel="stylesheet">
                <script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>
            </x-slot>

            <x-slot name="headerActions">
                <x-utils.link class="card-header-action" :href="route('admin.auth.user.index')" :text="__('Cancel')" />
            </x-slot>
            
            <x-slot name="body">
                <div>
                    <div class="row">
                    <div class="col-md-6">  
                    <div class="form-group">
                        <label style="font-size: x-small; font-weight:bold; " for="exampleFormControlInput1" >CUSTOMER</label>
                        <select name="customer_id" class="form-control" required>
                            <option value="">Select Customer </option>
                            @foreach($customers as $customer)
                                <option value="{{$customer->id}}">{{$customer->name}}</option>
                            @endforeach
                        </select>
                    </div>
                    </div> <!-- col-md-6   -->

                    <div class="col-md-6">  
                    <label style="font-size: x-small; font-weight:bold; " for="exampleFormControlInput1" >CUSTOMER REFERENCE</label>
                    <input type="text" name="customer_reference" class="form-control" placeholder="{{ __('Insert customer ref here...') }}" value="{{ old('customer_reference') }}" maxlength="100" required />
                    </div>

                    </div> <!--row 1 -->
                    
                    <div class="row">
                    <div class="col-md-6">  
                    <div class="form-group">
                        <label style="font-size: x-small; font-weight:bold; " for="exampleFormControlInput1" >TYPE</label>
                        <select name="type" class="form-control" required>
                                <option value="">Select Type </option>
                                <option value="loading">Loading</option>
                                <option value="discharging">Discharging</option>
                                <option value="analysis">Analysis</option>
                                <option value="other">Other</option>
                        </select> 
                    </div>
                    </div> <!-- col-md-6   -->

                    <div class="col-md-6">  
                    <label style="font-size: x-small; font-weight:bold; " for="exampleFormControlInput1" >Place</label>
                    <select name="place_id" class="form-control" required>
                            <option value="">Select Place </option>
                            @foreach($places as $place)
                                <option value="{{$place->id}}">{{$place->place_name}}</option>
                            @endforeach
                    </select>
                    </div>

                    </div> <!--row 2-->
                    

                    <div class="row">
                    <div class="col-md-6">  
                    <div class="form-group">
                        <label style="font-size: x-small; font-weight:bold; " for="exampleFormControlInput1" >BRANCH</label>
                        <select name="branch_id" id="branches" class="form-control" required >
                        <option value="">Select Branch </option>
                            @foreach($branches as $branch)
                                    <option value="{{$branch->id}}">{{$branch->name}}</option>
                            @endforeach
                        </select>  
                    </div>
                    </div> <!-- col-md-6   -->

                    <div class="col-md-6">  
                    <label style="font-size: x-small; font-weight:bold; " for="exampleFormControlInput1" >EXPECTED ETA</label>
                    <input type="datetime-local" name="expected_eta" class="form-control" placeholder="{{ __('E.T.A') }}" value="{{ old('customer_reference') }}" maxlength="100" required />
                    </div>

                    </div> <!--row 3-->


                    <div class="row">
                    <div class="col-md-6">  
                    <div class="form-group">
                        <label style="font-size: x-small; font-weight:bold; " for="exampleFormControlInput1" >VESSEL</label>
                        <div class="row">

                        <!-- <div class="col-md-6">
                        <input type="search" id="vesselBox" name="customer_reference" class="form-control" placeholder="{{ __('Search Vessel here...') }}" value="{{ old('customer_reference') }}" maxlength="100" required />
                        </div> -->
                        <div class="col-md-12">

                        <select name="vessel_id" id="vessels" class="form-control" required >
                        @foreach($vessles as $vessel)
                                <option value="{{$vessel->id}}">{{$vessel->name}}</option>
                        @endforeach
                        </select>
                        </div>      
                        </div>  
                    </div>
                    </div> <!-- col-md-6   -->

                    <div class="col-md-6">  
                 
                    
                    <label style="font-size: x-small; font-weight:bold; " for="exampleFormControlInput1" >DEMO</label>
                    <!-- <input type="text"  class="form-control"/> -->
                    <div class="card " style="height: 2.5rem; border:transparent;"   >
                    <input name="demo" id="demo" onchange="mySwitch()" value="1" type="checkbox"   checked data-toggle="toggle"
                    data-on="Yes" data-off="No" data-onstyle="success" data-offstyle="danger"/>
                        </div>
                    </div> 
                    </div>
                    <!--row 4-->
                    
                    @include('backend.job.js')
                  
                </div>
            </x-slot>

            <x-slot name="footer">
                <button class="btn btn-lg btn-primary float-right" type="submit">@lang('Next')</button>
            </x-slot>
        </x-backend.card>
    </x-forms.post>
@endsection
