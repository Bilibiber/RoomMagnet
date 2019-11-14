//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using Stripe;

//public partial class WebPages_Stripe : System.Web.UI.Page
//{
//    protected void Page_Load(object sender, EventArgs e)
//    {
//        StripeConfiguration.ApiKey = "sk_test_QDiWIeLdMdArmguW1ClQ6F3i00i5LLvt3I";

//    }
//    public void ChargeService(string Amount)
//    {
//        var options = new ChargeCreateOptions
//        {
//            Amount = Int32.Parse(Amount),
//            Currency = "usd",
//            Source = "tok_visa",
//            ReceiptEmail = "jenny.rosen@example.com",
//        };
//        var service = new ChargeService();
//        Charge charge = service.Create(options);
//    }
//    public void PaymentInt(string Price)
//    {
//        var paymentIntentService = new PaymentIntentService();
//        var createOptions = new PaymentIntentCreateOptions
//        {
//            Amount = Int32.Parse(Price),
//            Currency = "usd",
//            PaymentMethodTypes = new List<string> { "card" },
//            ReceiptEmail = "jenny.rosen@example.com",
//        };
//        paymentIntentService.Create(createOptions);
//    }
//}