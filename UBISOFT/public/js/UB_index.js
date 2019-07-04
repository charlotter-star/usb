
$(function () { 

  //重置 选中元素 及其 周围元素的类名 的函数
  function reset_class($elem) { 
    var $brandlist = $("ul.brand-list");
   $elem.attr("class", "center")
      .siblings().attr("class", "periphery");
    $(".brand-list .center").prev().attr("class", "pre1")
      .prev().attr("class", "pre2");
    $(".brand-list .center").next().attr("class", "next1")
      .next().attr("class", "next2");
  }
  //先清除事先绑定，在添加事件绑定

  //查找logo指示器并绑定对应的点击事件
  $("ul.brand-list li").click(brand_click);
  function brand_click(){
    var $brand = $(this);
    var $brandlist = $("ul.brand-list");
    var $brands=$("ul.brand-list li");
    //判断点击时触发的元素所对应的类名是什么，并执行对应的操作
    if($brand.is(".pre2")) { 
      $brandlist.addClass("brand-right2");
      setTimeout(function(){
        $brandlist.attr("class","brand-list"); 
        $brands.last().remove().prependTo($brandlist)
        .parent().children().last().remove().prependTo($brandlist);
      },400);
      clearTimeout();
    }
    if($brand.is(".pre1")) {
      $brandlist.addClass("brand-right1");
      setTimeout(function(){
        $brandlist.attr("class","brand-list");
        $brands.last().remove().prependTo($brandlist);
      },400);
      clearTimeout();
    }
    if($brand.is(".next1")) {
      $brandlist.addClass("brand-left1");
      setTimeout(function(){
        $brandlist.attr("class","brand-list");
        $brands.first().remove().appendTo($brandlist);
      },400)
      clearTimeout();
    }
    if($brand.is(".next2")) { 
      $brandlist.addClass("brand-left2");
      setTimeout(function(){
        $brandlist.attr("class","brand-list"); 
        $brands.first().remove().appendTo($brandlist)
        .parent().children().first().remove().appendTo($brandlist);
      },400)
      clearTimeout();
    }
    $(".banner-list li").attr("class", "");
    var banners = document.getElementsByClassName("banner-list")[0].children;
    for (var b of banners) { 
      if (b.index == this.index) { 
        b.className = "center";
      }
    }
    //修改所有logo指示器的类名
    reset_class($brand);
    //先清除事件绑定，在添加事件绑定
    $("ul.brand-list li").off("click",brand_click)
    setTimeout(function(){
      $("ul.brand-list li").on("click",brand_click)
    },400)
  }
  //右箭头绑定点击事件
  var $right = $(".control-right");
  $right.click(brand_right);
  function brand_right() { 
    var $brandlist = $("ul.brand-list");
    reset_class($(".brand-list .pre1"));  
    $brandlist.addClass("brand-right1");
    setTimeout(function(){
      $brandlist.attr("class","brand-list");
      $("ul.brand-list li").last().remove().prependTo($brandlist);
    },400);
    clearTimeout();
    $(".banner-list li").attr("class", "");
    var banners = document.getElementsByClassName("banner-list")[0].children;
    var center = document.querySelector(".brand-list .center");
    for (var b of banners) { 
      if (b.index == center.index) { 
        b.className = "center";
      }
    }
    $right.off("click", brand_right);
    setTimeout(function () {
      $right.on("click", brand_right)
    }, 400);
  }
  //左键头绑定点击事件
  var $left = $(".control-left");
  $left.click(brand_left);
  function brand_left() { 
    reset_class($(".brand-list .next1"));  //重置 选中元素 及其 周围元素 的类
    var $brandlist = $("ul.brand-list");
    $brandlist.addClass("brand-left1");
    setTimeout(function(){
      $brandlist.attr("class","brand-list");
      $("ul.brand-list li").first().remove().appendTo($brandlist);
    },400);
    clearTimeout();
    $(".banner-list li").attr("class", "");
    var banners = document.getElementsByClassName("banner-list")[0].children;
    var center = document.querySelector(".brand-list .center");
    for (var b of banners) { 
      if (b.index == center.index) { 
        b.className = "center";
      }
    }
    $left.off("click", brand_left);
    setTimeout(function () {
      $left.on("click", brand_left)
    }, 400);
  }

})

