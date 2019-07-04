

$(function () {

  //导航栏鼠标悬停时的样式修改
  $(".main-submenu").hover(
    function () { 
      $(this).prev().css({
        backgroundSize:"100% 100%",
        color:"#35c1cf"
      })
    },
    function () { 
      $(this).prev().css({
        backgroundSize:"",
        color:""
      })
    }
  )

  //修改以center为中心其他兄弟的class
  function update_class($class){
    $class.attr("class","center")
      .siblings().attr("class","periphery");
    var $center=$(".center");
    $center.prev().attr("class","prev1")
      .prev().attr("class","prev2");
    $center.next().attr("class","next1")
      .next().attr("class","next2");
  }
  //左箭头按钮绑定事件
  $(".control-left").click(function(){
    update_class($(".next1"));
    var $changxiao_list=$(".changxiao-list");
    $changxiao_list.addClass("left");  //添加向左偏移的class
    setTimeout(function(){
      //0.4秒后，移出向左偏移的class，并把第一个子元素移动至最后一个
      $changxiao_list.removeClass("left").children()
      .first().remove().appendTo($changxiao_list);
    },300)
  })
  //右箭头按钮绑定事件
  $(".control-right").click(function(){
    update_class($(".prev1"));
    var $changxiao_list=$(".changxiao-list");
    $changxiao_list.addClass("right");
    setTimeout(function(){
      $changxiao_list.removeClass("right").children()
      .last().remove().prependTo($changxiao_list);
    },300)
  })

  
/*************轮播***************/
  
  var $carousel_list = $(".carousel-list");

  //自动轮播
  function carousel() {
    $carousel_list.removeAttr("style").addClass("right");
    setTimeout(function(){
      $carousel_list.removeClass("right")
      .children().first().remove().appendTo($carousel_list);
    }, 400);
    $()
  }
  //绑定 启动 和 清除 定时器的事件
  var t=setInterval(carousel,5000);
  $(".carousel").mouseout(function () {
    t = setInterval(carousel, 5000);
  });
  $(".carousel").mouseover(function () {
    clearInterval(t)
  });
  
  //指示器
  $(".pointer-item").click(pointer)
  function pointer() {
    $carousel_list.removeAttr("style");
    var $first=$(".carousel-item:first-child").clone();
    for(var i=1;i<=$(".pointer-item").length;i++){
      $(`.item${i}`).appendTo($carousel_list);
      if($first.hasClass(`item${i}`)){
        $carousel_list.css("left",`-${(i-1)*100}%`);
      }
    }
    setTimeout(()=>{
      $carousel_list.css("left",`-${$(this).index()*100}%`)
      .css("transition","0.4s");
      setTimeout(()=>{
        for(var i=0;i<$(this).index();i++){
          $(".carousel-item:first-child").remove().appendTo($carousel_list);
        }
        $carousel_list.removeAttr("style");
        $(".pointer-item").on("click",pointer);
      },400)
    },0);
    $(".pointer-item").off("click",pointer);
  }

  //左箭头绑定事件函数
  $(".carousel .control-left").click(left_arrow);
  function left_arrow() {
    $carousel_list.removeAttr("style");
    $(".carousel-item:last-child").remove().prependTo($carousel_list)
    .parent().css("left", "-100%")
    setTimeout(() => { 
      $carousel_list.css("transition", "0.4s").css("left", "0%");
      setTimeout(() => {
        $(this).on("click",left_arrow);
      },400);
    },0)
    $(this).off("click",left_arrow);
  }
  //右箭头绑定事件函数
  $(".carousel .control-right").click(right_arrow);
  function right_arrow(){
    carousel();
    $(this).off("click",right_arrow);
    setTimeout(()=>{
      $(this).on("click",right_arrow);
    },400)
  }
})


