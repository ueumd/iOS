//
//  StoryViewController.m
//  iOS-Study
//
//  Created by Daysun on 2020/2/15.
//  Copyright © 2020 Daysun. All rights reserved.
//

/**
 沙盒中相关路径
 AppName.app 应用程序的程序包目录，包含应用程序的本身。由于应用程序必须经过签名，所以不能在运行时对这个目录中的内容进行修改，否则会导致应用程序无法启动。
 
 Documents/ 保存应用程序的重要数据文件和用户数据文件等。用户数据基本上都放在这个位置(例如从网上下载的图片或音乐文件)，该文件夹在应用程序更新时会自动备份，在连接iTunes时也可以自动同步备份其中的数据。
 
 Library：这个目录下有两个子目录,可创建子文件夹。可以用来放置您希望被备份但不希望被用户看到的数据。该路径下的文件夹，除Caches以外，都会被iTunes备份.
 
 Library/Caches: 保存应用程序使用时产生的支持文件和缓存文件(保存应用程序再次启动过程中需要的信息)，还有日志文件最好也放在这个目录。iTunes 同步时不会备份该目录并且可能被其他工具清理掉其中的数据。
 Library/Preferences: 保存应用程序的偏好设置文件。NSUserDefaults类创建的数据和plist文件都放在这里。会被iTunes备份。
 
 tmp/: 保存应用运行时所需要的临时数据。不会被iTunes备份。iPhone重启时，会被清空。
 
 作者：Andy_Ron
 链接：https://www.jianshu.com/p/d0376fb9ec71
 */

#import "StoryViewController.h"

@interface StoryViewController ()

@property (nonatomic, assign) int index; // 索引
@property (nonatomic, strong) NSArray *pic; // 图片数组

@property (weak, nonatomic) IBOutlet UIButton *btnPre;
@property (weak, nonatomic) IBOutlet UIButton *btnNext;

@property (weak, nonatomic) IBOutlet UILabel *lblIndex;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

@property (weak, nonatomic) IBOutlet UIImageView *imgViewIcon;

- (IBAction)pre;

- (IBAction)next;

@end

@implementation StoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self getPath];
    
    self.index = -1;
    
    [self next];
}

- (void) getPath{
    // 获取沙盒根目录路径
    NSString *homeDir = NSHomeDirectory();
    
    // 获取Documents路径
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
    //获取Library的目录路径
    NSString *libDir = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
    
    // 获取cache目录路径
    NSString *cachesDir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    
    // 获取tmp目录路径
    NSString *tmpDir = NSTemporaryDirectory();
    
    // 获取应用程序程序包中资源文件路径的方法：
    NSString *bundle = [[NSBundle mainBundle] bundlePath];
    
    NSLog(@"homeDir=%@ \n docDir=%@ \n libDir=%@ \n cachesDir=%@ \n tmpDir=%@ \n bundle=%@", homeDir,docDir, libDir, cachesDir, tmpDir, bundle);
    
}

// 重写pic属性get方法
- (NSArray *)pic{
    if(_pic == nil) {
        /**
         获取pic.plist文件的路径赋值给path变量
         [NSBundle mainBundle] 表示获取这个app安装到手机上时的根目录
         然后在app的安装的根目录下搜索pic.plist文件的路径
         */
        NSString *path = [[NSBundle mainBundle] pathForResource:@"pic.plist" ofType:nil];
        NSArray * array = [NSArray arrayWithContentsOfFile:path];
        _pic = array;
    }
    
    return _pic;
}

- (IBAction)pre {
    self.index --;
    [self setData];
}

- (IBAction)next {
    self.index++;
    [self setData];
}

- (void)setData{
    NSLog(@"%d", self.index);
    // NSLog(self.btnNext);
    // 从数组中获取当前这张图片的数据， 数组中存放是字典数据
    NSDictionary *dict = self.pic[self.index];
    
    self.lblIndex.text = [NSString stringWithFormat:@"%d/%1d", self.index+1, self.pic.count];
    self.imgViewIcon.image = [UIImage imageNamed:dict[@"icon"]];
    self.lblTitle.text = dict[@"title"];
    
    self.btnPre.enabled = (self.index != 0);
    self.btnNext.enabled = (self.index != (self.pic.count -1));
    
}

@end
