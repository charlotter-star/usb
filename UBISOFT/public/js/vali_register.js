
window.onload = function () {
  //简化常用的DOM查找
  function prev(prev) { return prev.previousElementSibling }
  function next(next) { return next.nextElementSibling }
  function getId(id) { return document.getElementById(id) }
  //获取事件触发的元素
  var email_vali = getId("email-vali");
  var email_reg = /^\w+[(\w\-_]*@[\w\-_]+\.[A-Za-z]+$/;
  var prompt_boxs = document.getElementsByClassName("prompt-box");
  var inputs = document.querySelectorAll("input[type=text]");
  
  var uname_value, email_value, email_vali_value, upwd_value;

  //表单获取焦点时的提示信息
  for (var prompt_box of prompt_boxs) { 
    next(prompt_box).onfocus = function () { 
      prev(this).classList.remove("hidden");
      prev(this).classList.add("show");
    }
  }
  for (var input of inputs) { 
    input.addEventListener("focus",function () { 
      vali(this, "");
    })
  }

  function vali(elem,msg,className="") { 
    next(elem).innerHTML=msg;
    elem.className=className;
  }

  email.onblur = function () {
    prev(this).classList.add("hidden");
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () { 
      var result = xhr.responseText;
      if (xhr.readyState == 4 && xhr.status == 200) { 
        if (email.value == "") {
          vali(email, "需要邮箱地址", "vali-warn");
        } else if (email_reg.test(email.value) == false) {
          vali(email, "邮箱地址无效", "vali-warn");
        } else if (result=="1") { 
          vali(email, "邮箱已被注册", "vali-warn");
        } else {
          vali(email, "");
          email_value=true;
        }
      }
    };
    xhr.open("get", "http://127.0.0.1:8888/user/vali_email?email="+email.value, true);
    xhr.send(null);
  }
  email_vali.onblur = function () { 
    if (email_vali.value == "") {
      vali(email_vali, "需要邮箱地址", "vali-warn");
    } else if (email_reg.test(email_vali.value) == false) {
      vali(email_vali, "邮箱地址无效", "vali-warn");
    } else if (email_vali.value != email.value) {
      vali(this, "邮箱地址不匹配", "vali-warn");
    } else { 
      vali(email_vali, "");
      email_vali_value = true;
    }
  }
  upwd.onblur = function () {
    prev(this).classList.add("hidden");
    if (upwd.value == "") {
      vali(upwd, "需要密码", "vali-warn")
    } else { 
      vali(upwd, "");
      upwd_value=true;
    }
      
  }
  // upwd.onkeydown=function(){}

  uname.onblur = function () {
    prev(this).classList.add("hidden");
    var uname = document.getElementById("uname");
    var value = uname.value.trim();
    console.log(value);
    console.log(uname);

    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () { 
      if (xhr.readyState == 4 && xhr.status == 200) { 
        var result = xhr.responseText;
        console.log(result);
        if (value == "") {
          vali(uname, "需要用户名", "vali-warn");
        } else if (value.length < 3) {
          vali(uname, "太短了", "vali-warn");
        } else if (result=="1") { 
          vali(uname, "用户名已被占用", "vali-warn");
        } else { 
          vali(uname, "");
          uname_value=true;
        }
      }
    };
    xhr.open("get", "http://127.0.0.1:8888/user/vali_uname?uname="+value, true);
    xhr.send(null);
  }

  tou.onclick = function () { 
    if (this.checked==true) { this.className=""}
  }

  reg.onclick = function () { 
    //调用所有验证并获取返回值
    email.onblur();
    email_vali.onblur();
    uname.onblur();
    upwd.onblur();
    //判断生日是否有值
    var selects = document.getElementsByTagName("select");
    var time_arr=[];
    for (var select of selects) { 
      var time = select.children[select.selectedIndex].value;
      if (time == "") {
        select.className = "vali-warn";
        next(birthday).innerHTML = "输入您的生日";
      } else { 
        time_arr.push(time);
      }
    }
    if (tou.checked==false) {tou.className="vali-warn" }
    //判断所有验证的返回值
    if (email_value && email_vali_value && uname_value && upwd_value && time_arr.length == 3) {
      var xhr = new XMLHttpRequest();
      xhr.onreadystatechange = function () { 
        if (xhr.readyState == 4 && xhr.status == 200) { 
          var result = xhr.responseText;
          alert(result);
          location.replace("login.html");
        }
      }
      xhr.open("post", "http://127.0.0.1:8888/user/register", true);
      xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
      var birthday_value = time_arr.join("-");
      var formdata = `email=${email.value}&uname=${uname.value}&upwd=${upwd.value}&birthday=${birthday_value}`;
      console.log(formdata);
      xhr.send(formdata);
    }
  }
}





