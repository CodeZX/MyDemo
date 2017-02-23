//
//  autolayoutTableViewCell.m
//  demo
//
//  Created by 周鑫 on 2017/2/23.
//  Copyright © 2017年 周鑫. All rights reserved.
//

#import "autolayoutTableViewCell.h"
#import "CommonConst.h"

@interface autolayoutTableViewCell  ()

@property (nonatomic,weak)UILabel *namelableel;
@end


@implementation autolayoutTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self setupUI];
    }
    
    return self;
}





- (void)setupUI {
    
    UILabel *namelable = [UILabel new];
    namelable.backgroundColor = [UIColor orangeColor];
    namelable.numberOfLines = 0;
    [self.contentView addSubview:namelable];
    self.namelableel = namelable;
    [self.namelableel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).offset(20);
        make.bottom.right.equalTo(self.contentView).offset(-20);
    }];

    
}


- (void)setNameString:(NSString *)nameString {
    _nameString = nameString;
    
    self.namelableel.text  = nameString;
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
   
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
