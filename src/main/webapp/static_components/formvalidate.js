function UserValid() { 
	
	   
    let Name, EmailId, emailExp, phoneno, pass ,conpass;    
    Name = document.form["reg"].fname.value;
    phoneno = document.form["reg"].phone.value;
/*    radio1 = document.getElementById("rd1");
    radio2 = document.getElementById("rd2");
    radio3 = document.getElementById("rd3");*/
    pass= document.form["reg"].password.value;    
    conpass = document.form["reg"]["reg"].confirmpassword.value;    
    let EmailId = document.form["reg"].email.value;  
    let emailExp = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([com\co\.\in])+$/; // to validate email id    
    let passExp=  /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{6,15}$/;
    let phoneExp = new RegExp("^[0-9]{10}$"); 
    /*var today = new Date();*/ 
  
   

    if (Name == '' && phoneno == '' && pass == '' && conpass == '' && EmailId == '') 
    { 
        alert("Enter All Fields");    
        return false;    
    }    
    if (Name == '') 
    {    
        alert("Please Enter Name");    
        return false;    
    }    
    /*if(radio1.checked || radio2.checked || radio3.checked)
    {
        alert("Enter you gender");    
        return false;
    }*/
    
    if (phoneno != '')    
    {    
        if (!phoneExp.test(phoneno)) 
        {    
            alert("Invalid phone no, it must contain 10 digits");    
            return false;    
        }    
    }
/*    if ( dob == '' && dob=="mm/dd/yyyy")    
    {    
        alert("Please Enter date of birth");    
        return false;
    }*/
   /* if ( dob != '' && dob !="mm/dd/yyyy")    
    {    
        var diff = today.getTime() - dob.getTime(); 

        var daydiff = diff /(365 * 1000 * 60 * 60 * 24) ;
        daydiff= Math.round(daydiff);
        if(daydiff<15)
        {
            alert("Please Enter valid date of birth");    
            return false;
        }
    }*/
    if ( pass == '')    
    {    
        alert("Please Enter password");    
        return false;    
    }   
    if (pass != '')    
    {    
        if (!pass.match(passExp))  
        {    
            alert("password must contain between 6 to 15 characters" 
               + "* which contain at least "
              + "* one lowercase letter "
              +"* one uppercase letter"
            +"* one numeric digit"
            +"* and one special character");    
            return false;    
        }    
    }
    if (pass != '' && conpass == '')    
    {    
        alert("Please Confirm word");    
        return false;    
    } 
    if (conpass != '')    
    {    
        if (!conpass.match(passExp))    
        {    
            alert("password must contain between 6 to 15 characters which contain at least one lowercase letter, one uppercase letter, one numeric digit, and one special character");    
            return false;    
        }    
    }
    if ( pass!= conpass)    
    {    
        alert("Password and confirm password not match");    
        return false;    
    }    
    if (EmailId == '')    
    {    
        alert("Email Id Is Required");    
        return false;    
    }    
    if (EmailId != '')    
    {    
        if (!EmailId.match(emailExp))    
        {    
            alert("Invalid Email Id");    
            return false;    
        }    
    }    
    return true;    
}  