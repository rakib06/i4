<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;

use App\Models\Customer;
use App\Models\Job;
use App\Models\Place;
use App\Models\Vessel;
use App\Models\Branch;
/**
 * Class JobController.
 */
class JobController
{
    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     */
    public function index()
    {   dd("----------------------> hi ");
        return 0;
        //return view('backend.job.index');
    }

    public function list()
    {
        $customers = Customer::all();
        return view('backend.job.index', compact("customers"));
    }

    public function new()
    {
        $customers = Customer::all();
        $places = Place::all();
        $vessles = Vessel::all();
        $branches = Branch::all();
        return view('backend.job.create', compact(["customers", "places", "vessles", "branches"]));
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
            return \Redirect::to('admin/jobs/new')
                ->withErrors($validator)
                ->withInput();
        } else {
            // store
            $job = new Job;
            $job->customer_id=$request->customer_id;
            $job->branch_id=$request->branch_id;
            $job->place_id=$request->place_id;
            $job->customer_reference=$request->customer_reference;
            $job->expected_eta=$request->expected_eta;
            $job->demo=$request->demo;
            // if (!$request->demo){
            //     $request->demo = "No";
            // }
            $job->type=$request->type;
            $job->vessel_id=$request->vessel_id; 
            // print_r($job);
            // dd($job);
            $job->save();
            //dd($job);
            // redirect            
            //return \Redirect::to('admin/jobs/new/')->with( [ 'job' => $job->id ] );
            return \Redirect::to('admin/jobs/new/'.$job->id)->with( [ 'job' => $job->id ]) ;
        }
    }
    public function addProduct($id)
    {
        $customers = Customer::all();
        $places = Place::all();
        $vessles = Vessel::all();
        $branches = Branch::all();
        return view('backend.job.addProduct', compact(["customers", "id", "places", "vessles", "branches"]));
    }
    public function add(Request $request)
    {
        $customers = Customer::all();
        $places = Place::all();
        $vessles = Vessel::all();
        $branches = Branch::all();

        $id = Job::latest()->first();
        return view('backend.job.addProduct', compact(["customers", "id", "places", "vessles", "branches"]));
    }
}
