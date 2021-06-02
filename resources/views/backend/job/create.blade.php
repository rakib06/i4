@inject('model', '\App\Domains\Auth\Models\User')

@extends('backend.layouts.app')

@section('title', __('Create Job'))

@section('content')
    <x-forms.post :action="route('admin.jobs.store')">
        <x-backend.card>
            <x-slot name="header">
                @lang('Create Job')
            </x-slot>

            <x-slot name="headerActions">
                <x-utils.link class="card-header-action" :href="route('admin.auth.user.index')" :text="__('Cancel')" />
            </x-slot>

            <x-slot name="body">
                <div>
                    <div class="form-group row">
                        <label for="name" class="col-md-2 col-form-label">@lang('CUSTOMER')</label>

                        <div class="col-md-10">

                        <select name="customer_id" class="form-control" required>
                            @foreach($customers as $customer)
                                <option value="{{$customer->id}}">{{$customer->name}}</option>
                            @endforeach
                        </select>
                          
                        </div>
                    </div><!--form-group-->

                    <div class="form-group row">
                        <label for="name" class="col-md-2 col-form-label">@lang('CUSTOMER REFERENCE')</label>

                        <div class="col-md-10">
                            <input type="text" name="customer_reference" class="form-control" placeholder="{{ __('Insert customer ref here...') }}" value="{{ old('customer_reference') }}" maxlength="100" required />
                        </div>
                    </div><!--form-group-->

                     <div class="form-group row">
                        <label for="name" class="col-md-2 col-form-label">@lang('TYPE')</label>

                        <div class="col-md-10">

                        <select name="type" class="form-control" required>
                                <option value="loading">Loading</option>
                                <option value="discharging">Discharging</option>
                                <option value="analysis">Analysis</option>
                                <option value="other">Other</option>
                        </select>
                          
                        </div>
                    </div><!--form-group-->

                    <div class="form-group row">
                        <label for="name" class="col-md-2 col-form-label">@lang('PLACE')</label>

                        <div class="col-md-10">

                        <select name="place_id" class="form-control" required>
                                <option value="1">Spain</option>
                                <option value="2">USA</option>
                        </select>
                          
                        </div>
                    </div><!--form-group-->

                    <div class="form-group row">
                        <label for="name" class="col-md-2 col-form-label">@lang('BRANCH')</label>

                        <div class="col-md-10">

                        <select name="branch_id" class="form-control" required>
                                <option value="1">i4Survey Global</option>
                                <option value="2">i4Survey Italy</option>
                        </select>
                          
                        </div>
                    </div><!--form-group-->

                   <div class="form-group row">
                        <label for="name" class="col-md-2 col-form-label">@lang('EXPECTED ETA')</label>

                        <div class="col-md-10">
                            <input type="text" name="expected_eta" class="form-control" placeholder="{{ __('E.T.A') }}" value="{{ old('customer_reference') }}" maxlength="100" required />
                        </div>
                    </div><!--form-group-->


                    <div class="form-group row">
                        <label for="active" class="col-md-2 col-form-label">@lang('DEMO')</label>

                        <div class="col-md-10">
                            <div class="form-check">
                                <input name="active" id="demo" class="form-check-input" type="checkbox" value="1" {{ old('active', true) ? 'checked' : '' }} />
                            </div><!--form-check-->
                        </div>
                    </div><!--form-group-->


                   
                </div>
            </x-slot>

            <x-slot name="footer">
                <button class="btn btn-sm btn-primary float-right" type="submit">@lang('Create Job')</button>
            </x-slot>
        </x-backend.card>
    </x-forms.post>
@endsection
