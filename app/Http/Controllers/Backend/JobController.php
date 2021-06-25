<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;

use App\Models\Customer;
use App\Models\Job;
use App\Models\Email;
use App\Models\Attachment;
use App\Models\AttachmentInEmail;
use App\Models\User;
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

    public function edit($id){

        $job = Job::where('id', $id)->first();
        $customers = Customer::all();
        $places = Place::all();
        $vessles = Vessel::all();
        $branches = Branch::all();
        return view('backend.job.edit', compact(["job","customers", "places", "vessles", "branches"]));
    }

    public function getJobEmail($id){
        $data = array();
        $emails = Email::where('job_id',$id)->get();
        $attachment = Attachment::where('job_id',$id)->get();
        $user = User::where('type','user')->get();

        $data['data'] = $emails;
        $data['attachment'] = $attachment;
        $data['recipients'] = $user;
        

        return json_encode($data);
    }

    /**
     * GENERATE RANDOM EMAIL ID
     */
    public function genEmailId(){
        $id = $this->genRandNum(10);
        $IdExists = Email::find($id); 
        if($IdExists){
            return $this->genEmailId();
        }
        return $id;
    }

    /**
     * generate rand number max (9 char)
     */
    public function genRandNum($length){
        $digits = $length;
        return $rand = rand(pow(10, $digits-1), pow(10, $digits)-1);
    }

    public function newJobEmail(Request $request, $id){
        $rules = array(
            'to'=>'required',
            'from'=>'required',
            'body'=>'required'
        );

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return json_encode(['message'=> 'Please fillup required fields.']);
        } else {
            // store
            $genJobId = $this->genEmailId();
            $email = new Email;
            $email->job_id=$id;
            $email->email_id=$genJobId;
            $email->cc=json_encode($request->cc);
            $email->bcc=json_encode($request->bcc);
            $email->to=$request->to;
            $email->from=$request->from;
            $email->body=$request->body;
            $email->subject=$request->subject;
            $email->created_by=\Auth::user()->id;

            $email->save();
           if(isset($request->attachment_id)){
            $atachments = $request->attachment_id;
            foreach ($atachments as $key => $value) {
                $AttachmentInEmail = New AttachmentInEmail();
                $AttachmentInEmail->email_id=$genJobId;
                $AttachmentInEmail->job_id=$id;        
                $AttachmentInEmail->attachment_id=$value;

                $AttachmentInEmail->save();
            }
            
           }
           return json_encode(['data'=> $email]);
        }
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

        return \Redirect::to('admin/jobs/new');
        $customers = Customer::all();
        $places = Place::all();
        $vessles = Vessel::all();
        $branches = Branch::all();

        $id = Job::latest()->first();
        return view('backend.job.addProduct', compact(["customers", "id", "places", "vessles", "branches"]));
    }
}
