$(function () { 
  $.ajax({
    url: "UB_store_header.html",
    type: "get",
    success: function (result) {
      $("header").html(result);
      // $(`<link rel="stylesheet" href="./css/store_header.css">`).appendTo("head");
    }
  });
})


