//
//  HomeViewController.m
//  WXMovie
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年  All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCell.h"
#import "PostView.h"

@interface HomeViewController ()
{
//    BOOL animationFlag;
    __weak IBOutlet PostView *_posterView;
    
    __weak IBOutlet UITableView *_listView;
    
    NSMutableArray *_modelArr;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //加载model数据
    [self _parseJsonData];
    self.title = @"电影";
//    NSURLRequest *request = [NSURLRequest requestWithURL:<#(nonnull NSURL *)#>];
    _posterView.hidden = YES;
    _listView.backgroundColor = self.view.backgroundColor;
//    _listView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    _listView.separatorColor = kTableViewSeColor;
    
    [self _createCustomView];
    
    //传递给cell去显示
}

- (void)_parseJsonData
{
    _modelArr = [NSMutableArray array];
    
//    解压json数据
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"us_box" ofType:@"json"];
    
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath];
 
    
    id result = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    
    NSArray *subjects = result[@"subjects"];
    for (NSDictionary *dic in subjects) {
        NSDictionary *subject = dic[@"subject"];
        
        //配置model
        HomeModel *model = [[HomeModel alloc] init];
        model.rating = subject[@"rating"];
        model.title = subject[@"title"];
        model.original_title = subject[@"original_title"];
        model.images = subject[@"images"];
        model.year = subject[@"year"];
        
        [_modelArr addObject:model];
    }
    _posterView.dataArray = _modelArr;
}

- (void)_createCustomView
{
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    customView.backgroundColor = [UIColor clearColor];
    
    UIButton *postButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [postButton setImage:[UIImage imageNamed:@"poster_home@2x"] forState:UIControlStateNormal];
    [postButton setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home@2x"] forState:UIControlStateNormal];
    postButton.frame = customView.frame;
    [postButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [customView addSubview:postButton];
    
    UIButton *listButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [listButton setImage:[UIImage imageNamed:@"list_home@2x"] forState:UIControlStateNormal];
    [listButton setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home@2x"] forState:UIControlStateNormal];
    listButton.frame = customView.frame;
    [listButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [customView addSubview:listButton];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:customView];
    
}

- (void)buttonAction:(UIButton *)button
{
    
    UIView *customView = self.navigationItem.rightBarButtonItem.customView;
    
    [customView sendSubviewToBack:button];

    UIViewAnimationTransition transition = _posterView.hidden ? UIViewAnimationTransitionFlipFromLeft : UIViewAnimationTransitionFlipFromRight;
    _listView.hidden = _posterView.hidden;
    _posterView.hidden = !_listView.hidden;
    
    [UIView animateWithDuration:.25 animations:^{
        //执行转场动画
        [UIView setAnimationTransition:transition forView:customView cache:YES];

    }];

    [UIView animateWithDuration:.25 animations:^{
       [UIView setAnimationTransition:transition forView:self.view cache:YES];
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _modelArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"inentifier"];
    if (cell == nil) {

        cell = [[[NSBundle mainBundle] loadNibNamed:@"HomeCell" owner:self options:nil] firstObject];
    }

    cell.model = _modelArr[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kScreenWidth / 3;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
