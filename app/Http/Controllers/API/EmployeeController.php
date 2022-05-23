<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Controllers\FrontBaseController;
use App\Events\CompanyCreated;
use Illuminate\Support\Facades\Hash;
use App\Http\Controllers\API\BaseController as BaseController;
use Illuminate\Http\Request;
use App\Models\Employee;
use App\Models\Admin;
use App\Models\Company;
use App\Models\Holiday;
use App\Models\Award;
use App\Models\Noticeboard;
use App\Models\Department;
use App\Models\Country;
use App\Models\ContactRequest;
use App\Models\Faq;
use App\Models\FaqCategory;
use App\Models\Feature;
use App\Http\Requests\Front\Login\ForgotPasswordRequest;
use App\Http\Requests\Front\Login\LoginRequest;
use App\Http\Requests\Front\Login\ResetPasswordRequest;
use App\Http\Requests\Site\SignupRequest;
use App\Http\Controllers\SiteBaseController;
use App\Http\Requests\Site\ContactSubmitRequest;
use App\Models\EmailTemplate;
use App\Classes\Reply;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Password;
use App\Models\JobApplication;
use App\Models\LeaveApplication;
use App\Models\Payroll;
use App\Models\Job;
use App\Models\Attendance;
use Illuminate\Support\Str;
use App\Models\Expense;
use Carbon\Carbon;
use DB;
use App\Http\Requests\Front\Job\StoreRequest;
use File;
use Validator;;

class EmployeeController  extends BaseController
{
    public function getUsers()
    {
        
        $users=Employee::get();
        return response()->json($users);
       
    }

    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'employeeID'=> 'required',
            'company_id'=>'required',
            'designation'=> 'required',
            'full_name' => 'required',
            'father_name'=> 'required',
            'gender'=> 'required',
            'email' => 'required|email',
            'password' => 'required',
            'date_of_birth'=> 'required',
            'mobile_number'=> 'required',
            'local_address'=> 'required',
            'profile_image'=> 'required',
            'joining_date'=> 'required',
            'permanent_address'=> 'required',
           
        ]);
   
       
   
        $input = $request->all();
        $input['password'] = Hash::make($input['password']);
        $user = Employee::create($input);
       
   
        return response()->json($user);
    }


    public function login(Request $request)
    {

        $data = [
            'email' => $request['email'],
            'password' => $request['password'],
            'status' => 'active'
        ];

        $remember = false;

        if ($request->remember == 'on') {
            $remember = true;
        }

        $employee = Employee::where('email', $request->email)->first();

        if ($employee) {
            // Check user status
            if ($employee->status == 'inactive') {
                return response()->json('block email');
            }

            // Check company status
            if ($employee->company->status == 'inactive') {
                return response()->json('inactive from admin');
            }

            if (auth()->guard('employee')->attempt($data, $remember)) {

                $this->company_id = $employee->company_id;

                return response()->json( $employee);
            }
        }

        return response()->json('invalid');
    }

    public function getProfile($id=null)
    {
        if(empty($id)){
            $employee = Employee::get();
            return response()->json($employee);

        }else{
            $employee = Employee::find($id);
            return response()->json($employee);
        }
      

    }

    public function updateProfile(Request $request,$id)
    {
        $validator = Validator::make($request->all(), [
       
            'full_name' => 'required',
            'father_name'=> 'required',
            'gender'=> 'required',
            'email' => 'required|email',
            'password' => 'required',
            'date_of_birth'=> 'required',
            'mobile_number'=> 'required',
            'local_address'=> 'required',
            'profile_image'=> 'required',
            'joining_date'=> 'required',
            'permanent_address'=> 'required',
           
        ]);
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }



        if ($request->isMethod('put')) {
            $data = $request->input();
            // echo "<pre>";print_r($data);die();
            Employee::where('id',$id)->update(['full_name'=>$data['full_name'],'email'=>$data['email'],'father_name'=>$data['father_name'],
            'gender'=>$data['gender'],'date_of_birth'=>$data['date_of_birth'],'mobile_number'=>$data['mobile_number'],
            'local_address'=>$data['local_address'],'profile_image'=>$data['profile_image'],
            'joining_date'=>$data['joining_date'],'permanent_address'=>$data['permanent_address']]);
            return response()->json('success');
        }
    }

    public function joblist($id=null)
    {
        if(empty($id)){
          
            $job=Job::get();
            return response()->json($job);

        }else{
            $Job = Job::find($id);
            return response()->json($Job);
        }
     
    }


    public function jobsubmit(Request $request)
      {

    $validator = Validator::make($request->all(), [
       
        'job_id'=>'required',
         'name'=>'required', 
         'phone'=>'required',
          'email'=>'required', 
          'resume'=>'required|mimes:doc,docx,pdf,txt|max:2048',
           'cover_letter'=>'required', 
           'submitted_by'=>'required',
           'company_id'=>'required',
      
       
    ]);

    if($validator->fails()){
        return $this->sendError('Validation Error.', $validator->errors());       
    }

    // $input = $request->all();
    // $user = JobApplication::create($input);
    // $success['token'] =  $user->createToken('MyApp')->accessToken;
  

    // return $this->sendResponse($success, 'job submitted successfully.');
   
 $filename ="user_file.file";
 $path =$request->file('resume')->move(public_path("/"),$filename);
 $photoUrl=url('/'.$filename);
    $data = request()->all();
    // if ($request->hasFile('resume')) {
    //     $file = new Files();
    //     $filename = $file->upload($request->file('resume'), 'job_applications', null, null, false);
    //     $data['resume'] = $filename;
    // }
  $data['resume'] = $photoUrl;
    $user= JobApplication::create($data);



    return response()->json(['url'=>$photoUrl],200);

}

