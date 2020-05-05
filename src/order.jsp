<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="keywords" content="web, website, group project" />
    <title>Stay Pawsitive: Order</title>
    <link href="styles/main.css" rel="stylesheet" />
    <link href="styles/order.css" rel="stylesheet" />
    <script src="scripts/order.js"></script>
</head>

<body>
    <div id="page-container">
        <div id="content-wrap">
            <header>
                <img id="logo" src="images/logo.png" alt="logo" />
                <nav>
                    <ul>
                        <li><a href="index.html">Home</a></li>
                        <li><a href="about.html">About Us</a></li>
                        <li><a href="store.html">Store</a></li>
                        <li><a href="faq.html">FAQ</a></li>
                        <li><a href="donation.html">Donation</a></li>
                        <li><a href="shipping.html">Shipping</a></li>
                    </ul>
                </nav>
            </header>
            <main>
                <h1>Your Order:</h1>
                <div class="text-section">
                    <img src="images/productsml.png" alt="" class="product-order">
                    <div class="product-order">
                        <h3><%= session.getAttribute("productName")%></h3>                      
                    </div>
                    <div class="quantity-price">
                        <div class="quantity">Quantity: <span id="quantity"><%= session.getAttribute("quantity")%></span></div>                        
                        <div class="totals">Total Price: <span id="totals"><%= session.getAttribute("price")%></span></div>
                    </div>
                    <br class="clear" />
                </div>
                <form action="ShippingServer.jsp" method="POST">
                    <input type="hidden" name="productId" id="productId" value="<%= session.getAttribute("productId")%>">
                    <input type="hidden" name="quantity" id="quantity" value="<%= session.getAttribute("quantity")%>">
                    <input type="hidden" name="productName" id="productName" value="<%= session.getAttribute("productName")%>">
                    <input type="hidden" name="orderTotal" id="orderTotal" value="0" />
                    <input type="hidden" name="orderAmount" id="orderAmount" value="<%= session.getAttribute("price")%>" />
                    <input type="hidden" name="tax" id="tax" value="0" />
                    <input type="hidden" name="shipping" id="shipping" value="0" />
                    <input type="hidden" name="additionalShipping" id="additionalShipping" value="0" />

                    <div>
                        <input type="checkbox" id="pickup" name="pickup" value="false">
                        <label for="pickup">I will pick my order up</label><br>
                    </div>

                    <div id="shippingBlock">
                        <div class="shipping-cost" id="shippingCost">
                            <h2>Regular Shipping Cost:</h2>
                            <table class="shipping-cost">
                                <thead>
                                    <tr>
                                        <th>Order Amount</th>
                                        <th>Shipping Cost</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>$50 or less</td>
                                        <td>$7.95</td>
                                    </tr>
                                    <tr>
                                        <td>Over $50 but not more than $150</td>
                                        <td>$9.95</td>
                                    </tr>
                                    <tr>
                                        <td>Over $150 but not more than $300</td>
                                        <td>$11.95</td>
                                    </tr>
                                    <tr>
                                        <td>Over $300</td>
                                        <td>Free</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div id="deliveryOptions">
                            <h2 class="delivery-option">Choose a delivery option:</h2>
                            <div class="delivery-option">
                                <div>
                                    <input type="radio" id="regular" name="delivery" value="regular" checked>
                                    <label for="regular">Regular Shippping ($0 additional charge)</label>
                                </div>
                                <div>
                                    <input type="radio" id="twoday" name="delivery" value="twoday">
                                    <label for="twoday">Two Day Shipping + $5.00 additional charge</label>
                                </div>
                                <div>
                                    <input type="radio" id="oneday" name="delivery" value="oneday">
                                    <label for="oneday">One Day Shipping + $10.00 additional charge</label>
                                </div>
                            </div>
                        </div>

                        <br class="clear" />
                        <div id="shippingInformation">
                            <h2>Shipping information:</h2>
                            <div class="address">
                                <div>
                                    <label for="fname">First Name:</label>
                                    <input type="text" id="fname" name="customerFirstName">
                                    <label for="lname" class="second">Last Name:</label>
                                    <input type="text" id="lname" name="customerLastName">
                                </div>
                                <div>
                                    <label for="adr">Address First Line:</label>
                                    <input type="text" id="adr" name="customerAddress">
                                </div>
                                <div>
                                    <label for="adr2">Address Second Line:</label>
                                    <input type="text" id="adr2" name="customerAddress2">
                                    <label for="apt" class="second">Apartment/Suite Number:</label>
                                    <input type="text" id="apt" name="customerApartment">
                                </div>
                                <div>
                                    <label for="city">City:</label>
                                    <input type="text" id="city" name="customerCity">
                                    <label for="state" class="second">State:</label>
                                    <select name="state" id="state">
                                        <option value="AL">Alabama</option>
                                        <option value="AK">Alaska</option>
                                        <option value="AZ">Arizona</option>
                                        <option value="AR">Arkansas</option>
                                        <option value="CA">California</option>
                                        <option value="CO">Colorado</option>
                                        <option value="CT">Connecticut</option>
                                        <option value="DE">Delaware</option>
                                        <option value="DC">District of Columbia</option>
                                        <option value="FL">Florida</option>
                                        <option value="GA">Georgia</option>
                                        <option value="HI">Hawaii</option>
                                        <option value="ID">Idaho</option>
                                        <option value="IL">Illinois</option>
                                        <option value="IN">Indiana</option>
                                        <option value="IA">Iowa</option>
                                        <option value="KS">Kansas</option>
                                        <option value="KY">Kentucky</option>
                                        <option value="LA">Louisiana</option>
                                        <option value="ME">Maine</option>
                                        <option value="MD">Maryland</option>
                                        <option value="MA">Massachusetts</option>
                                        <option value="MI">Michigan</option>
                                        <option value="MN">Minnesota</option>
                                        <option value="MS">Mississippi</option>
                                        <option value="MO">Missouri</option>
                                        <option value="MT">Montana</option>
                                        <option value="NE">Nebraska</option>
                                        <option value="NV">Nevada</option>
                                        <option value="NH">New Hampshire</option>
                                        <option value="NJ">New Jersey</option>
                                        <option value="NM">New Mexico</option>
                                        <option value="NY">New York</option>
                                        <option value="NC">North Carolina</option>
                                        <option value="ND">North Dakota</option>
                                        <option value="OH">Ohio</option>
                                        <option value="OK">Oklahoma</option>
                                        <option value="OR">Oregon</option>
                                        <option value="PA">Pennsylvania</option>
                                        <option value="RI">Rhode Island</option>
                                        <option value="SC">South Carolina</option>
                                        <option value="SD">South Dakota</option>
                                        <option value="TN">Tennessee</option>
                                        <option value="TX">Texas</option>
                                        <option value="UT">Utah</option>
                                        <option value="VT">Vermont</option>
                                        <option value="VA">Virginia</option>
                                        <option value="WA">Washington</option>
                                        <option value="WV">West Virginia</option>
                                        <option value="WI">Wisconsin</option>
                                        <option value="WY">Wyoming</option>
                                    </select>
                                    <label for="country" class="second">Country:</label>
                                    <input type="text" id="country" name="customerCountry" placeholder="United States"
                                        disabled>
                                </div>
                                <div>
                                    <label for="comments">Special Delivery Instructions:</label>
                                    <textarea rows="2" cols="110" id="comments" name="customerComments">
                            </textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="payment">
                        <h2>Payment information:</h2>
                        <div class="payment-inner">
                            <div>
                                <input type="checkbox" id="billingShipping" name="billingShipping" value="false"
                                    disabled checked>
                                <label for="billingShipping">Billing address is same as shipping address</label><br>
                            </div>
                            <div>
                                <input type="radio" id="credit" name="paymentType" value="credit" checked>
                                <label for="credit">Credit Card</label>
                                <input type="radio" id="debit" name="paymentType" value="debit" class="second">
                                <label for="debit">Debit</label>
                            </div>
                            <div>
                                <label for="cname">Name on Card:</label>
                                <input type="text" id="cname" name="cardname" required>
                            </div>
                            <div>
                                <label for="ccnum">Card Number:</label>
                                 <input type="text" id="ccnum" name="cardnumber" 
                                    pattern="[0-9]{16}" required title="The credit card number should be 16 digits long">
                            </div>
                            <div>
                                <label for="expdate">Expiration Date:</label>
                                <input type="text" id="expdate" name="expdate" required
                                    pattern="[0-1][0-9]\/[0-9]{2}" title="Should be in format 'MM/YY'">
                                <label for="cvv" class="second">CVV:</label>
                                <input type="text" id="cvv" name="cvv" required
                                    pattern="[0-9]{3,4}" title="CVV code should be 3 or 4 digits long">
                            </div>
                        </div>
                    </div>
                    <div class="order-summary">
                        <h2>Order Summary:</h2>
                        <table>
                            <tbody>
                                <tr>
                                    <td>Order Amount:</td>
                                    <td>$<span><%= session.getAttribute("price")%></span></td>
                                </tr>
                                <tr>
                                    <td>Tax:</td>
                                    <td>$<span id="orderTax"></span></td>
                                </tr>
                                <tr>
                                    <td>Shipping:</td>
                                    <td>$<span id="orderShipping"></span></td>
                                </tr>
                                <tr id="additionalShipping">
                                    <td><span id="additionalShippingText"></span></td>
                                    <td>$<span id="additionalShippingValue"></span></td>
                                </tr>
                                <tr class="totals">
                                    <td>Order Total:</td>
                                    <td>$<span id="orderTotalDisplay"></span></td>
                                </tr>
                            </tbody>
                        </table>

                        <div class="confirm">
                            <button>CONFIRM ORDER</button>
                        </div>
                    </div>
                    <br class="clear" />
                </form>
            </main>
        </div>
        <footer>
            <p class="text-section">Copyright 2020, Group 1</p>
        </footer>
    </div>
</body>

</html>