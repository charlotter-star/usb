
window.onload = function () { 
  var reg=/^\w+[(\w\-_]*@[\w\-_]+\.[A-Za-z]+$/;
  var $btn_login = document.getElementsByClassName("btn-login")[0];
  var email_span = email.nextElementSibling;
  var upwd_span=upwd.nextElementSibling
  email.onblur=function(){
    if(email.value==""){
      email_span.innerHTML="需要邮箱地址";
      email.className="vali-warn";
    }else if(reg.test(email.value)==false){
      email_span.innerHTML="邮箱地址无效";
      email.className="vali-warn";
    }else{
      email_span.innerHTML="";
      email.className = "";
      return true;
    }
  }
  upwd.onblur=function(){
    var span=upwd.nextElementSibling
    if(upwd.value==""){
      upwd_span.innerHTML="需要密码";
      upwd.className="vali-warn";
    }else{
      upwd_span.innerHTML="";
      upwd.className = "";
      return true;
    }
  }
  $btn_login.onclick = function () {
    var b1=email.onblur();
    var b2=upwd.onblur();
    if (b1 && b2) { 
      var xhr=new XMLHttpRequest();
      xhr.onreadystatechange=function(){
        if(xhr.readyState==4&&xhr.status==200){
          var result=xhr.responseText;
          if (result!=0) {
            alert("登录成功");
            // document.cookie = `uid=${result}`;
            location.href = "UB_store.html";
          }else{
            alert("用户名或密码错误");
          }
        }
      }
      xhr.open("post", "http://127.0.0.1:8888/user/login", true);
      xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
      var formdata = `email=${email.value}&upwd=${upwd.value}`;
      xhr.send(formdata);
    }
  }
}

