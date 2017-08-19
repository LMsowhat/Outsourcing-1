//
//  EliveApplication+requestMethod.m
//  Eliveapp
//
//  Created by 李文华 on 2017/4/20.
//  Copyright © 2017年 李文华. All rights reserved.
//

#import "EliveApplication+requestMethod.h"
#import "EliveHttpApi.h"

#import "HomeViewController.h"
#import "ProductionDetailViewController.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "OrderCreateController.h"
#import "AddressViewController.h"

@implementation EliveApplication (requestMethod)

- (void)requestRegisterAction:(NSDictionary*)parm{
    
    EliveHttpApi *api = [EliveHttpApi new];
    
    UIViewController *controller = [parm objectForKey:kCurrentController];
    
    [api requestRegistersGetDataWithParameters:parm result:^(id responseObject) {
        
        if ([controller isKindOfClass:[RegisterViewController class]]) {
            
            RegisterViewController *registers = [parm objectForKey:kCurrentController];
            
            if (responseObject) {
                
                [registers registerGetData:responseObject];
            }
        }
        
    }];
    
}

- (void)requestLoginAction:(NSDictionary*)parm{
    
    EliveHttpApi *api = [EliveHttpApi new];
    
    UIViewController *controller = [parm objectForKey:kCurrentController];
    
    [api requestLoginGetDataWithParameters:parm result:^(id responseObject) {
        
        if ([controller isKindOfClass:[LoginViewController class]]) {
            
            LoginViewController *login = [parm objectForKey:kCurrentController];
            
            if (responseObject) {
                
                [login loginGetData:responseObject];
            }
        }
        
    }];
}

- (void)requestGetUserAddress:(NSDictionary*)parm{

    EliveHttpApi *api = [EliveHttpApi new];
    
    UIViewController *controller = [parm objectForKey:kCurrentController];
    
    [api requestGetUserAddressListWithParameters:parm result:^(id responseObject) {
        
        if ([controller isKindOfClass:[AddressViewController class]]) {
            
            AddressViewController *address = [parm objectForKey:kCurrentController];
            
            if (responseObject) {
                
                [address getMyAddressList:responseObject];
            }
        }
        
    }];

}


- (void)requestHomeProducitonList:(NSDictionary*)parm{

    EliveHttpApi *api = [EliveHttpApi new];
    
    UIViewController *controller = [parm objectForKey:kCurrentController];
    
    [api requestHomeProducitonListRequest:nil result:^(id responseObject) {
        
        if ([controller isKindOfClass:[HomeViewController class]]) {
            
            HomeViewController *home = [parm objectForKey:kCurrentController];
            
            if (responseObject) {
                
                [home productionListGetData:responseObject];
            }
        }
        
    }];
    
}

- (void)requestProducitonDetail:(NSDictionary*)parm{

    EliveHttpApi *api = [EliveHttpApi new];
    
    UIViewController *controller = [parm objectForKey:kCurrentController];
    
    [api requestProducitonDetailRequest:parm result:^(id responseObject) {
        
        if ([controller isKindOfClass:[ProductionDetailViewController class]]) {
            
            ProductionDetailViewController *production = [parm objectForKey:kCurrentController];
            
            if (responseObject) {
                
                [production getProductionDetail:responseObject];
            }
        }
        
    }];
}

- (void)requestSubmitOrder:(NSDictionary*)parm{

    EliveHttpApi *api = [EliveHttpApi new];
    
    UIViewController *controller = [parm objectForKey:kCurrentController];
    
    [api requestSubmitOrdersRequest:parm result:^(id responseObject) {
        
        if ([controller isKindOfClass:[ProductionDetailViewController class]]) {
            
            ProductionDetailViewController *production = [parm objectForKey:kCurrentController];
            
            if (responseObject) {
                
                [production resultOfSubmitOrder:responseObject];
            }
        }
        
    }];

}

- (void)requestGetOrderDetail:(NSDictionary*)parm{

    EliveHttpApi *api = [EliveHttpApi new];
    
    UIViewController *controller = [parm objectForKey:kCurrentController];
    
    [api requestOrderDetailRequest:parm result:^(id responseObject) {
        
        if ([controller isKindOfClass:[OrderCreateController class]]) {
            
            OrderCreateController *order = [parm objectForKey:kCurrentController];
            
            if (responseObject) {
                
                [order orderGetDetail:responseObject];
            }
        }
        
    }];

}





@end
