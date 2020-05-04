
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
        'small': 24.99,
        'medium': 34.99,
        'large': 44.99,
        'x-large': 54.99
    };
    const quantity = document.getElementById('quantity');
    const price = +quantity.value * prices[dropDown.value];
    document.getElementById('orderAmount').value = price.toFixed(2);
    document.getElementById('productPrice').innerText = '$' + price.toFixed(2);
    document.getElementById('price').value = price;
}

window.onload = init;