public function viewPayslip()
{
    $result = Payroll::get();
    return response()->json(['status'=>'successfully','result'=>$result]);
}

public function expense()
{
    $result = Expense::all();
    return response()->json(['status'=>'successfully','result'=>$result]);
}

public function viewPendingJoblist()
{
    $result = JobApplication::where('status','pending')->get();
    return response()->json(['status'=>'successfully','result'=>$result]);
}

public function leaveApplication(Request $request)
{

    $validator = Validator::make($request->all(), [
     
        'start_date' =>'required',
        'end_date' =>'required',
        'days' =>'required',
        'leaveType' =>'required',
        'halfDayType'=>'required',
        'reason' =>'required',
        'company_id' =>'required',
        'employee_id' =>'required',
      
       
    ]);

    if($validator->fails()){
        return $this->sendError('Validation Error.', $validator->errors());       
    }
    $data = request()->all();
    $user= LeaveApplication::create($data);
   


    return response()->json( 'Leave application submitted successfully.');

}


public function uploadjob(Request $request)
{

    $validator = Validator::make($request->all(), [
     
      
        'position' =>'required',
        'description' =>'required',
        'posted_date' =>'required',
        'last_date' =>'required',
        'close_date' =>'required',
        'company_id' =>'required',
        'status' =>'required',
       
        
       
      
      
       
    ]);

    if($validator->fails()){
        return $this->sendError('Validation Error.', $validator->errors());       
    }
    $data = request()->all();
    $user= Job::create($data);
    


    return response()->json( 'job uploaded  successfully.');

}

public function sendPayslip(Request $request)
{

    $output = [];
    $deductions = [];
    $allowances = [];
    $input = $request->all();

    // Allowances
    $i = 0;
    if (isset($input['allowanceTitle'])) {
        foreach ($input['allowanceTitle'] as $title) {
            if ($title != '') {
                $allowances[$title] = $input['allowance'][$i];
            }
            $i++;
        }
    }
    // Deductions
    $i = 0;
    if (isset($input['deductionTitle'])) {
        foreach ($input['deductionTitle'] as $title) {
            if ($title != '') {
                $deductions[$title] = $input['deduction'][$i];
            }
            $i++;
        }
    }

    $validator = Validator::make($request->all(), [
     
      
        'employee_id' =>'required',
        'year'=>'required',
        'month' =>'required',
        'net_salary'=>'required',
        'company_id'=>'required',
        'basic' =>'required',
        'overtime_hours' =>'required',
        'overtime_pay'=>'required',
        'total_deduction'=>'required',
        'expense' =>'required',
        'total_allowance' =>'required',
        'net_salary'=>'required',
        'company_id'=>'required'
       
    ]);

    if($validator->fails()){
        return $this->sendError('Validation Error.', $validator->errors());       
    }
    $data = request()->all();
    $user= Payroll::create($data);



    return response()->json( 'Payrol send successfully');

}

