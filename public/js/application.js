$(document).ready(function() {

    // var $image = $("img").first();
    // var $downloadingImage = $("<img>");
    // $downloadingImage.load(function(){
    //   $image.attr("src", $(this).attr("src"));
    // });
    // console.log("HELLO");
    // console.log(this);
    // $downloadingImage.attr("src", "public/comic-con-logo.png");

  //GET the form and put on the page
  //not binding to correct thing
    $('.restaurant-details').on('submit', 'href', function(event) {
    event.preventDefault();
    var url = $(this).attr('href');
    console.log(this);
    console.log("In the new review action")
    $(this).hide();
    // var url = $(this).attr('action');
    // console.log(url);
    $.ajax({
      url: url,
      method: "get",    // this is the default
      data: $(this).serialize()
  })
  .done(function(response) {
    console.log("response: " + response);
    $('.add_review').html(response);
    console.log("I'M in the APPEND Callback!");
    });
  });


}); // document ready

