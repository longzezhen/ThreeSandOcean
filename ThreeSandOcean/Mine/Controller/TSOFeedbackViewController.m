//
//  TSOFeedbackViewController.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/21.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSOFeedbackViewController.h"

@interface TSOFeedbackViewController ()<UITextViewDelegate>
@property (nonatomic,strong)UITextView * textView;
@property (nonatomic,strong)UILabel * showTextNumLabel;
@property (nonatomic,strong)UIButton * submitButton;
@end

@implementation TSOFeedbackViewController

#pragma mark - lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

#pragma mark - private
-(void)initView
{
    self.view.backgroundColor = ColorFromRGB(0xF8F8F8);
    self.title = @"意见反馈";
    [self goBackBarButton];
    self.textView.hidden = NO;
    self.showTextNumLabel.hidden = NO;
    self.submitButton.hidden = NO;
}

#pragma mark - action
-(void)clickSubmitButton
{
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    END_EDITING;
}

#pragma mark - UITextViewDelegate
-(void)textViewDidChange:(UITextView *)textView
{
    if ([textView.text length]>100) {
        textView.text = [textView.text substringToIndex:100];
    }
    self.showTextNumLabel.text = [NSString stringWithFormat:@"%ld/100",(long)[textView.text length]];
}


-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        END_EDITING;
        return NO;
    }
    return YES;
}

//已经进入编辑模式
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if([textView.text isEqualToString:@"请留下您宝贵的意见,以便我们更好的改进."]){
        textView.text=@"";
        textView.textColor = ColorFromRGB(0xBBBBBB);
    }
}

//已经结束/退出编辑模式
- (void)textViewDidEndEditing:(UITextView *)textView
{
    if(textView.text.length < 1){
        textView.text = @"请留下您宝贵的意见,以便我们更好的改进.";
        textView.textColor = ColorFromRGB(0xBBBBBB);
    }
}



#pragma mark - get
-(UITextView *)textView
{
    if (!_textView) {
        _textView = [[UITextView alloc] init];
        _textView.delegate = self;
        _textView.returnKeyType = UIReturnKeyDone;
        _textView.textContainerInset = UIEdgeInsetsMake(Auto_Width(13), Auto_Width(15), Auto_Width(13), Auto_Width(15));
        _textView.backgroundColor = ColorFromRGB(0xFFFFFF);
        _textView.text = @"请留下您宝贵的意见,以便我们更好的改进.";
        _textView.textColor = ColorFromRGB(0xBBBBBB);
        _textView.font = KFont(14);
        LayerMakeCorner(_textView, 8);
        [self.view addSubview:_textView];
        [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(Auto_Width(16));
            make.left.mas_equalTo(Auto_Width(10));
            make.right.mas_equalTo(Auto_Width(-10));
            make.height.mas_equalTo(Auto_Width(180));
        }];
        
    }
    return _textView;
}

-(UILabel *)showTextNumLabel
{
    if (!_showTextNumLabel) {
        _showTextNumLabel = [UILabel new];
        _showTextNumLabel.text = @"1/100";
        _showTextNumLabel.textColor = ColorFromRGB(0x6881FD);
        _showTextNumLabel.font = KFont(14);
        [self.view addSubview:_showTextNumLabel];
        [_showTextNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.textView).mas_equalTo(Auto_Width(-10));
            make.right.mas_equalTo(self.textView).mas_equalTo(Auto_Width(-10));
        }];
    }
    return _showTextNumLabel;
}

-(UIButton *)submitButton
{
    if (!_submitButton) {
        _submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _submitButton.backgroundColor = ColorFromRGB(0x6881FD);
        LayerMakeCorner(_submitButton, 20);
        [_submitButton setTitle:@"提交" forState:UIControlStateNormal];
        [_submitButton setTitleColor:ColorFromRGB(0xFBFBFB) forState:UIControlStateNormal];
        _submitButton.titleLabel.font = KFont(15);
        [_submitButton addTarget:self action:@selector(clickSubmitButton) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_submitButton];
        [_submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.textView.mas_bottom).mas_equalTo(Auto_Width(40));
            make.centerX.mas_equalTo(0);
            make.left.mas_equalTo(Auto_Width(26));
            make.height.mas_equalTo(Auto_Width(45));
        }];
    }
    return _submitButton;
}
@end
