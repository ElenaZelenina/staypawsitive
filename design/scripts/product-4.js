
function init() {
    const dropDown = document.getElementById('size');
    dropDown.addEventListener('change', updatePrice);
    const quantity = document.getElementById('quantity');
    quantity.addEventListener('change', updatePrice);
    updatePrice();
}

function updatePrice() {
    const dropDown = document.getElementById('size');
    const prices = {
        '3.5': 13.99,
        '11': 33.99
    };
    const quantity = document.getElementById('quantity');
    const price = +quantity.value * prices[dropDown.value];
    document.getElementById('orderAmount').value = price.toFixed(2);
    document.getElementById('productPrice').innerText = '$' + price.toFixed(2);
    document.getElementById('price').value = price;
}

window.onload = init;