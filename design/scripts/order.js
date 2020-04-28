function init() {
    document.getElementById('pickup').addEventListener('change', showHidePickup);
    document.getElementById('regular').addEventListener('change', updateOrderTotal);
    document.getElementById('twoday').addEventListener('change', updateOrderTotal);
    document.getElementById('oneday').addEventListener('change', updateOrderTotal);
    document.getElementById('state').addEventListener('change', updateOrderTotal);
    updateOrderTotal();
}

function updateOrderTotal() {
    const orderAmount = getOrderAmount();
    const taxPercentage = getTaxPercentage();
    const tax = ((orderAmount * taxPercentage) / 100);
    const shipping = getShipping();
    let additionalShippingCost = 0;
    if(shipping > 0) {
        additionalShippingCost = getShippingTypeAdditionalPrice();
    }
    const shippingTypeName = getShippingTypeName();
    const orderTotal = +orderAmount + +tax + +shipping + +additionalShippingCost;
    document.getElementById('orderTax').innerText = tax.toFixed(2);
    document.getElementById('tax').value = tax;
    
    document.getElementById('orderShipping').innerText = shipping.toFixed(2);
    document.getElementById('shipping').value = shipping;

    document.getElementById('additionalShippingText').innerText = shippingTypeName;
    document.getElementById('additionalShippingValue').innerText = additionalShippingCost.toFixed(2);
    document.getElementById('additionalShipping').value = additionalShippingCost;
    
    document.getElementById('orderTotalDisplay').innerText = orderTotal.toFixed(2);
    document.getElementById('orderTotal').value = orderTotal;
}


function getOrderAmount() {
    return +document.getElementById('orderAmount').value;
}

function showHidePickup() {
    const shippingBlock = document.getElementById('shippingBlock');
    const pickup = document.getElementById('pickup');
    shippingBlock.style.display = pickup.checked ? 'none' : 'block';
    updateOrderTotal();
}


function getShipping() {
    const pickupCheckbox = document.getElementById('pickup');
    if(!pickupCheckbox.checked) {
        const orderAmount = getOrderAmount();
        if(orderAmount <= 50) return 7.95;
        if(orderAmount <= 150) return 9.95;
        if(orderAmount <= 300) return 11.95;
    }
    return 0;
}

function getShippingTypeName() {
    if(document.getElementById('regular').checked) return 'Regular Shippping';
    if(document.getElementById('twoday').checked) return 'Two Day Shipping';
    if(document.getElementById('oneday').checked) return 'One Day Shipping';
}

function getShippingTypeAdditionalPrice() {
    if(document.getElementById('regular').checked) return 0;
    if(document.getElementById('twoday').checked) return 5;
    if(document.getElementById('oneday').checked) return 10;
}

function getTaxPercentage() {
    const state = document.getElementById('state').value;
    return state === 'NC' ? 6.5 : 7.0;
}

window.onload = init;