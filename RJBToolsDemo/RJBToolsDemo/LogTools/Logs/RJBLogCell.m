//
//  RJBLogCell.m
//  RJBToolsDemo
//
//  Created by ru on 2018/6/28.
//  Copyright © 2018年 ru. All rights reserved.
//

#import "RJBLogCell.h"
#import "RJBLogModel.h"

@interface RJBLogCell ()



@end

@implementation RJBLogCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
     
        //设置Ui
        self.selectionStyle = 0;
        self.contentView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
        self.textLabel.numberOfLines = 0;
        self.textLabel.font = [UIFont systemFontOfSize:14];
    }
    return self;
}

- (void)setupUI {
    
}

- (void)setModel:(RJBLogModel *)model {
    _model = model;
    self.textLabel.text = model.name;
}


@end
