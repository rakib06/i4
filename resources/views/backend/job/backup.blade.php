@inject('model', '\App\Domains\Auth\Models\User')

@extends('backend.layouts.app')

@section('title', __('Add Products'))



@section('content')

    <!-- <x-forms.post :action="route('admin.jobs.store')"> -->
    <x-forms.post>
        <x-backend.card>
            <x-slot name="header">
                @lang('Products')
                <link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css" rel="stylesheet">
                <script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>
            </x-slot>

            <x-slot name="headerActions">
                <x-utils.link class="card-header-action" :href="route('admin.auth.user.index')" :text="__('Cancel')" />
            </x-slot>
            
            <x-slot name="body">
                <div>
                    <div class="row">

                    <div class="col-md-3">  
                    <div class="form-group">
                        <label style="font-size: x-small; font-weight:bold; " for="exampleFormControlInput1" >Product</label>
                        <select name="customer_id" id="product" class="form-control" required>
                            <option value="">Select Product </option>
                            @foreach($customers as $customer)
                                <!-- <option value="{{$customer->id}}">{{$customer->name}}</option> -->
                                <option value="{{$customer->name}}">{{$customer->name}}</option>
                            @endforeach
                        </select>
                    </div>
                    </div> <!-- col-md-6   -->

                    <div class="col-md-3">  
                    <label style="font-size: x-small; font-weight:bold; " for="exampleFormControlInput1" >TOTAL TONS</label>
                    <input type="text" id="tons" name="tons" class="form-control" placeholder="{{ __('Insert customer ref here...') }}" value="{{ old('customer_reference') }}" maxlength="100" required />
                    </div>

                    <div class="col-md-3">  
                    <label style="font-size: x-small; font-weight:bold; " for="exampleFormControlInput1" >TOTAL PIECES</label>
                    <input type="text" name="pieces" id="pieces" class="form-control" placeholder="{{ __('Insert customer ref here...') }}" value="{{ old('customer_reference') }}" maxlength="100" required />
                    </div>

                    <div class="col-md-3">  
                    <label style="font-size: x-small; font-weight:bold; " for="exampleFormControlInput1" >Action </label>
                    <div class="card" style="border:transparent;"   >
                        <button name="addButton" onclick="myFunction()" class="btn btn-md btn-primary float-left"  type="submit">Add</button>
                    </div>
                    </div>
                    </div> <!--row 1 -->

                   
                    
                    
                    
                    @include('backend.job.js')
                    

                  
                </div>
            </x-slot>

            <x-slot name="footer">
                <button class="btn btn-lg btn-primary float-right" type="submit">@lang('Next')</button>
            </x-slot>
        </x-backend.card>
    </x-forms.post>

    <!-- <x-forms.post>
        <x-backend.card>
        
    <div class="row">
                    <h2>Goods quantity</h2>
                    </div>
                    <table id="myTable" class="table">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Tons</th>
                                <th>Pieces</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                       
                        </tbody>
                    </table>
                        <br>



<script>
const x = 1;
function myFunction() {
    
  var table = document.getElementById("myTable");
  var row = table.insertRow(x);
  var cell1 = row.insertCell(0);
  var cell2 = row.insertCell(1);
  var cell3 = row.insertCell(2);
  var cell4 = row.insertCell(3);
  var tons = document.getElementById("tons");
  var product = document.getElementById("product");
  cell1.innerHTML = product.value;
  cell2.innerHTML = tons.value;
  cell3.innerHTML = pieces.value;
  cell4.innerHTML = "delete";
  x +=1;
}
</script>
</x-slot>

            <x-slot name="footer">
                <button class="btn btn-lg btn-primary float-right" type="submit">@lang('Next')</button>
            </x-slot>
</x-backend.card>
    </x-forms.post> -->
@endsection
