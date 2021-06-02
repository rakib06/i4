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


    Route::get('jobs/list', [JobController::class, 'index']);
    Route::get('jobs/new', [JobController::class, 'new'])
    ->name('jobs.new');

    Route::post('jobs/store', [JobController::class, 'store'])
    ->name('jobs.store')
    ->breadcrumbs(function (Trail $trail) {
        $trail->push(__('Job'), route('jobs.store'));
    });

    Route::get('dtable-posts-lists', [AjaxCrudController::class, 'index']);
    Route::get('dtable-custom-posts', [AjaxCrudController::class, 'get_custom_posts']);
    