public function adminjoblist()
{

    $result = JobApplication::all();
    return response()->json(['status'=>'successfully','result'=>$result]);
}

public function adminleaveApplication($id=null)
{
    $result = LeaveApplication::get();
            return response()->json($result);
}



public function submitSignup(SignupRequest $request)
{
    \DB::beginTransaction();

    $company = Company::create($request->all());

    if (module_enabled('Subdomain')) {
        $company->sub_domain = $request->sub_domain;
        $company->save();
    }

    $code = Str::random(60);

    $admin = $this->createAdmin($request,$company,$code);


    \DB::commit();

    $inputs = $request->all();
    $inputs["name"] = $admin->name;
    $inputs["email"] = $admin->email;
    $inputs["login_url"] = route('login');
    $inputs["email_token"] = $code;
    $inputs["verify_link"] = route('admin.verify_email', $code);
    $inputs['fromEmail'] = $this->setting->email;
    $inputs['fromName'] = $this->setting->main_name;

    // Send email of account creation
    Mail::to($admin->email)->queue(new CompanySignedUp($inputs));

    // Send verification email
    Mail::to($admin->email)->queue(new VerifyEmail($inputs));

    $url = env('APP_ADDRESS');

    return response()->json('success');

}

public function adminlogin(Request $request)
{
    $input = $request->all();

    $remember = false;

    $data = ['email' => $input['email'], 'password' => $input['password']];

    if (isset($input['remember'])) {
        $remember = true;
    }

    // Check if admin exists in database with the credentials or not

    if (auth()->guard('admin')->attempt($data, $remember)) {

        $admin = admin();

        $admin->last_login = Carbon::now();
        $admin->number_of_logins = $admin->number_of_logins + 1;
        $admin->save();

 // Reset the lock screen session;

        $reply = [];

        if ($admin->type == 'superadmin') {
            $url = (\Session::has('back_url_superadmin')) ? \Session::get('back_url_superadmin') : \URL::route('superadmin.dashboard.index');
            $reply = Reply::redirect($url, trans('messages.loginSuccess'));
        } else if ($admin->type == 'admin') {

            $company = Company::where('id', '=', $admin->company_id)->first();

            // if(module_enabled('Subdomain')){
            //     $companyDomain = getCompanyBySubDomain();
            //     if($admin->company_id !==$companyDomain->id){
            //         auth()->guard('admin')->logout();
            //         $reply = Reply::error(trans('messages.loginInvalid'));
            //         $response = \Response::json($reply, 200);
            //         return $response;
            //     }
            // }

            if ($company->status == 'inactive') {
                auth()->guard('admin')->logout();
                $reply = Reply::error(trans("messages.companyDisabled"));
            } else {

                $url = (\Session::has('back_url_admin')) ? \Session::get('back_url_admin') : \URL::route('admin.dashboard.index');
                $reply = Reply::redirect($url, trans('messages.loginSuccess'));
            }
        }
    } else {
        $message = (\Session::get("lock") != 1) ? trans('messages.loginInvalid') : trans('messages.wrongPassword');
        $reply = Reply::error($message);
    }

    $response = \Response::json($reply, 200);

    if (isset($cookie)) {
        $response->withCookie($cookie);
    }

    return response()->json($admin);
}

public function sickleaveapplicationget()
{
    $result = LeaveApplication::where('leaveType','Sick Leave')->get();
    return response()->json(['status'=>'successfully','result'=>$result]);
}

public function viewAttendence()
{
    $result = Attendance::all();
    return response()->json(['status'=>'successfully','result'=>$result]);
}


