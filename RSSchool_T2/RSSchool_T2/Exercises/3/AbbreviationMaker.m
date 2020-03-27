#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    
    if(a.length < b.length) {
        
        return @"NO";
    }
    
    NSString* myUpperA = [a uppercaseString];
    
    NSMutableArray* aArray = [[NSMutableArray alloc] init];
    
    NSMutableArray* bArray = [[NSMutableArray alloc] init];
    
    __block NSMutableString* comparedLetters = [[NSMutableString alloc] init];
    
    
    //MARK:- Convert myUpperA and b from string to array
    
    for (NSInteger index = 0; index < myUpperA.length; index++) {
        
        unichar myCharacter = [myUpperA characterAtIndex:index];
        
        NSString* myCharAsString= [NSString stringWithFormat:@"%c", myCharacter];
        
        [aArray addObject:myCharAsString];
    }
    
    for (NSInteger index = 0; index < b.length; index++) {
        
        unichar myCharacter = [b characterAtIndex:index];
        
        NSString* myCharAsString= [NSString stringWithFormat:@"%c", myCharacter];
        
        [bArray addObject:myCharAsString];
    }
    
    //MARK:- Compare letters
    
    void(^makeUpArray)(void);
    
    makeUpArray = ^{
        
        NSMutableString* firstObjA = [aArray firstObject];
        
        NSMutableString* firstObjB = [bArray firstObject];
        
        if (firstObjA == firstObjB) {
            
            [aArray removeObjectAtIndex:0];
            
            [bArray removeObjectAtIndex:0];
            
            NSMutableString* str = [NSMutableString stringWithFormat:@"%@", firstObjA];
            
            [comparedLetters appendString: str];
            
            NSLog(@"comparedLetters = %@", comparedLetters);
        } else {
            
            [aArray removeObjectAtIndex:0];
        }
    };
    
    //MARK:-
    
    while (bArray.count != 0 && aArray.count > 0) {
        
        makeUpArray();
    }
    
    if ([comparedLetters isEqualToString:b]) {
        
        return @"YES";
    } else {
        
        NSLog(@"b = %@, comparedLetters = %@", b, comparedLetters);
        
        return @"NO";
    }
}

@end
