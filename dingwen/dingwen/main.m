//
//  main.m
//  dingwen
//
//  Created by ru on 2018/6/29.
//  Copyright © 2018年 ru. All rights reserved.
//

#import <Foundation/Foundation.h>


//======================使用方法=======================
//
// 通过clang编译成可执行文件              hello 是执行文件了
// clang -fobjc-arc -framework Foundation main.m -o hello
// 使用：终端cd到可执行文件目录,执行 ./MixFileName 工程文件路径
//
//======================使用方法========================

@interface Model : NSObject


+ (void)creatFile:(NSString *)str;

@end

@implementation Model

+ (void)creatFile:(NSString *)str {
    
    
   //就跟OC一样了
    //可以创建文件  修改文件名 替换文件内容等
    NSLog(@"helloWorld！");
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        if (argv[1] == NULL) {
            //这里是接收的参数
//            return 0;
               [Model creatFile:nil];
        }else {
            //用这个区转成字符串
            NSString *file = [[NSString alloc] initWithUTF8String:argv[1]];
            NSLog(@"你输入的参数为:%@",file);
            
            [Model creatFile:file];
        }
        
     
      
    }
    return 0;
}
