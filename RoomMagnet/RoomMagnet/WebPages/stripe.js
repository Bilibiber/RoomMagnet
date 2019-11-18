// Set your secret key: remember to change this to your live secret key in production
// See your keys here: https://dashboard.stripe.com/account/apikeys
StripeConfiguration.ApiKey = "sk_test_aU6lF0ehycFdRe1ZVoiX0oOm000CyJPHp6";

var options = new SessionCreateOptions {
    PaymentMethodTypes = new List < string > {
        "card",
    },
    LineItems = new List < SessionLineItemOptions > {
        new SessionLineItemOptions {
            Name = "T-shirt",
            Description = "Comfortable cotton t-shirt",
            Amount = 500,
            Currency = "usd",
            Quantity = 1,
        },
    },
SuccessUrl = "https://example.com/success?session_id={CHECKOUT_SESSION_ID}",
    CancelUrl = "https://example.com/cancel",
};

var service = new SessionService();
Session session = service.Create(options);