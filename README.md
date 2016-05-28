# WDAutoLayout
一个功能强大的自动布局框架

##目前已经在真实的项目中使用:
可以在appstore搜索回家吃饭，整个回家吃饭客户端的首页95%的的布局都是使用WDAutoLayout

## 功能介绍：
#### 1：tableview和cell高度自适应，并且有一套强大的缓存机制，实现cell内部多级缓存。
#### 2：普通view的自动布局，提供多种API接口，使得布局更加简单。
#### 3: 支持UIScrollView 内容的自适应。
#### 4: 布局是采用纯计算的方式来实现的，内部维护一套布局算法，因此可以跟手动计算frame混合使用。

# 用法简介
## tableview和cell高度自适应：
    1. >> 设置cell高度自适应：
    // cell布局设置好之后调用此方法就可以实现高度自适应（注意：如果用高度自适应则不要再以cell的底边为参照去布局其子view）
       [cell wd_setupBottomViewWithBottomViewArray:@[self.contentLabel] marginToBottom:margin];

    
    2. >> 获取自动计算出的cell高度
    return [WDDemoVC5Cell wd_heightForRowWithTableView:tableView atIndexPath:indexPath configuration:^(UITableViewCell *cell) {
        WDDemoVC5Cell *demoCell = (WDDemoVC5Cell *)cell;
        demoCell.model = self.dataArray[indexPath.row];
    }];
## 普通view的自动布局：
    /* 用法一 */
    _view.wd_layout
    .leftSpaceToView(self.view, 10)
    .topSpaceToView(self.view, 80)
    .height(130)
    .widthRatioToView(self.view, 0.4);  

    /* 用法二 （一行代码搞定，其实用法一也是一行代码） */
    _view.wd_layout.leftSpaceToView(self.view, 10).topSpaceToView(self.view,80).height(130).widthRatioToView(self.view, 0.4);  
    
      >> UILabel文字自适应：
    // autoHeightRatio() 传0则根据文字自动计算高度（传大于0的值则根据此数值设置高度和宽度的比值）
    _label.wd_layout.autoHeightRatio(0);
    
    *******************************************************************************
        
        注意:先把需要自动布局的view加入父view然后在进行自动布局，例： 
        
        UIView *view0 = [[UIView alloc] init];
        UIView *view1 = [[UIView alloc] init];
        [self.view addSubview:view0];
        [self.view addSubview:view1];
        
        view0.wd_layout
        .leftSpaceToView(self.view, 10)
        .topSpaceToView(self.view, 80)
        .height(100)
        .widthRatioToView(self.view, 0.4);
        
        view1.wd_layout
        .leftSpaceToView(view0, 10)
        .topEqualToView(view0)
        .heightRatioToView(view0, 1)
        .rightSpaceToView(self.view, 10);
        
#### 自动布局用法简析
   1.1 > leftSpaceToView(self.view, 10)
   
   方法名中带有“SpaceToView”的方法表示到某个参照view的间距，需要传递2个参数：（UIView）参照view 和 （CGFloat）间距数值
   
   1.2 > widthRatioToView(self.view, 1)
   
   方法名中带有“RatioToView”的方法表示view的宽度或者高度等属性相对于参照view的对应属性值的比例，需要传递2个参数：（UIView）参照view 和 （CGFloat）倍数
   
   1.3 > topEqualToView(view)
   
   方法名中带有“EqualToView”的方法表示view的某一属性等于参照view的对应的属性值，需要传递1个参数：（UIView）参照view
   
   1.4 > width(100) 设置宽度
   
   1.5 > height(100)这是高度
 
   
#PS
 具体的用法请参考demo中的使用以及WDViewLayout和UIView + WDAutoLayout 分类

    
    
