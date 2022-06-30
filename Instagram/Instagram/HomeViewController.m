//
//  HomeViewController.m
//  Instagram
//
//  Created by Lily Yang on 6/27/22.
//

#import "HomeViewController.h"
#import <Parse/Parse.h>
#import "PostCell.h"
#import "DetailsViewController.h"

@interface HomeViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *posts;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(beginRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:refreshControl atIndex:0];
    
    self.tableView.dataSource = self;
    
    [self loadData];
    // Do any additional setup after loading the view.
}

- (void)beginRefresh:(UIRefreshControl *)refreshControl {
    [self loadData];
    [refreshControl endRefreshing];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"detailsSegue"]){
        NSLog(@"Going into details view 🧐");
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Post *postToPass = self.posts[indexPath.row];
        
        DetailsViewController *detailsController = [segue destinationViewController];
        detailsController.post = postToPass;
    }
}


- (void) loadData{ // gets 20 posts into array
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    [query orderByDescending:@"createdAt"];
    [query includeKey:@"author"]; 
    query.limit = 20;
    self.posts = [NSArray array];
    
    // fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *rawPosts, NSError *error) {
        if (rawPosts != nil) {
            self.posts = rawPosts; 
            [self.tableView reloadData];
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

- (IBAction)didTapCompose:(id)sender {
    [self performSegueWithIdentifier:@"composeSegue" sender:nil];
}

- (IBAction)didTapLogout:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        // PFUser.current() will now be nil
        if(error){
            NSLog(@"☹️☹️☹️ Couldn't log out: %@", error.localizedDescription);
        }
        else{
            NSLog(@"😇😇😇 Logout success!");
        }
    }];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    PostCell *cell = [tableView dequeueReusableCellWithIdentifier:@"postCell" forIndexPath:indexPath];
    
    cell.post = self.posts[indexPath.row];
    [cell loadCellData];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}

@end
