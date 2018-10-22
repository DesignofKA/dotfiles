<?php 

public function store(Request $request)
{      
    $spent_time = SpentTime::findOrCreate($request->get('plan_id'), [
        'task_category' => $request->get('task_category'),
        'reason'        => $request->get('reason'),
    ]);

    return redirect()->route('real.index', compact( 'spent_time'));
}

?>
