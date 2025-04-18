public with sharing class DiscountCalculator {
    public static Decimal calculateDiscount(Decimal amount) {
        if (amount == null) {
            return 0;
        } else if (amount >= 100) {
            return (amount * 90) / 100;
        } else {
            return amount;
        }
    }
}
