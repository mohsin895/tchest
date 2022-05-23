<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


Route::get('getUsers', 'API\EmployeeController@getUsers');
Route::post('register', 'API\EmployeeController@register');
Route::post('login', 'API\EmployeeController@login');
Route::get('getProfile/{id?}','API\EmployeeController@getProfile');
Route::put('update-eployee/{id}','API\EmployeeController@updateProfile');
// Employee
Route::post('jobsubmit', 'API\EmployeeController@jobsubmit');
Route::get('joblist/{id?}', 'API\EmployeeController@joblist');
Route::get('viewPayslip', 'API\EmployeeController@viewPayslip');
Route::get('expense', 'API\EmployeeController@expense');
Route::post('leaveApplication', 'API\EmployeeController@leaveApplication');
Route::post('attendencecheckin/{id}', 'API\EmployeeController@attendencecheckin');
Route::get('employlogout', 'API\EmployeeController@employlogout');
Route::post('attendencecheckin', 'API\EmployeeController@attendencecheckin');
Route::get('clockOut','API\EmployeeController@clockOut');
Route::put('update-clockout/{id}','API\EmployeeController@updateClockout');
Route::get('awardList','API\EmployeeController@awardList');
Route::post('uploadExpense', 'API\EmployeeController@uploadExpense');
Route::get('noticeBorad','API\EmployeeController@noticeBorad');


// ??admin
Route::get('adminProfile/{id?}','API\EmployeeCOntroller@adminProfile');
Route::post('admin-login', 'API\EmployeeController@adminlogin');
Route::post('uploadjob', 'API\EmployeeController@uploadjob');
Route::post('sendPayslip', 'API\EmployeeController@sendPayslip');
Route::get('adminjoblist', 'API\EmployeeController@adminjoblist');
Route::get('adminleaveApplication', 'API\EmployeeController@adminleaveApplication');
Route::get('sickleaveapplicationget', 'API\EmployeeController@sickleaveapplicationget');
Route::get('viewAttendence', 'API\EmployeeController@viewAttendence');
Route::put('approveLeaveApplication/{id}','API\EmployeeController@approveLeaveApplication');
Route::get('adminlogout', 'API\EmployeeController@adminlogout');
Route::post('uploadAward', 'API\EmployeeController@uploadAward');
Route::post('uploadNoticeBoard', 'API\EmployeeController@uploadNoticeBoard');
Route::get('departmentslist', 'API\EmployeeController@departmentslist');
Route::post('uploadHoliday', 'API\EmployeeController@uploadHoliday');
Route::get('getnotice/{id?}','API\EmployeeController@getnotice');
Route::put('edit-notice/{id}','API\EmployeeController@updateNotice');
Route::put('edit-payslips/{id}','API\EmployeeController@updatePayslips');
Route::put('edit-expense/{id}','API\EmployeeController@updateExpense');



//Holydays
Route::get('holydays', 'API\EmployeeController@holydays');

//Supper Admin
Route::get('listofcountry','API\EmployeeController@listofcountry');
Route::get('listofcompany','API\EmployeeController@listofcompany');
Route::post('addCompany','API\EmployeeController@addCompany');
Route::put('edit-company/{id}','API\EmployeeController@updatecompany');
Route::get('listofcontactlist','API\EmployeeController@listofcontactlist');
Route::get('supperAdmin','API\EmployeeController@supperAdmin');
Route::post('addSupperAdmin','API\EmployeeController@addSupperAdmin');
Route::put('editsupperadmin/{id}','API\EmployeeController@editsupperadmin');
Route::post('faqCategory', 'API\EmployeeController@faqCategory');
Route::get('getFaqCategory','API\EmployeeController@getFaqCategory');
Route::put('edit-faqCategory/{id}','API\EmployeeController@updatefaqCategory');
Route::post('faq', 'API\EmployeeController@faq');
Route::get('getFaq','API\EmployeeController@getFaq');
Route::put('edit-faq/{id}','API\EmployeeController@updatefaq');
Route::post('features', 'API\EmployeeController@features');
Route::get('getfeatures','API\EmployeeController@getfeatures');
Route::put('edit-features/{id}','API\EmployeeController@updatefeatures');
