//
//  PasosTableViewCell.h
//  OaoApplication
//
//  Created by Desarrollo AWS on 30/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PasosTableViewCell : UITableViewCell

+(CGFloat)cellHeight;

@property (strong, nonatomic) IBOutlet UIImageView *img;

@property (strong, nonatomic) IBOutlet UILabel *title;

@end
