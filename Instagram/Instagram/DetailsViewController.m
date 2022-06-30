//
//  DetailsViewController.m
//  Instagram
//
//  Created by Lily Yang on 6/29/22.
//

#import "DetailsViewController.h"
@import Parse;
#import <Parse/Parse.h>

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet PFImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *likeCount;
@property (weak, nonatomic) IBOutlet UILabel *commentCount;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *caption;
@property (weak, nonatomic) IBOutlet UILabel *timestamp;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.likeCount.text = [self.post.likeCount stringValue];
    self.commentCount.text = [self.post.commentCount stringValue];
    self.caption.text = self.post.caption;
    
    PFUser *user = self.post[@"author"];
    self.username.text = user[@"username"];
    
    self.imageView.file = self.post.image;
    [self.imageView loadInBackground];
    
    NSDate *date = self.post.createdAt;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    formatter.dateStyle = NSDateFormatterMediumStyle;
    formatter.timeStyle = NSDateFormatterShortStyle;
    
    self.timestamp.text = [formatter stringFromDate:date];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
