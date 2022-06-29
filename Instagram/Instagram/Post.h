//
//  Post.h
//  Instagram
//
//  Created by Lily Yang on 6/28/22.
//

#import <Foundation/Foundation.h>
#import "Parse/Parse.h"

@interface Post : PFObject<PFSubclassing>

@property (nonatomic, strong) NSString * _Nullable postID;
@property (nonatomic, strong) NSString * _Nullable userID;
@property (nonatomic, strong) PFUser * _Nullable author;

@property (nonatomic, strong) NSString * _Nullable caption;
@property (nonatomic, strong) PFFileObject * _Nullable image;
@property (nonatomic, strong) NSNumber * _Nullable likeCount;
@property (nonatomic, strong) NSNumber * _Nullable commentCount;

+ (void) postUserImage: ( UIImage * _Nullable )image withCaption: ( NSString * _Nullable )caption withCompletion: (PFBooleanResultBlock  _Nullable)completion; // + means static method

@end
