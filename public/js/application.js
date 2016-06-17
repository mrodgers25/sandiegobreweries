$(document).ready(function() {

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

