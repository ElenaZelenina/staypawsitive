
function init() {
    const quantity = document.getElementById('quantity');
    quantity.addEventListener('change', updatePrice);
    updatePrice();
}

function updatePrice() {
    const initPrice = 9.99;
    const quantity = document.getElementById('quantity');
    const price = initPrice * +quantity.value;
    document.getElementById('orderAmount').value = price.toFixed(2);
    document.getElementById('productPrice').innerText = '$' + price.toFixed(2);
    document.getElementById('price').value = price;
}

window.onload = init;