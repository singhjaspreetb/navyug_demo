document.getElementById("name").addEventListener("keypress", myname);
document.getElementById("name").addEventListener("mouseover", myname);
function myname() {
	var name= document.register_form.name.value;
	var paragraph = document.getElementById("name_id");
	if(name.length==0){
		paragraph.textContent="Please enter your name !!";
		document.register_form.name.focus();
	}
	if(name.length<5 && name.length!=0){
		paragraph.textContent="Name should be greater than 5 character !!!";
		document.register_form.name.focus();
	}
	if(name.length>5){
		paragraph.textContent="";
	}
}

document.getElementById("email").addEventListener("keypress", myemail);
document.getElementById("email").addEventListener("mouseover", myemail);
function myemail() {
	var email= document.register_form.email.value;
	var paragraph = document.getElementById("email_id");
	if(email.length==0){
		paragraph.textContent="Please enter your email !!";
		document.register_form.email.focus();
	}
	else if(!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email))){
		paragraph.textContent="Enter valid email !!!";
		document.register_form.email.focus();
	}
	else{
		paragraph.textContent="";
	}
}

document.getElementById("number").addEventListener("keypress", mynumber);
document.getElementById("number").addEventListener("mouseover", mynumber);
function mynumber() {
	var number= document.register_form.number.value;
	var paragraph = document.getElementById("number_id");
	if(number.length==0){
		paragraph.textContent="Please enter your number !!";
		document.register_form.email.focus();
	}
	else if(!(/^[6-9]\d{9}$/.test(number))){
		paragraph.textContent="Enter valid Number !!!";
		document.register_form.number.focus();
	}
	else{
		paragraph.textContent="";
	}
}

document.getElementById("branch").addEventListener("keypress", mybranch);
document.getElementById("branch").addEventListener("mouseover", mybranch);
function mybranch() {
	var branch= document.register_form.branch.value;
	var paragraph = document.getElementById("branch_id");
	if(branch.length<1){
		paragraph.textContent="Please enter your branch !!";
		document.register_form.branch.focus();
	}
	else{
		paragraph.textContent="";
	}
}

document.getElementById("course").addEventListener("keypress", mycourse);
document.getElementById("course").addEventListener("mouseover", mycourse);
function mycourse() {
	var course= document.register_form.course.value;
	var paragraph = document.getElementById("course_id");
	if(course.length<1){
		paragraph.textContent="Please enter your course !!";
		document.register_form.course.focus();
	}
	else{
		paragraph.textContent="";
	}
}

document.getElementById("gender").addEventListener("keypress", mygender);
document.getElementById("gender").addEventListener("mouseover", mygender);
function mygender() {
	var gender= document.register_form.gender.value;
	var paragraph = document.getElementById("gender_id");
	if(gender!="M" || gender!="F" || gender!="T"){
		paragraph.textContent="Please enter your gender ( M | F | T ) !!";
		document.register_form.gender.focus();
	}
	else{
		paragraph.textContent="";
	}
}

document.getElementById("address").addEventListener("keypress", myaddress);
document.getElementById("address").addEventListener("mouseover", myaddress);
function myaddress() {
	var address= document.register_form.address.value;
	var paragraph = document.getElementById("address_id");
	if(address.length<5){
		paragraph.textContent="Please enter your Address !!";
		document.register_form.address.focus();
	}
	else{
		paragraph.textContent="";
	}
}
