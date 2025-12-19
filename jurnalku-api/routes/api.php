<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::apiResource('permintaan-saksi', App\Http\Controllers\api\PermintaanSaksiController::class);
Route::apiResource('students', App\Http\Controllers\api\StudentController::class);
