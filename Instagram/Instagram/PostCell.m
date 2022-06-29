//
//  PostCell.m
//  Instagram
//
//  Created by Lily Yang on 6/28/22.
//

#import "PostCell.h"
#import <UIKit/UIKit.h>
@import Parse; 

@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//@property (weak, nonatomic) IBOutlet UIImageView *imageView;
//@property (weak, nonatomic) IBOutlet UIButton *likeButton;
//@property (weak, nonatomic) IBOutlet UILabel *likeCountLabel;
//@property (weak, nonatomic) IBOutlet UIButton *commentButton;
//@property (weak, nonatomic) IBOutlet UILabel *commentCountLabel;
//@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
//@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
//
//@property (strong, nonatomic) Post *post;

- (void) loadCellData{    
    self.likeCountLabel.text = [self.post.likeCount stringValue];
    self.commentCountLabel.text = [self.post.commentCount stringValue];
    self.captionLabel.text = self.post.caption;
    
    PFUser *user = self.post[@"author"];
    self.usernameLabel.text = user[@"username"];
    
    self.imageView.file = self.post.image;
    [self.imageView loadInBackground];
}

@end
