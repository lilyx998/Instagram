//
//  Likes.h
//  Instagram
//
//  Created by Lily Yang on 6/30/22.
//

#import <Parse/Parse.h>

NS_ASSUME_NONNULL_BEGIN

@interface Likes : PFObject

@property (nonatomic) NSArray<NSString *> *users; // hmmmm

@end

NS_ASSUME_NONNULL_END
