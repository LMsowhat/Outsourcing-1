//
//  HomeViewController.m
//  Outsourcing
//
//  Created by 李文华 on 2017/6/14.
//  Copyright © 2017年 李文华. All rights reserved.
//

#import "HomeViewController.h"
#import "SDCycleScrollView.h"
#import "ProductionCollectionViewCell.h"
#import "ProductionModel.h"


#define headerWidth 150
@interface HomeViewController ()
<UIScrollViewDelegate,
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout,
SDCycleScrollViewDelegate,
UIGestureRecognizerDelegate
>

@property (nonatomic ,strong)UICollectionView *mainCollection;
@property (nonatomic ,strong)NSMutableArray *dataSource;
@property (nonatomic ,strong)SDCycleScrollView *headerSDCycle;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    // Do any additional setup after loading the view.
    [self setupUI];
    [self sendHttpRequest];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Initial Methods

/** 视图初始化 */
- (void)setupUI {
    
    [self.view addSubview:self.headerSDCycle];
    [self.view addSubview:self.mainCollection];
    
}

/** 加载数据 */
- (void)sendHttpRequest {
    
    
}
#pragma mark - Setter & Getter
static NSString *kcellIdentifier = @"collectionCellID";
static NSString *kheaderIdentifier = @"headerIdentifier";
-(UICollectionView *)mainCollection{

    if (!_mainCollection) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumInteritemSpacing = 5;
        layout.minimumLineSpacing = 5;
        
        _mainCollection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, headerWidth, kWidth, kHeight - headerWidth) collectionViewLayout:layout];
        _mainCollection.backgroundColor = kWhiteColor;
        _mainCollection.delegate = self;
        _mainCollection.dataSource = self;
        _mainCollection.showsVerticalScrollIndicator = NO;
        _mainCollection.showsHorizontalScrollIndicator = NO;
        
        //注册Cell
        [_mainCollection registerClass:[ProductionCollectionViewCell class] forCellWithReuseIdentifier:kcellIdentifier];
        //注册Header
        [_mainCollection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kheaderIdentifier];
        
    }

    return _mainCollection;
}

-(SDCycleScrollView *)headerSDCycle{

    if (!_headerSDCycle) {
        
        _headerSDCycle = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kWidth, headerWidth) imageNamesGroup:@[@"3.jpg",@"4.jpg",@"5.jpg"]];
        _headerSDCycle.delegate = self;
        _headerSDCycle.autoScrollTimeInterval = 2;
        _headerSDCycle.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        

    }
    return _headerSDCycle;
}

#pragma mark - Target Mehtods

#pragma mark - Notification Method

#pragma mark - Private Method

#pragma mark - Public Method

#pragma mark - Other Delegate

#pragma mark - UICollectionView Delegate &Datasource
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
    //    NSLog(@"index has clicked----%ld",(long)index);
    
}

/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
    
    //    NSLog(@"index has rolled-----%ld",(long)index);
    
}



#pragma mark- CollectionViewDelegate

//section
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //    if (section == 1) {
    //
    //        return self.dataSource.count;
    //    }else{
    //
    //        return 4;
    //    }
//    return self.dataSource.count;
    return 4;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //重用cell
    ProductionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kcellIdentifier forIndexPath:indexPath];
    
//    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:self.dataSource[indexPath.row][@"course"][@"data"]];
//    
//    CourseModel *model = [CourseModel mj_objectWithKeyValues:dict];
    
    [cell fitDataWith:nil];
    
    return cell;
    
}

// The view that is returned must be retrieved from a call to -dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//    
//    return (UICollectionReusableView *)self.headerSDCycle;
//}

//定义每个UICollectionViewCell 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((kWidth - 25)/2, 200);
}
//定义每个Section 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 10, 20, 10);//分别为上、左、下、右
}
//返回头headerView的大小
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
//    if (section == 0) {
//        return CGSizeMake(kWidth, 285);
//    }
//    CGSize size=CGSizeMake(kWidth, 65);
//    return size;
//}
//返回头footerView的大小
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
//{
//    CGSize size=CGSizeMake(kWidth, 15);
//
//    return size;
//}
//每个section中不同的行之间的行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    
    return 20;
}

//每个item之间的间距
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 5;
//}
//选择了某个cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
}
//取消选择了某个cell
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
}


@end
