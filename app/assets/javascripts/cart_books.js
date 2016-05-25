function User(id, carts, email, admin) {
  this.id = id;
  this.carts = carts;
  this.email = email;
  this.admin = admin;
  this.currentCart = null;
}

User.prototype.findCurrentCart = function (currentCart) {
  if (currentCart !== null) {
    this.carts.forEach(function(cart){
      if (cart.id === currentCart.id) {
        currentCart = cart;
      }
    });
    this.currentCart = currentCart;
  } else {
    return null;
  }
};

var addToCart = function(){
  $('.addCart').on('click', function(e){
    e.preventDefault();
    var bookId = $(this).attr('data-bookId')
    $.ajax({
      type: "POST",
      data: {"book_id": bookId},
      url: "/cart_books",
      dataType: "json"
    }).done(function(data) {
      alert(data.book.title + " has been added to your cart.")
      findUser();
    });
  });
}

function findUser(){
  var id = $('input#user_id').val();
 $.ajax({
   type: "GET",
   url: "/users/" + id,
   dataType: "json"
 }).done(function(data){
   var user = new User(data.user.id, data.user.carts, data.user.email, data.user.admin);
   user.findCurrentCart(data.user.current_cart)
   toggleCart(user);
 });
}

function toggleCart(user){
  if (user.currentCart === null) {
    $('#cart').replaceWith("<a href='#' id='cart'>Cart</a>");
    $('#cart').hide();
  } else {
    cartNumber = 0;
    user.currentCart.cart_books.forEach(function(book){
      cartNumber += book.quantity;
    });
    $('#cart').replaceWith("<a href='/carts/" + user.currentCart.id + "' id='cart'>Cart(" + cartNumber + ")</a>");
    $('#cart').show();
  }
}

$(document).ready(function(){
  findUser();
  addToCart();
});
// I want to add a removeCart Function
