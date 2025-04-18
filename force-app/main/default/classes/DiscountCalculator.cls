public with sharing class DiscountCalculator {
    public static Decimal calculateDiscount(Decimal amount, String discountCode) {
        if (amount == null) {
            return 0;
        }
 
        Decimal discountAmount = 0;

 		if (amount < 100) {
            return amount;
        } else if (amount >= 100 && amount <= 200) {
            discountAmount = 10;
        } else if (amount > 200 && amount <500) {
            discountAmount = 15;
        } else if (amount >= 500) {
            discountAmount = 20;
        }
        
        Decimal discountedAmount = (amount * (100 - discountAmount)) / 100;
        
        if (discountCode == 'OSF5') {
            discountedAmount = (discountedAmount * 95) /100;
        }

        return discountedAmount;
    }
}