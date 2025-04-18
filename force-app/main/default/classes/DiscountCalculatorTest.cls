@isTest
public class DiscountCalculatorTest {
    
    @isTest
    static void testDiscountApplied10 () { //%10
        Decimal discountAppliedResult = DiscountCalculator.calculateDiscount(150 , 'OSF');
        System.assertEquals(135, discountAppliedResult, 'No additional %5');
    }
    
    @isTest
    static void testDiscountApplied10WithExtra5 () { //%10
        Decimal discountAppliedResult = DiscountCalculator.calculateDiscount(150 , 'OSF5');
        System.assertEquals(128.25, discountAppliedResult, 'additional %5');
    }
    
    @isTest
    static void testDiscountApplied15 () { //%15
        Decimal discountAppliedResult = DiscountCalculator.calculateDiscount(400 , 'OSF');
        System.assertEquals(340, discountAppliedResult, 'No additional %5');
    }
    
    @isTest
    static void testDiscountApplied15WithExtra5 () { //%15
        Decimal discountAppliedResult = DiscountCalculator.calculateDiscount(400 , 'OSF5');
        System.assertEquals(323, discountAppliedResult, 'additional %5');
    }
    
        @isTest
    static void testDiscountApplied20 () { //%20
        Decimal discountAppliedResult = DiscountCalculator.calculateDiscount(600 , 'OSF');
        System.assertEquals(480, discountAppliedResult, 'No additional %5');
    }
    
    @isTest
    static void testDiscountApplied20WithExtra5 () { //%20
        Decimal discountAppliedResult = DiscountCalculator.calculateDiscount(600 , 'OSF5');
        System.assertEquals(456, discountAppliedResult, 'No additional %5');
    }

    @isTest
    static void testDiscountDenied () {
        Decimal discountDeniedResult = DiscountCalculator.calculateDiscount(30, 'OSF');
        System.assertEquals(30, discountDeniedResult, '30 is less than 100 so no discount');
    }
    

    @isTest
    static void testAmountNull () {
        Decimal discountAmountNullResult = DiscountCalculator.calculateDiscount(null, null);
        System.assertEquals(0, discountAmountNullResult, 'Providing null returns 0');
    }
}