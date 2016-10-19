//
//  ViewController.m
//  CJTPop
//
//  Created by chenjintian on 16/10/17.
//  Copyright © 2016年 CJT. All rights reserved.
//

#import "ViewController.h"
#import "PopPickerView.h"
#import "PopDatePickerView.h"
#import "PopAddressView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)PopNormal {
    PopPickerView   *pop    =   [PopPickerView new];
    pop.title   =   @"普通Pop";
    pop.textArr =   @[@"一",@"二",@"三"];
    [pop loadUI];
    [self.view addSubview:pop];
    
    pop.clickTextBolck  =   ^(NSString *string,NSInteger index) {
        NSLog(@"%@",string);
    };
}
- (IBAction)PopDate:(id)sender {
    PopDatePickerView   *pop    =   [PopDatePickerView new];
    pop.title   =   @"日期Pop";
    [pop loadUI];
    [self.view addSubview:pop];
    
    pop.clickDateBolck  =   ^(NSString *string) {
        NSLog(@"%@",string);
    };
}

- (IBAction)PopAddress {
    PopAddressView   *pop   =   [PopAddressView new];
    pop.title   =   @"地址Pop";
    [pop loadUI];
    [self.view addSubview:pop];
    
    pop.clickAddressBolck   =   ^(NSString *string) {
        NSLog(@"%@",string);
    };
}

@end
