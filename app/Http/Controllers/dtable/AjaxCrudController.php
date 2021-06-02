<?php
 
namespace App\Http\Controllers\dtable;
 
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Post;
use App\Models\Job;
use Redirect,Response;
 
class AjaxCrudController extends Controller
{
 
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
         return view('dtable.custom_filter');
    }
 
    public function get_custom_posts(){
        //$postsQuery = Post::query();

        $postsQuery = Job::query()                
                ->join('customers', 'jobs.customer_id', '=', 'customers.id')
                ->join('places', 'jobs.place_id', '=', 'places.id');    
 
        $start_date = (!empty($_GET["start_date"])) ? ($_GET["start_date"]) : ('');
        $end_date = (!empty($_GET["end_date"])) ? ($_GET["end_date"]) : ('');
 
        if($start_date && $end_date){
    
         $start_date = date('Y-m-d', strtotime($start_date));
         $end_date = date('Y-m-d', strtotime($end_date));
         
         $postsQuery->whereRaw("date(posts.created_at) >= '" . $start_date . "' AND date(posts.created_at) <= '" . $end_date . "'");
        }
        $posts = $postsQuery->select('*');
        return datatables()->of($posts)
            ->make(true);
    }
 
}