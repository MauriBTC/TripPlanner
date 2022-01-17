//
//  Stage.h
//  TripPlanner
//
//  Created by user928728 on 7/2/21.
//

#import <Foundation/Foundation.h>
#import "Poi.h"

NS_ASSUME_NONNULL_BEGIN

@interface Stage : NSObject

//inizializzatori
- (instancetype) initWithFrom: (NSString *) from
                           to: (NSString *) to
                         date: (NSDate *) date
                        place: (NSString *) place
                      arrival: (NSDate *) arrival
                    departure: (NSDate *) departure;

- (instancetype) initWithFrom: (NSString *) from
                           to: (NSString *) to
                         date: (NSDate *) date
                        means: (NSString *) means
                        place: (NSString *) place
                      arrival: (NSDate *) arrival
                    departure: (NSDate *) departure;

- (instancetype) initWithFrom: (NSString *) from
                           to: (NSString *) to
                         date: (NSDate *) date
                        place: (NSString *) place
                      arrival: (NSDate *) arrival
                    departure: (NSDate *) departure
                        hotel: (NSString *) hotel;

- (instancetype) initWithFrom: (NSString *) from
                           to: (NSString *) to
                         date: (NSDate *) date
                        means: (NSString *) means
                        place: (NSString *) place
                      arrival: (NSDate *) arrival
                    departure: (NSDate *) departure
                        hotel: (NSString *) hotel;


//spostamento
@property (nonatomic, strong) NSString *from;
@property (nonatomic, strong) NSString *to;
@property (nonatomic, strong) NSDate *date;
//opzionale
@property (nonatomic, strong) NSString *means;

//permanenza
@property (nonatomic, strong) NSString *place;
@property (nonatomic, strong) NSDate *arrival;
@property (nonatomic, strong) NSDate *departure;
//opzionale
@property (nonatomic, strong) NSString *hotel;

@property (nonatomic, strong) Poi *location;

- (NSString *)displayName;

@end

NS_ASSUME_NONNULL_END
