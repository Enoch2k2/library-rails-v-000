var addToCart = function(){
  $('.addCart').on('click', function(e){
    e.preventDefault();
    var bookId = $(this).attr('data-bookId')
    $.post('/cart_books', {"book_id": bookId})
    .done(function(data){
      alert(data);
    });
  });
}

function findCart(){

}

function hideCart(){

}

$(document).ready(function(){
  addToCart();
});
// I want to add a removeCart Function
