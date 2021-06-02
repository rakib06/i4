<?php

namespace App\Http\Livewire\Backend;

use App\Models\Job;
use Illuminate\Database\Eloquent\Builder;
use Rappasoft\LaravelLivewireTables\TableComponent;
use Rappasoft\LaravelLivewireTables\Traits\HtmlComponents;
use Rappasoft\LaravelLivewireTables\Views\Column;

/**
 * Class UsersTable.
 */
class JobsTable extends TableComponent
{
    use HtmlComponents;

    /**
     * @var string
     */
    public $sortField = 'place_id';

    /**
     * @var string
     */
    public $status;

    /**
     * @var array
     */
    protected $options = [
        'bootstrap.container' => false,
        'bootstrap.classes.table' => 'table table-striped',
    ];

    /**
     * @param  string  $status
     */
    public function mount($status = 'active'): void
    {
        $this->status = $status;
    }

    /**
     * @return Builder
     */   

    public function query(): Builder
    {
        return Job::query()                
                ->join('customers', 'jobs.customer_id', '=', 'customers.id')
                ->join('places', 'jobs.place_id', '=', 'places.id');                

        //return Job::join('customers', 'jobs.customer_id', '=', 'customers.id')->query();
    }

    /**
     * @return array
     */
    public function columns(): array
    {
        return [
            Column::make(__('ID'), 'id')
                ->sortable(),
            Column::make(__('Name'), 'name')
                ->searchable()
                ->sortable(),
                Column::make(__('Place'), 'place_name')
                ->searchable()
                ->sortable(),
            
        ];
    }
}
