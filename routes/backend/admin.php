<?php

use App\Http\Controllers\Backend\DashboardController;
use App\Http\Controllers\Backend\JobController;
use App\Http\Controllers\dtable\AjaxCrudController;
use Tabuna\Breadcrumbs\Trail;

// All route names are prefixed with 'admin.'.
Route::redirect('/', '/admin/dashboard', 301);
Route::get('dashboard', [DashboardController::class, 'index'])
    ->name('dashboard')
    ->breadcrumbs(function (Trail $trail) {
        $trail->push(__('Home'), route('admin.dashboard'));
    });

    //dd("Hi");
    // Route::get('jobs/list', 'JobController@list')
    // ->name('jobs.list');
    Route::get('jobs/list', [JobController::class, 'list'])
    ->name('jobs.list');
    Route::get('jobs/new', [JobController::class, 'new'])
    ->name('jobs.new');
    Route::get('jobs/edit/{id}', [JobController::class, 'edit'] )
    ->name('jobs.edit');

    Route::get('jobs/new/{id}', [JobController::class, 'addProduct'] )
    ->name('jobs.addProduct');

    Route::get('jobs/email/get/{id}', [JobController::class, 'getJobEmail'] )
    ->name('jobs.getJobEmail');
    Route::post('jobs/email/new/{id}', [JobController::class, 'newJobEmail'] )
    ->name('jobs.newJobEmail');

    Route::post('jobs/store', [JobController::class, 'store'])
    ->name('jobs.store')
    ->breadcrumbs(function (Trail $trail) {
        $trail->push(__('Job'), route('jobs.store'));
    });
    Route::post('jobs/product', [JobController::class, 'add'])
    ->name('jobs.add')
    ->breadcrumbs(function (Trail $trail) {
        $trail->push(__('Product'), route('jobs.add'));
    });;
    Route::get('dtable-posts-lists', [AjaxCrudController::class, 'index']);
    Route::get('dtable-custom-posts', [AjaxCrudController::class, 'get_custom_posts']);
    

