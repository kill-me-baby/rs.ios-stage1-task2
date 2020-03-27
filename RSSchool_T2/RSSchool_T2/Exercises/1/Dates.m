#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    
    NSDictionary* monthDict = @{@"1" : @"января",    @"2" : @"февраля",   @"3" : @"марта",
                                @"4" : @"апреля",    @"5" : @"мая",       @"6" : @"июня",
                                @"7" : @"июля",      @"8" : @"августа",   @"9" : @"сентября",
                                @"10" : @"октября",  @"11" : @"ноября",   @"12" : @"декабря"};
    
    NSDictionary* dayDict = @{@"1" : @"воскресенье", @"2" : @"понедельник",
                              @"3" : @"вторник",     @"4" : @"среда",
                              @"5" : @"четверг",     @"6" : @"пятница",
                              @"7" : @"суббота"};
    
    NSDateFormatter* dateFormatterGet = [[NSDateFormatter alloc] init];
    
    dateFormatterGet.dateFormat = @"yyyy-MM-dd";
    
    NSDate* myDate = [[NSDate alloc] init];
    
    NSString* monthToPrint = @"";
    
    NSString* dayNameToPrint = @"";
    
    NSString* dateStr = [NSString stringWithFormat:@"%@-%@-%@", year, month, day];
    
    NSDate* dateFormatGetString = [dateFormatterGet dateFromString:dateStr];
    
    if (dateFormatGetString != nil) {
        
        myDate = dateFormatGetString;
    } else {
        
        return @"Такого дня не существует";
    }
    
    NSCalendar* currentCalendar = [NSCalendar currentCalendar];
    
    NSString* myDay = [NSString stringWithFormat:@"%ld", [currentCalendar component:NSCalendarUnitWeekday fromDate:dateFormatGetString]];
    
    if (monthDict[month] != nil && dayDict[myDay] != nil) {
        
        monthToPrint = monthDict[month];
        
        dayNameToPrint = dayDict[myDay];
    }
    
    NSString* result = [NSString stringWithFormat:@"%@ %@, %@", day, monthToPrint, dayNameToPrint];
    
    return result;
}

@end
