let donation10;
let donation25;
let donation50;
let donation100;
let donationCustom;

let allButtons = [];

function init() {
    donation10 = document.getElementById('donation10');
    donation25 = document.getElementById('donation25');
    donation50 = document.getElementById('donation50');
    donation100 = document.getElementById('donation100');
    donationCustom = document.getElementById('donationCustom');

    allButtons = [
        donation10, donation25, donation50, donation100, donationCustom
    ];

    donation10.addEventListener('click', function () { setDonation(donation10, 10); });
    donation25.addEventListener('click', function () { setDonation(donation25, 25); });
    donation50.addEventListener('click', function () { setDonation(donation50, 50) });
    donation100.addEventListener('click', function () { setDonation(donation100, 100); });
    donationCustom.addEventListener('click', function () { setDonation(donationCustom, +donationCustom.value); });
    donationCustom.addEventListener('change', function () { setDonationAmount(donationCustom.value); });
}

function setDonation(activeButton, amount) {
    for (let i = 0; i < allButtons.length; i++) {
        const button = allButtons[i];
        if (button.id !== activeButton.id) {
            button.classList.remove('active');
        }
    }
    activeButton.classList.add('active');

    setDonationAmount(amount);
}

function setDonationAmount(value) {
    document.getElementById('donationAmount').value = value;
    //document.getElementById('selectedAmount').innerText = value;
}

window.onload = init;