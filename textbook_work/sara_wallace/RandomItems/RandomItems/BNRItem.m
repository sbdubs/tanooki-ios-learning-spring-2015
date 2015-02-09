//
//  BNRItem.m
//  RandomItems
//
//  Created by Sara Wallace on 2/2/15.
//  Copyright (c) 2015 Sara Wallace. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

+ (instancetype)randomItem
{
    //Create an immutable array of three adjectives
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    
    //Create an immutable array of three nouns
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    
    //Get the index of a random ajective/noun from the lists
    //Note: the % operator, called the modulo operator, gives
    //you the remainder. So adjectiveIndex is a random number
    //from 0 to 2 inclusive
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];
    
    //Note that NSInteger is not an object, but a type definition
    //for "long"
    NSString *randomName = [NSString stringWithFormat:@"%@ %@", randomAdjectiveList[adjectiveIndex],randomNounList[nounIndex]];
    
    int randomValue = arc4random() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10];
    
    BNRItem *newItem = [[self alloc] initWithItemName:randomName
                                       valueInDollars:randomValue
                                         serialNumber:randomSerialNumber];
    return newItem;
}


- (instancetype)initWithItemName:(NSString *)name
                 valueInDollars:(int)value
                   serialNumber:(NSString *)sNumber
{
    //Call the superclass's designed initializer
    self=[super init];
        //Did the super class's designed initalizer succeed?
        if(self){
            //Give the instance variables inital values
            _itemName = name;
            _serialNumber = sNumber;
            _valueInDollars = value;
            //Set _dateCreated to the current date and time
            _dateCreated = [[NSDate alloc] init];
        }
        
    //Return the address of the newly initalized object
        return self;
}

- (instancetype)initWithItemName:(NSString *)name
{
    return [self initWithItemName:name
                   valueInDollars:0
                    serialNumber:@""];
    
}

- (instancetype)init
{
    return [self initWithItemName:@"Item"];
}

- (void)setContainedItem:(BNRItem *)containedItem
{
    _containedItem = containedItem;
    //When given an item to contain, the contained
    //item will be given a poiinter to its container
    self.containedItem.container = self;
}

//-(BNRItem *)containedItem
//{
//    return _containedItem;
//}

//- (void)setContainer:(BNRItem *)item
//{
//    _container = item;
//}

//- (BNRItem *)container
//{
//    return _container;
//}

//- (void)setItemName:(NSString *)str
//{
//    _itemName = str;
//}

//- (NSString *)itemName
//{
//    return _itemName;
//}

//- (void)setSerialNumber:(NSString *)str
//{
//    _serialNumber = str;
//}

//- (NSString *)serialNumber
//{
//    return _serialNumber;
//}

//- (void)setValueInDollars:(int)v
//{
//    _valueInDollars = v;
//}

- (void)dealloc
{
    NSLog(@"Destroyed: %@", self);
}

//- (int)valueInDollars
//{
//    return _valueInDollars;
//}

//- (NSDate *)dateCreated
//{
//    return _dateCreated;
//}

- (NSString *)description
{
    NSString *descriptionString =
    [[NSString alloc] initWithFormat: @"%@ (%@): Worth $%d, recorded on %@",
     self.itemName,
     self.serialNumber,
     self.valueInDollars,
     self.dateCreated];
    
    return descriptionString;
    
}

@end
