
function init() {
    const dropDown = document.getElementById('package');
    dropDown.addEventListener('change', updatePrice);
    const quantity = document.getElementById('quantity');
    quantity.addEventListener('change', updatePrice);
    updatePrice();
}

function updatePrice() {
    const dropDown = document.getElementById('package');
    const initPrice = 1.6;
    const quantity = document.getElementById('quantity');
    const price = initPrice * +quantity.value * +dropDown.value;
    document.getElementById('orderAmount').value = price.toFixed(2);
    document.getElementById('productPrice').innerText = '$' + price.toFixed(2);
    document.getElementById('price').value = price;
}

window.onload = init;