//
//  ViewController.m
//  DeviceOrientationDemo
//  http://www.superqq.com/blog/2015/12/07/ios9-interface-orientation/
//  http://www.jianshu.com/p/650ba0ff626b#
//  Created by mobao on 16/12/12.
//  Copyright © 2016年 mobao. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
#import "ViewController3.h"

/**
 此Demo适合带原生UINavigationController的项目，且个别页面需要横屏显示的项目。
 如果是全部页面支持横屏的话，就只需要步骤1即可。
 
 步骤：
    1.在General -> Deployment info -> Device Orientation勾选Portrait、Landscape Left、Landscape Right以使得整个项目允许横屏显示。
 
    2.在NavViewController中设置，使得每个项目可以单独设置横竖屏（步骤3、4才得以进行）
    ```
    -(BOOL)shouldAutorotate{
        return [self.topViewController shouldAutorotate];
    }
 
    -(UIInterfaceOrientationMask)supportedInterfaceOrientations{
        return [self.topViewController supportedInterfaceOrientations];
    }
    ```
 
    3.所有页面继承自BaseViewController，添加如下方法，使得所有页面都为竖屏
    ```
    -(BOOL)shouldAutorotate{
        return YES;
    }
 
    -(UIInterfaceOrientationMask)supportedInterfaceOrientations{
        return UIInterfaceOrientationMaskPortrait;
    }
    ```
 
    4.在需要横屏的页面添加如下代码，单独使其横屏：
    ```
    -(BOOL)shouldAutorotate{
        return YES;
    }
 
    -(UIInterfaceOrientationMask)supportedInterfaceOrientations{
        return UIInterfaceOrientationMaskAllButUpsideDown;
    }
    ```
 
 
 */
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSArray *arr;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    arr = @[@"页面2旋转",@"页面3不旋转"];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arr.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [arr objectAtIndex:indexPath.row];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    id vc;
    if (indexPath.row == 0) {
        vc = [sb instantiateViewControllerWithIdentifier:@"ViewController2"];
    }else if (indexPath.row == 1){
        vc = [sb instantiateViewControllerWithIdentifier:@"ViewController3"];
    }

    [self.navigationController pushViewController:vc animated:YES];
//    [self presentViewController:vc animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
