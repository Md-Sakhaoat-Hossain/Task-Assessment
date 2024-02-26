import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_assessment/style.dart';
import 'package:task_assessment/utility.dart';

var BaseURL="https://www.pqstec.com/InvoiceApps/Values/Authorization";
var RequestHeader={"Content-Type":"application/json"};

Future<bool> LoginRequest(FormValues) async{
  var URL=Uri.parse("${BaseURL}/login");
  var PostBody=json.encode(FormValues);
  var response= await http.post(URL,headers:RequestHeader,body: PostBody);
  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);
  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    await WriteUserData(ResultBody);
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}

Future<bool> RegistrationRequest(FormValues) async{
  var URL=Uri.parse("${BaseURL}/registration");
  var PostBody=json.encode(FormValues);
  var response= await  http.post(URL,headers:RequestHeader,body: PostBody);
  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);
  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}
