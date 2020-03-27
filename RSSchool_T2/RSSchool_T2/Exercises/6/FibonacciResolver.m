#import "FibonacciResolver.h"

@implementation FibonacciResolver

- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    
    NSInteger counter = 2;
    
    NSArray* fiboArray = [self makeFibonacci:counter];
    
    NSInteger lastObj = 0;
    
    NSInteger preLastObj = 0;
    
    NSInteger multiplyLastAndPrelastObj = lastObj * preLastObj;
    
    NSInteger marker = 0;
    
    while ([number integerValue] != multiplyLastAndPrelastObj) {
        
        fiboArray = [self makeFibonacci:counter];
        
        lastObj = [fiboArray[fiboArray.count - 1] integerValue];
        
        preLastObj = [fiboArray[fiboArray.count - 2] integerValue];
        
        multiplyLastAndPrelastObj = lastObj * preLastObj;
        
        counter += 1;
        
        marker = 1;
        
        if (multiplyLastAndPrelastObj > [number integerValue]) {
            
            marker = 0;
            
            break;
        }
    }
    
    NSArray* result = [NSArray arrayWithObjects:[NSNumber numberWithInteger:preLastObj],
                       [NSNumber numberWithInteger:lastObj],[NSNumber numberWithInteger:marker],
                       nil];
    
    return result;
}

- (NSArray*)makeFibonacci:(NSInteger)n {
    
    NSMutableArray* fibonacci = [NSMutableArray arrayWithObjects:@0, @1, nil];
    
    if(n > 1) {
        
        while (fibonacci.count < n) {
            
            NSInteger lastFibObj = [fibonacci[fibonacci.count - 1] integerValue];
            
            NSInteger preLastFibObj = [fibonacci[fibonacci.count - 2] integerValue];
            
            NSInteger fibSumObj = lastFibObj + preLastFibObj;
            
            [fibonacci addObject:[NSNumber numberWithInteger:fibSumObj]];
        }
    }
    
    return fibonacci;
}

@end
