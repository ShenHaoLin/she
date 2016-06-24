//
//  MoreViewController.m
//  WXMovie
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年  All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    NSString *userName;
    UIImage *userIcon;
}
@property (weak, nonatomic) IBOutlet UILabel *sizeLabel;

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getDataFromSandBox];
    self.navigationItem.title = @"更多";
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    self.tableView.separatorColor = kTableViewSeColor;
 
    NSLog(@"%@", NSHomeDirectory());
 
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
    headerView.backgroundColor = [UIColor clearColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:userIcon forState:UIControlStateNormal];
    [button setTitle:@"编辑" forState:UIControlStateHighlighted];
    
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(25, 25, 100, 100);
    button.layer.cornerRadius = 50;
    button.layer.masksToBounds = YES;
    button.tag = 2016;
    
    [headerView addSubview:button];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 25, 200, 40)];
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.textColor = [UIColor yellowColor];
    nameLabel.text = userName;
    nameLabel.tag = 2017;
    
    [headerView addSubview:nameLabel];
 
    self.tableView.tableHeaderView = headerView;
    

    
}

- (void)buttonAction:(UIButton *)sender
{

    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    //弹出相册
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = sourceType;
    imagePicker.delegate = self;
    
    [self presentViewController:imagePicker animated:YES completion:NULL];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self readCatchSize];
    //    [self getDataFromSandBox];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    //    [self saveDataToSandBox];
}

- (void)readCatchSize
{
    //    NSInteger fileSize = [[SDImageCache sharedImageCache] getSize];
    NSInteger fileSize = [self getCatchSize];
    NSLog(@"%ld", fileSize);
    
    self.sizeLabel.text = [NSString stringWithFormat:@"%.2f MB", fileSize / 1024.0 / 1024.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 && indexPath.section == 0) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"清除缓存" message:[NSString stringWithFormat:@"确定清除缓存%@", self.sizeLabel.text] preferredStyle:UIAlertControllerStyleAlert];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            self.sizeLabel.text = @"0.0 MB";
    
            [self clearCatch];
        }]];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:NULL]];
        
        [self presentViewController:alert animated:YES completion:NULL];
    }
}

- (NSInteger)getCatchSize
{
    NSInteger fileSize = 0;
    
   
    NSString *catchPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];
   
    NSDirectoryEnumerator *fileEnumerator = [[NSFileManager defaultManager] enumeratorAtPath:catchPath];
    //所有的文件的名称
    for (NSString *fileName in fileEnumerator) {
        //所有文件的路径
        NSString *filePath = [catchPath stringByAppendingPathComponent:fileName];
        //所有文件的大小
        NSDictionary *attDic = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
        //   计算大小
        fileSize += [attDic fileSize];
    }
    
    return fileSize;
}

- (void)clearCatch
{
    //拿到缓存文件夹
    NSString *catchPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];
    //清除
    [[NSFileManager defaultManager] removeItemAtPath:catchPath error:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [picker dismissViewControllerAnimated:YES completion:NULL];

    UIImage *image = info[UIImagePickerControllerOriginalImage];
    userIcon = image;
    UIButton *button = [self.tableView.tableHeaderView viewWithTag:2016];
    
    [button setImage:userIcon forState:UIControlStateNormal];
    
    UILabel *label = [self.tableView.tableHeaderView viewWithTag:2017];
    userName = @"就是撒皇帝";
    label.text = userName;
    
    [self saveDataToSandBox];
}

//保存数据到沙盒当中
- (void)saveDataToSandBox
{
    if (userIcon != nil) {
       
        [[NSUserDefaults standardUserDefaults] setObject:userName forKey:@"userName"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        NSData *data = UIImageJPEGRepresentation(userIcon, 0.8);
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"userIcon"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
}

//从沙盒当中获取数据
- (void)getDataFromSandBox
{
    userName = [[NSUserDefaults standardUserDefaults] objectForKey:@"userName"];
    userIcon = [UIImage imageWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"userIcon"]];
    [[NSUserDefaults standardUserDefaults] synchronize];
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