public function approveLeaveApplication(Request $request,$id)
    {
        $validator = Validator::make($request->all(), [
       

            'application_status'=> 'required',
        
           
        ]);
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }



        if ($request->isMethod('put')) {
            $data = $request->input();
            // echo "<pre>";print_r($data);die();
            LeaveApplication::where('id',$id)->update(['application_status'=>$data['application_status']]);
            return response()->json('success');
        }
    }


  public function employlogout()
    {
        auth()->guard('employee')->logout();
        return response()->json('logout successfully');
    }
    public function adminlogout()
    {
        auth()->guard('admin')->logout();
        return response()->json('admin/supper Admin logout successfully');
    }

    public function adminProfile($id=null)
    {
        
     
        if(empty($id)){
          
            $job=Company::with('users')->get();
            return response()->json($job);

        }else{
            $Job = Company::with('users')->find($id);
            return response()->json($Job);
        }
        
      
    }


    public function attendencecheckin(Request $request)
    {
    
        $validator = Validator::make($request->all(), [
         
            'employee_id'=>'required',
            'clock_in' =>'required',
            'clock_out' =>'required',
            'date' =>'required',
            'status' =>'required',
           
        ]);
    
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }
        $data = request()->all();
        $user= Attendance::create($data);
    
    
        return response()->json('success');
    
    }


    public function clockOut()
    {
        $today = Carbon::now();
        $yesterday = Carbon::yesterday();
         $dates = [$today->format("Y-m-d"), $yesterday->format("Y-m-d")];
        $yesterday_attendance = Attendance::where('date', $dates)
            ->orderBy('date')
            ->get();
            return response()->json($yesterday_attendance);
    }

     public function updateClockout(Request $request,$id)
    {
        $validator = Validator::make($request->all(), [
       
            'clock_out'=> 'required',
           
        ]);
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }



        if ($request->isMethod('put')) {
            $data = $request->input();
            // echo "<pre>";print_r($data);die();
            Attendance::where('id',$id)->update(['clock_out'=>$data['clock_out']]);
            return response()->json('success');
        }
    }

    public function holydays()
    {
     $data = Holiday::get();
     return response()->json($data);
    }

    public function awardList()
    {
     $data = Award::get();
     return response()->json($data);
    }
    public function uploadExpense(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'company_id'=>'required',
            'employee_id'=>'required',
            'item_name'=>'required',
            'purchase_from'=>'required',
            'purchase_date'=>'required',
            'bill'=>'required|mimes:doc,docx,pdf,txt|max:2048',
            'price'=>'required',
            'status'=>'required',


        ]);
        if($validator->fails()){
            return $this->sendError('Validator Error.',$validator->errors());
        }
        

        $filename ="user_file.file";
        $path =$request->file('bill')->move(public_path("/"),$filename);
        $photoUrl=url('/'.$filename);


        $data = request()->all();
        // $data->purchase_date = Carbon::createFromFormat('d-m-Y', $request->purchase_date)->format('Y-m-d');
        $data['bill'] = $photoUrl;
        $user= Expense::create($data);
    
    
        return response()->json('success');

    }

    public function noticeBorad()
    {
       $data = Noticeboard::get();
       return response()->json($data);
    }


    public function uploadAward(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'company_id'=>'required',
            'employee_id'=>'required',
            'award_name'=>'required',
            'gift'=>'required',
            'cash_price'=>'required',
            'month'=>'required',
            'year'=>'required',

        ]);
        if($validator->fails()){
            return $this->sendError('Validator Error',$validator->errors());
        }
        $data = request()->all();
        $insert = Award::create($data);
        return response()->json('success');
    }

    public function uploadNoticeBoard(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'company_id'=>'required',
            'title'=>'required',
            'description'=>'required',
            'status'=>'required',
        ]);
        if($validator->fails()){
            return $this->sendError('Validator Error',$validator->errors());
        }
        $data =request()->all();
        $insert = Noticeboard::create($data);
        return response()->json('success');
    }

    public function departmentslist()
    {
        $data = Department::get();
        return response()->json($data);
    }

    // public function getnotice($id=null)
    // {
        
    // }

    public function updateNotice(Request $request,$id)
    {
        $validator = Validator::make($request->all(), [
       
            'company_id' => 'required',
            'title'=> 'required',
            'description'=> 'required',
            'status'=> 'required',
          
           
        ]);
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }


       if($request->isMethod('put')){
           $data = $request->input();
           $notice = Noticeboard::where('id',$id)->update(['title'=>$data['title'],'description'=>$data['description'],'status'=>$data['status']]);
           return response()->json('success');
       }
      
    }

    public function updatePayslips(Request $request,$id)
    {
       $validator=Validator::make($request->all(),[
           'company_id'=>'required',
           'employee_id'=>'required',
           'status'=>'required',
           'total_allowance'=>'required',

       ]);
       if($validator->fails()){
           return $this->sendError('Validation Error.',$validator->errors());
       }
       if($request->isMethod('put')){
           $data=$request->input();
           
           $update = Payroll::where('id',$id)->update(['company_id'=>$data['company_id'],'employee_id'=>$data['employee_id'],'status'=>$data['status'],'total_allowance'=>$data['total_allowance']]);
           return response()->json('success');
       }
    }

    public function updateExpense(Request $request,$id)
    {
       $validator=Validator::make($request->all(),[
           'company_id'=>'required',
           'employee_id'=>'required',
           'item_name'=>'required',
           'purchase_from'=>'required',
           'purchase_date'=>'required',
           'price'=>'required',
           'status'=>'required',
          

       ]);
       if($validator->fails()){
           return $this->sendError('Validation Error.',$validator->errors());
       }
       if($request->isMethod('put')){
           $data=$request->input();
           
           $update = Expense::where('id',$id)->update(['company_id'=>$data['company_id'],'employee_id'=>$data['employee_id'],'item_name'=>$data['item_name'],'purchase_from'=>$data['purchase_from'],'purchase_date'=>$data['purchase_date'],'price'=>$data['price'],'status'=>$data['status']]);
           return response()->json('success');
       }
    }

    public function listofcountry()
    {
       $country = Country::get();
       return response()->json($country);
    }
     public function listofcompany()
    {
       $company = Company::get();
       return response()->json($company);
    }
    public function addCompany(Request $request)
    {
        $data = $request->all();

       $company = Company::create($data);

       if(module_enabled('Subdomain')){
        $company->sub_domain = $request->sub_domain;
        $company->save();
    }
    $admin = Admin::create($data);
    $admin->email = $request->email;
    $admin->password = Hash::make($request['password']);
    $admin->company_id = $company->id;
    $admin->email_verified = 'yes';
    $admin->save();

    event(new CompanyCreated($company));
        

        

      return response()->json('success');

        
    }

    public function updatecompany(Request $request, $id)
    {
        
        $data = $request->all();
        $company = Company::findOrFail($id);

        if ($request->hasFile('logo')) {
            $file = new Files();
            $filename = $file->upload($request->file('logo'), 'company_logo', null, 200, false);
            $company->logo = $filename;
            $company->save();
        }
        if(module_enabled('Subdomain')){
            $company->sub_domain = $request->sub_domain;
            $company->save();
        }
   

        $company->update($data);
        return response()->json('success');
    }
    

    public function listofcontactlist()
    {
       $contactlist=ContactRequest::get();
       return response()->json($contactlist);
    }

    public function supperAdmin()
    {
       $supperAdmin=Admin::where('company_id',NULL)->get();
       return response()->json($supperAdmin);
    }

    // public function __construct()
    // {
    //     parent::__construct();
    //     $this->pageTitle = 'FAQ Category';
    //     $this->faqCategoryOpen = 'active open';
    //     $this->faqCategoryActive = 'active';

    //     $this->middleware(function ($request, $next) {
    //         if (admin()->type != 'superadmin') {
    //             echo View::make('admin.errors.noaccess', $this->data);
    //             die();
    //         }
    //         return response()->json('success');
    //     });
    // }

    public function addSupperAdmin(Request $request)
    {
        $validator=validator::make($request->all(),[
            'name'=>'required',
            'email'=>'required',
            'password'=>'required',
            
        ]);
        if($validator->fails()){
            return $this->sendError('Validator error.',$validator->errors());
        }
  
       
        $admin = new Admin();

        $admin->name = $request->name;
        $admin->email = $request->email;
        $admin->password = Hash::make($request['password']);
        $admin->save();

      return response()->json('success');

        
    }

    public function editsupperadmin(Request $request,$id)
    {
        $validator=validator::make($request->all(),[
            'name'=>'required',
            'email'=>'required',
            'password'=>'required',
        ]);
        if($validator->fails()){
            return $this->sendError('Validator error.',$validator->errors());
        }
    
  
        if($request->isMethod('put')){
  
       $data=$request->input();
        $Feature=Admin::where('id',$id)->update(['name'=>$data['name'],'email'=>$data['email'],'password'=>Hash::make($data['password'])]);
        return response()->json('success');
        }
    }

    public function faqCategory(Request $request)
    {
        $validator=validator::make($request->all(),[
            'name'=>'required',
            'status'=>'required',
        ]);
        if($validator->fails()){
            return $this->sendError('Validator error.',$validator->errors());
        }
       
        $faqCategory = new FaqCategory();

        $faqCategory->name = $request->name;
        $faqCategory->status = $request->status;
        $faqCategory->save();

            return response()->json('success');

        
    }


    public function getFaqCategory()
    {
       $faqCategory=FaqCategory::get();
       return response()->json($faqCategory);
    }

    public function updatefaqCategory(Request $request,$id)
    {
        $validator=validator::make($request->all(),[
            'name'=>'required',
            'status'=>'required',
        ]);
        if($validator->fails()){
            return $this->sendError('Validator error.',$validator->errors());
        }
        if($request->isMethod('put')){
            $data=$request->input();
        $faqCategory=FaqCategory::where('id',$id)->update(['name'=>$data['name'],'status'=>$data['status']]);
        return response()->json('success');
        }
    }

    public function faq(Request $request)
    {
        $validator=validator::make($request->all(),[
            'faq_category_id'=>'required',
            'title'=>'required',
            'content_text'=>'required',
            
        ]);
        if($validator->fails()){
            return $this->sendError('Validator error.',$validator->errors());
        }
       
        $faq = new Faq();

        $faq->faq_category_id = $request->faq_category_id;
        $faq->title = $request->title;
        $faq->content_text = $request->content_text;
        $faq->save();

      return response()->json('success');

        
    }


    public function getFaq()
    {
       $faq=Faq::get();
       return response()->json($faq);
    }

    public function updatefaq(Request $request,$id)
    {
        $validator=validator::make($request->all(),[
            'faq_category_id'=>'required',
            'title'=>'required',
            'content_text'=>'required',
        ]);
        if($validator->fails()){
            return $this->sendError('Validator error.',$validator->errors());
        }
        if($request->isMethod('put')){
            $data=$request->input();
        $faq=Faq::where('id',$id)->update(['faq_category_id'=>$data['faq_category_id'],'title'=>$data['title'],'content_text'=>$data['content_text']]);
        return response()->json('success');
        }
    }

    public function features(Request $request)
    {
        $validator=validator::make($request->all(),[
            'image'=>'required',
            'title'=>'required',
            'description'=>'required',
            
        ]);
        if($validator->fails()){
            return $this->sendError('Validator error.',$validator->errors());
        }
        $filename ="user_file.file";
        $path =$request->file('image')->move(public_path("/"),$filename);
        $photoUrl=url('/'.$filename);
       
        $Feature = new Feature();

        $Feature->image = $photoUrl;
        $Feature->title = $request->title;
        $Feature->description = $request->description;
        $Feature->save();

      return response()->json('success');

        
    }


    public function getfeatures()
    {
       $Feature=Feature::get();
       return response()->json($Feature);
    }

    public function updatefeatures(Request $request,$id)
    {
        $validator=validator::make($request->all(),[
           
            'title'=>'required',
            'description'=>'required',
        ]);
        if($validator->fails()){
            return $this->sendError('Validator error.',$validator->errors());
        }
    
  
        if($request->isMethod('put')){
  
       $data=$request->input();
        $Feature=Feature::where('id',$id)->update(['title'=>$data['title'],'description'=>$data['description']]);
        return response()->json('success');
        }
    }
}

