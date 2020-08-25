function calculation(){
// var price = document.getElementById("item-price");
// price.setAttribute("value", "");
const keydown = document.getElementById("item-price");

keydown.addEventListener('keyup', function(){
const input_message = document.getElementById("item-price").value;

console.log(input_message);
// console.log(keydown);
if (input_message >= 300 && input_message <= 9999999){
document.getElementById("add-tax-price").innerHTML = (input_message * 0.1);
document.getElementById("profit").innerHTML = input_message - (input_message * 0.1);
}});
};
window.addEventListener("load", calculation)

// input_message = `#{price}`;
// /console.log(price)
// const add_tax = document.getElementById("add-tax-price");
// console.log(add_tax)
// const profit = document.getElementById("profit");
// console.log(profit)