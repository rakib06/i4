<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;

use App\Models\Customer;
use App\Models\Job;

/**
 * Class JobController.
 */
class JobController
{
    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     */
    public function index()
    {
        return view('backend.job.list');
    }

    public function new()
    {
        $customers = Customer::all();
        return view('backend.job.create', compact("customers"));
    }

    public function store(Request $request)
    {        
        $rules = array(
            'customer_id'=>'required',
            'branch_id'=>'required',
            'place_id'=>'required'
        );
        $validator = Validator::make($request->all(), $rules);
        
        if ($validator->fails()) {
            return Redirect::to('jobs/new')
                ->withErrors($validator)
                ->withInput();
        } else {
            // store
            $job = new Job;
            $job->customer_id=$request->customer_id;
            $job->branch_id=$request->branch_id;
            $job->place_id=$request->place_id;
            $job->save();

            // redirect            
            return Redirect::to('jobs/new');
        }
    }
}
