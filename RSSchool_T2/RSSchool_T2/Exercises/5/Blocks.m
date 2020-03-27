#import "Blocks.h"

@interface Blocks ()

@property (strong, nonatomic) __block NSArray* myArray;

@end

@implementation Blocks

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        self.blockA = ^(NSArray* myArr) {
            
            self.myArray = myArr;
        };
        
        self.blockB = ^(Class myClass) {
            
            NSMutableArray* buildMyClassArr = [NSMutableArray new];
            
            for (NSObject* myObj in self.myArray) {
                
                if ([myObj isKindOfClass:myClass]) {
                    
                    [buildMyClassArr addObject:myObj];
                }
            }
            
            if (myClass == [NSString class]) {
                
                NSString* result = [buildMyClassArr componentsJoinedByString:@""];
                
                self.blockC(result);
            } else if (myClass == [NSNumber class]) {
                
                NSInteger sum = 0;
                
                for (NSNumber* myNum in buildMyClassArr) {
                    
                    sum += [myNum integerValue];
                }
                
                NSNumber* result = [NSNumber numberWithInteger:sum];
                
                self.blockC(result);
            } else if (myClass == [NSDate class]) {
                
                NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
                
                formatter.dateFormat = @"dd.MM.yyyy";
                
                NSDate* myLateDate = [buildMyClassArr objectAtIndex:0];
                
                for (NSDate* currentDate in buildMyClassArr) {
                    
                    myLateDate = [currentDate laterDate:myLateDate];
                }
                
                NSString* result = [formatter stringFromDate:myLateDate];
                
                self.blockC(result);
            }
        };
    }
    
    return self;
}

@end

