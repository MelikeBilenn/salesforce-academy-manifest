@isTest
public class DiscountCalculatorTest {
    @isTest
    static void testDiscountApplied () {
        Decimal discountAppliedResult = DiscountCalculator.calculateDiscount(400);
        System.assertEquals(360, discountAppliedResult, '40 is the %10 for 400');
    }

    @isTest
    static void testDiscountDenied () {
        Decimal discountDeniedResult = DiscountCalculator.calculateDiscount(30);
        System.assertEquals(30, discountDeniedResult, '30 is less than 100 so no discount');
    }

    @isTest
    static void testAmountNull () {
        Decimal discountAmountNullResult = DiscountCalculator.calculateDiscount(null);
        System.assertEquals(0, discountAmountNullResult, 'Providing null returns 0');
    }
}
