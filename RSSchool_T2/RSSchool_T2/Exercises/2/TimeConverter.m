#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    
    NSMutableString* result = [NSMutableString stringWithString:@""];
    
    if ([minutes integerValue] > 59 || [hours integerValue] > 12) {
        
        return result;
    }
    
    NSDictionary* hoursAsStr = @{@"1" : @"one",   @"2" : @"two",  @"3" : @"three",   @"4" : @"four",
                                 @"5" : @"five",  @"6" : @"six",  @"7" : @"seven",   @"8" : @"eight",
                                 @"9" : @"nine", @"10" : @"ten", @"11" : @"eleven", @"12" : @"twelve"};
    
    NSArray* minutesAsStr = @[@"zero", @"one", @"two", @"three", @"four", @"five", @"six",
                              @"seven", @"eight", @"nine", @"ten", @"eleven", @"twelve",
                              @"thirteen", @"fourteen", @"fifteen", @"sixteen", @"seventeen",
                              @"eighteen", @"nineteen", @"twenty", @"twenty one", @"twenty two",
                              @"twenty three", @"twenty four", @"twenty five", @"twenty six",
                              @"twenty seven", @"twenty eight", @"twenty nine"];
    
    NSInteger nextHour = ([hours integerValue] % 12) + 1;
    
    NSString* nextHourAsStr = [NSString stringWithFormat:@"%ld", nextHour];
    
    switch ([minutes integerValue]) {
            
        case 0: result = [NSMutableString stringWithFormat:@"%@ o' clock", hoursAsStr[hours]];
            
            return result;
            
        case 1: result = [NSMutableString stringWithFormat:@"one minute past %@", hoursAsStr[hours]];
            
            return result;
            
        case 15: result = [NSMutableString stringWithFormat:@"quarter past %@", hoursAsStr[hours]];
            
            return  result;
            
        case 30: result = [NSMutableString stringWithFormat:@"half past %@", hoursAsStr[hours]];
            
            return result;
            
        case 45: result = [NSMutableString stringWithFormat:@"quarter to %@", hoursAsStr[nextHourAsStr]];
            
            return result;
            
        case 59: result = [NSMutableString stringWithFormat:@"one minute to %@", hoursAsStr[nextHourAsStr]];
            
            return result;
            
        default:
            
            break;
    }
    
    
    if ([minutes integerValue] < 30) {
        
        result = [NSMutableString stringWithFormat:@"%@ minutes past %@", minutesAsStr[[minutes integerValue]], hoursAsStr[hours]];
        
        return result;
    } else if ([minutes integerValue] > 30) {
        
        NSString* minutesOverThirty = minutesAsStr[60 - [minutes integerValue]];
        
        result = [NSMutableString stringWithFormat:@"%@ minutes to %@", minutesOverThirty, hoursAsStr[nextHourAsStr]];
        
        return result;
    } else {
        
        result = [NSMutableString stringWithString:@""];
        
        return result;
    }
}

@end
