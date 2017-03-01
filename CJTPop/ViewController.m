//
//  ViewController.m
//  CJTPop
//
//  Created by chenjintian on 16/10/17.
//  Copyright © 2016年 CJT. All rights reserved.
//

#import "ViewController.h"
#import "CJTPopNormalPickerView.h"
#import "CJTPopDatePickerView.h"
#import "CJTPopAddressView.h"

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
    CJTPopNormalPickerView   *pop    =   [[CJTPopNormalPickerView alloc] initWithTitle:@"普通Pop" textArr:@[@"一",@"二",@"三"]];
    [self.view addSubview:pop];
    
    pop.clickTextBolck  =   ^(NSString *string,NSInteger index) {
        NSLog(@"%@",string);
    };
}
- (IBAction)PopDate:(id)sender {
    CJTPopDatePickerView   *pop    =   [[CJTPopDatePickerView alloc] initWithTitle:@"日期Pop"];
    [self.view addSubview:pop];
    
    pop.clickTextBolck  =   ^(NSString *string,NSInteger index) {
        NSLog(@"%@",string);
    };
}

- (IBAction)PopAddress {
    CJTPopAddressView   *pop    =   [[CJTPopAddressView alloc] initWithTitle:@"地址Pop"];
    [self.view addSubview:pop];
    
    pop.clickTextBolck   =   ^(NSString *string,NSInteger index) {
        NSLog(@"%@",string);
    };
}

@end
