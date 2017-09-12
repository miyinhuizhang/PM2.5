<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <head>
  <base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PM2.5(细颗粒物)及空气质量指数(AQI)实时查询预测！</title>
<link href="http://www.pm25.com/css/common.css" rel="stylesheet" type="text/css" />
<link href="http://www.pm25.com/css/index.css" rel="stylesheet" type="text/css" /> 
<script src="http://www.pm25.com/sea-modules/seajs/seajs/2.2.1/sea.js"></script>
<script src="http://www.pm25.com/sea-modules/conf/common.js"></script>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
<!--顶部功能条-->
<div class="topnav_width">
       <div class="topnav">
                 <div class="topnav_left">
                        <a class="topnav_sitemap" href="" style="padding-bottom:8px;">网站导航</a>
                        <b>|</b>
                        <div class="topnav_sitemap_active" style="display:none;">
                            <div class="topnav_sitemap_main">
                                  <div class="tsm_row">
                                      <div class="tsm_row_item">
                                          <h3><a href="/city.html">城市实时监测</a></h3>
                                          <a href="/city.html">监测点详情</a>
                                      </div>
                                      <div class="tsm_row_item">
                                          <h3><a href="/rank.html" target="_blank">排行榜</a></h3>
                                          <a href="/rank.html" target="_blank">实时排行榜</a>
                                      </div>
                                  </div>
                            </div>
                        </div>
                        <div class="topnav_app_active" style="display:none;width:170px;">
                            <!-- <div class="topnav_app_item">
                                  <p><img src="/images/erweima_wap.gif"/></p>
                                  <a href="http://apk.tu6.cn/pm25/PM25_v2.0.0.1.apk" target="_blank">Andriod版下载</a>
                            </div> -->
                            <div class="topnav_app_item" style="border-right:none;">
                                  <p><img src="/images/erweima_wap.gif"/></p>
                                  <span href="">扫描二维码访问手机版</span>
                            </div>
                        </div>
                 </div>
       </div>

</div>
<!--导航-->
<div class="menu_width">
         <div class="menu">
              <div class="menu_logo" ><a href="/"></a></div>
              <ul class="menu_list">
                    <!---当前页面是哪个栏目，只用在li的class里再加个" current "就行了-->
                    <li class="menu_1"><a  class="current"  href="/"><i></i><span>首页</span></a></li>
                    <li class="menu_2"><a  href="/city/shijiazhuang.html"><i></i><span>实时监测</span></a></li>
                    <li class="menu_3"><a  href="/rank.html"><i></i><span>排行榜</span></a></li>
                    <li class="menu_4"><a  href="/news.html"><i></i><span>PM2.5真相</span></a></li>
                    <li class="menu_5"><a  href="/protection.html"><i></i><span>PM2.5防护</span></a></li>
                    <div class="clear"></div>
              </ul>
         </div>   
</div>
<!--banner上的阴影-->
<div class="banner_shadow"></div>

<script>
/* seajs.use(['$'], function(){
$(function(){

  // 头部搜索
  $('.topnav_search_btn').click(function(){
    var str = encodeURI($('.topnav_search_city_text').val());
    window.location = '/so/' + str + '/all';
  });

  $('.topnav_search_city_text').bind("keyup", function(event){
    if(event.keyCode == 13){
      var str = encodeURI($('.topnav_search_city_text').val());
      window.location = '/so/' + str + '/all';
    }
  });

  $(".topnav_sitemap").mouseover(function(){
    $('.topnav_sitemap_active').show();
  }).mouseout(function(){
    $('.topnav_sitemap_active').hide();
  });

  $(".topnav_sitemap_active").mouseover(function(){
    $('.topnav_sitemap_active').show();
  }).mouseout(function(){
    $('.topnav_sitemap_active').hide();
  });

  $(".topnav_phone").mouseover(function(){
    $('.topnav_app_active').show();
  }).mouseout(function(){
    $('.topnav_app_active').hide();
  });

  $(".topnav_app_active").mouseover(function(){
    $('.topnav_app_active').show();
  }).mouseout(function(){
    $('.topnav_app_active').hide();
  });
  
});
}); */
</script><div class="abp" style='display:none;top:40px;'>
  <div id="danmu" class="container" style="width:100%;height:290px;"></div>
</div>
<link href="http://www.pm25.com/sea-modules/pm25/danmu/style.min.css" rel="stylesheet" type="text/css" />
<!--banner上的阴影-->
<div class="banner_shadow"></div>

<!--始终固定在最上边的内容显示-->
<div class="banner_index_width">
        <div class="banner_index">
               <!--切换城市-->
               <div class="bi_location">
                        <a class="bi_location_add minicity_clk" href="javascript:void(0)"></a>
                        <h2 class="bi_loaction_city">石家庄</h2>
                        <!--鼠标划上来后，在这里加“bi_location_content_hover”-->
                                                <div class="bi_location_content ">
                                 <a class="bi_location_content_dropdown" href="javascript:void(0)"><span class="mon_span">选择监测点</span><i></i></a>
                                  <div class="bi_location_content_active hide">
                                         <ul>
                                              <li><a class="dontSelect current" href="javascript:void(0)" mon="选择监测点" aqi="87" pm25="45" qua="良" lv="2" url="/city/石家庄.html"><i>•</i>全部监测点</a></li>
                                                                                            <li><a href="javascript:void(0)" mon="职工医院" aqi="82" pm25="30" qua="良" lv="2" url="/city/mon/aqi/石家庄/职工医院.html"><i>•</i>职工医院</a></li>
                                                                                            <li><a href="javascript:void(0)" mon="高新区" aqi="97" pm25="33" qua="良" lv="2" url="/city/mon/aqi/石家庄/高新区.html"><i>•</i>高新区</a></li>
                                                                                            <li><a href="javascript:void(0)" mon="西南高教" aqi="125" pm25="45" qua="轻度污染" lv="3" url="/city/mon/aqi/石家庄/西南高教.html"><i>•</i>西南高教</a></li>
                                                                                            <li><a href="javascript:void(0)" mon="世纪公园" aqi="71" pm25="27" qua="良" lv="2" url="/city/mon/aqi/石家庄/世纪公园.html"><i>•</i>世纪公园</a></li>
                                                                                            <li><a href="javascript:void(0)" mon="人民会堂" aqi="69" pm25="39" qua="良" lv="2" url="/city/mon/aqi/石家庄/人民会堂.html"><i>•</i>人民会堂</a></li>
                                                                                            <li><a href="javascript:void(0)" mon="封龙山" aqi="79" pm25="17" qua="良" lv="2" url="/city/mon/aqi/石家庄/封龙山.html"><i>•</i>封龙山</a></li>
                                                                                            <li><a href="javascript:void(0)" mon="22中南校区" aqi="86" pm25="44" qua="良" lv="2" url="/city/mon/aqi/石家庄/22中南校区.html"><i>•</i>22中南校区</a></li>
                                                                                            <li><a href="javascript:void(0)" mon="西北水源" aqi="165" pm25="125" qua="中度污染" lv="4" url="/city/mon/aqi/石家庄/西北水源.html"><i>•</i>西北水源</a></li>
                                                                                       </ul>
                                  </div>
                          </div> 
                                       </div> 
               <!--AQI展示-->
               <div class="bi_aqiarea">
                   <div class="bi_aqiarea_top">
                        <a class="bi_aqiarea_num" href="/city/shijiazhuang.html">87</a>
                        <!--划上去可以摊开页面底部的曲线图-->
                        <p class="bi_aqiarea_right">
                          <span class="bi_aqiarea_wuran wuranlevel_2">良</span>
                          <span class="bi_aqiarea_tips">AQI指数</span>
                        </p>
                        <div class="clear"></div>
                    </div>
                    <div class="bi_aqiarea_bottom">
                                        <p>PM2.5浓度：<span class="pm25_span">45</span>微克/立方米</p>
                         <p>击败了全国 37% 的城市，目前城市排名 230 </p>
                                        </div>
               </div>
               <!--天气位置-->
               <div class="bi_infoarea">
                     <div class="bi_info">
                            <!--鼠标划到分享按钮上的时候，先增加个“bi_info_hover”，再把下边的“bi_info_active”变为"display:block"-->
                            
                            <div class="bi_info_share_active" style="display:none">
                                <a class="bi_info_share_active_sina" title="分享到新浪微博" href="javascript:void(0)"></a>
                                <a class="bi_info_share_active_qzone" title="分享到QQ空间" href="javascript:void(0)"></a>
                            </div>
                            <p class="bi_info_weather"><img src="http://p1.qhimg.com/d/_hao360/weather/0.png" title="晴"> <span>晴</span> 30~17℃</p>
                            <div class="clear"></div>
                     </div>
                     <p class="bi_info_tips">数据来源：中国环境监测总站&nbsp;&nbsp;&nbsp;&nbsp;最后更新：2017-05-07 16:00</p>
               </div>
        </div>
</div>

<!--banner部分-底部-晴-->
<div class="weather_sunny_width">
   <div class="shatan_width">
    <div class="weather_sunny_shatan"><i class="weather_sunny_shatan_content"></i></div>
      </div>
     <div class="weather_sunny">
            <div class="weather_sunny_taiyang"><i class="weather_sunny_taiyang_content"></i></div>
            <div class="weather_sunny_dayun"><i class="weather_sunny_dayun_content"></i></div>
            <div class="weather_sunny_xiaoyun"><i class="weather_sunny_xiaoyun_content"></i></div>
            <div class="weather_sunny_qiqiu"><i id="qiqiu_a"class="weather_sunny_qiqiu_content"></i></div>
            <div class="weather_sunny_dashu"><i class="weather_sunny_dashu_content"></i></div>
            <div class="weather_sunny_xiaoshu"><i class="weather_sunny_xiaoshu_content"></i></div>
            <div class="weather_sunny_xiong"><i class="weather_sunny_xiong_content"></i></div>
            <div class="weather_sunny_yingzi"><i class="weather_sunny_yingzi_content"></i></div>
            <div class="weather_sunny_yugan"><i class="weather_sunny_yugan_content"></i></div>
            <div class="weather_sunny_yugou"><i class="weather_sunny_yugou_content"></i></div>
            <div class="weather_sunny_shuitong"><i class="weather_sunny_shuitong_content"></i></div>
            <div class="weather_sunny_dayu"><i class="weather_sunny_dayu_content"></i></div>
            <div class="weather_sunny_xiaoyu"><i class="weather_sunny_xiaoyu_content"></i></div>
   </div>
</div>

<!--主体内容-->
<div class="index_main_width">
    <div class="index_main">
        <div class="im_shenghuo">
              <p id="shzn" class="im_shenghuo_title">今日生活指南</p>
              <ul class="im_shenghuo_details">
                     <!--这下边的内容会根据大图状态不同，它的颜色不同“im_shenghuo_item_color_sunny”-名字是大图区域名字的后缀-->
                    <li class="im_shenghuo_kouzhao"> 
                        <!--鼠标划到对应的li上的时候，显示这个div-->
                        <div class="im_shenghuo_item_hover im_shenghuo_item_color_sunny" style="display:none;">
                             <p class="im_shenghuo_item_hover_title"><i></i><span>请佩戴</span></p>
                             <p class="im_shenghuo_item_hover_info">出入密集场所请佩戴口罩</p>
                        </div>
                        <dl>
                             <dt><i></i></dt>
                             <dd>口罩指数</dd>
                        </dl>
                    </li>
                     <li class="im_shenghuo_yundong"> 
                        <!--鼠标划到对应的li上的时候，显示这个div-->
                        <div class="im_shenghuo_item_hover im_shenghuo_item_color_sunny" style="display:none;">
                             <p class="im_shenghuo_item_hover_title"><i></i><span>室内运动</span></p>
                             <p class="im_shenghuo_item_hover_info">适当减少室外运动</p>
                        </div>
                        <dl>
                             <dt><i></i></dt>
                             <dd>运动指数</dd>
                        </dl>
                    </li>
                     <li class="im_shenghuo_kaichuang"> 
                        <!--鼠标划到对应的li上的时候，显示这个div-->
                        <div class="im_shenghuo_item_hover im_shenghuo_item_color_sunny" style="display:none;">
                             <p class="im_shenghuo_item_hover_title"><i></i><span>开窗通风</span></p>
                             <p class="im_shenghuo_item_hover_info">请减少开窗通风时间</p>
                        </div>
                        <dl>
                             <dt><i></i></dt>
                             <dd>开窗指数</dd>
                        </dl>
                    </li>
                     <li class="im_shenghuo_guomin"> 
                        <!--鼠标划到对应的li上的时候，显示这个div-->
                        <div class="im_shenghuo_item_hover im_shenghuo_item_color_sunny" style="display:none;">
                             <p class="im_shenghuo_item_hover_title"><i></i><span>较正常</span></p>
                             <p class="im_shenghuo_item_hover_info">尽量减少体力消耗大的户外运动</p>
                        </div>
                        <dl>
                             <dt><i></i></dt>
                             <dd>过敏指数</dd>
                        </dl>
                    </li>
                     <li class="im_shenghuo_jinghua"> 
                        <!--鼠标划到对应的li上的时候，显示这个div-->
                        <div class="im_shenghuo_item_hover im_shenghuo_item_color_sunny" style="display:none;">
                             <p class="im_shenghuo_item_hover_title"><i></i><span>关闭净化器</span></p>
                             <p class="im_shenghuo_item_hover_info">敏感人群请开启空气净化器</p>
                        </div>
                        <dl>
                             <dt><i></i></dt>
                             <dd>净化空气指数</dd>
                        </dl>
                    </li>
                     <li class="im_shenghuo_chuxing" style="border-right:none;"> 
                        <!--鼠标划到对应的li上的时候，显示这个div-->
                        <div class="im_shenghuo_item_hover im_shenghuo_item_color_sunny" style="display:none;">
                             <p class="im_shenghuo_item_hover_title"><i></i><span>适合出行</span></p>
                             <p class="im_shenghuo_item_hover_info">空气清新，适合出行</p>
                        </div>
                        <dl>
                             <dt><i></i></dt>
                             <dd>出行指数</dd>
                        </dl>
                    </li>
              </ul>
        </div>
        <!--左侧内容-->
<div class="jiance_zhao" style="width:100%; height:100%; position:fixed; z-index:900; top:0px; left:0px; background-color:rgba(0, 0, 0, 0.7); display:none;"></div>

<!--返回顶部-->
<div class="quick_item" style="display:none;">
    <a class="quick_item_back" title="回到顶部" href="javascript:void(0)"><i></i></a>
    <a class="quick_item_erweima" title="二维码" href="javascript:void(0)">
      <i></i>
      <div class="quick_item_erweima_active">
        <img src="/images/quick_erweima.gif" />
      </div>
    </a>
    <a class="quick_item_feedback" title="意见反馈" href="/about.html#feedback"><i></i><span>反馈</span></a>
    
</div>

<!--底部内容-->
<div class="footer_width">
       <div class="footer">
                <div class="footer_left">
                <div class="footer_left_links">
            </div>
                                    <div class="footer_frindlink">
<span>友情链接：</span>
<span class="footer_frindlink_tip">本站链接要求PR≥4, 百度权重≥7, QQ：1005343080</span>
<p>
      <a href="http://www.zhb.gov.cn/" target="_blank">环保部</a>
      <a href="http://www.weather.com.cn/" target="_blank">天气网</a>
      <a href="http://www.stateair.net/web/post/1/1.html" target="_blank">美使馆AQI</a>
      <a href="http://tianqi.cncn.com/" target="_blank">天气预报</a>
      <a href="http://www.yangshitianqi.com/" target="_blank">央视天气</a>
      <a href="http://weather.sina.com.cn/" target="_blank">新浪天气</a>
      <a href="http://www.keyunzhan.com/tianqi/" target="_blank">天气预报查询</a>
      <a href="http://www.tianqi.com/" target="_blank">天气预报15天查询</a>
      <a href="http://baike.hao123.cn/tianqi/" target="_blank">天气查询</a>
</p>
</div>                      </div>
          
          <div class="footer_right">
                   <a class="footer_logo" href=""></a>
				<p class="footer_aboutus"></p>
               <!-- <p class="footer_aboutus"><a href="/about.html" target="_blank">关于我们</a>&nbsp;|&nbsp;<a href="/about.html#feedback" target="_blank">联系我们</a>|&nbsp;<a href="/about/company" target="_blank">网站简介</a></p> -->
               <p class="footer_email">意见建议：info@pm25.com</p>
               <p class="footer_icons">
                    <span>关注我们：</span>
                <a class="footer_icons_sina" title="新浪微博" href="http://weibo.com/u/5108207785" target="_blank"><i></i></a>
                <a class="footer_icons_baidu" title="百度贴吧" href="http://tieba.baidu.com/f?kw=pm25" target="_blank"><i></i></a>
                <a class="footer_icons_douban" title="豆瓣小站" href="http://www.douban.com/people/pm25cx/" target="_blank"><i></i></a>
              </p>   
          </div>
          <div class="clear"></div>
     </div>
</div>
<!--最底部版权-->
<div class="copyright_width">
      <div class="copyright">
        <p class="copyright_datafrom">本站数据来自最权威的环保部数据<a href="/news/291.html" target="_blank">点此查看详情&gt;&gt;</a></p>
    </div>
</div>
</body>
</html>

<script>
seajs.use(['$', 'cookie'], function($, Cookie){
  $(document).ready(function(){
    $(window).scroll(function(){
      var curh = $(document).scrollTop();
      if(curh > 300) {
      $('.quick_item').fadeIn(100);
      }else{
      $('.quick_item').fadeOut(100);
      }
    });
    $('.quick_item_back').click(function(){
    $('html, body').animate({scrollTop:0}, 'slow');});

  });
});
</script>

<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_30089631'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "w.cnzz.com/c.php%3Fid%3D30089631' type='text/javascript'%3E%3C/script%3E"));</script>
<div style="display:none">
<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fb3de58f8471ab2214a3e7d885a987266' type='text/javascript'%3E%3C/script%3E"));
</script></div><style>
.autocomplete-suggestions{position:absolute; z-index:50; background-color:#fff; width:200px;box-shadow:0 1px 5px rgba(0,0,0,.2);-moz-box-shadow:0 1px 5px rgba(0,0,0,.2);-webkit-box-shadow:0 1px 5px rgba(0,0,0,.2);-moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius:5px; overflow-x:hidden;margin-top:5px;}
.autocomplete-suggestion{}
.autocomplete-suggestion a{display:block;line-height:30px; text-indent:5px; border-bottom:#ececec solid 1px; margin:0px 10px;}
.autocomplete-suggestion a:hover{color:#4a9828; background-color:#ececec;}
.minicity {right: -900px;}
</style>
<!--侧边城市弹出-->
<link href="/sea-modules/jquery/tinyscrollbar/tinyscrollbar.css" rel="stylesheet" type="text/css">
<div id="scrollbar1" class="minicity" style="display:block;">
    <div class="minicity_title">
           <a class="mt_close"><i></i></a>
           <p>
                <span class="minicity_title_wenzi">选择城市</span>
           </p>
    </div>
    <div class="scrollbar"><div class="track"><div class="thumb"><div class="end"></div></div></div></div>
    <div class="minicity_content viewport">
        <div class="overview">
              <!--工具条上方的热门城市部分内容-->
              <div class="hot_city">
                        <div class="city_default">
                                <p class="city_default_one">
                                  <span>当前城市：</span><i class="current_city">石家庄</i>
                                  <a href="#" class="city_default_shezhi " city="石家庄" citypy="shijiazhuang">设置为默认城市</a>
                                </p>
                                <p class="city_default_two"  style="display:none; ">
                                  <span style="font-weight:normal;">默认城市：</span>
                                  <a href="" class="default_city"></a>
                                  <a href="javascript:void(0)" class="city_default_shanchu">[删除]</a>
                                </p>
                                <div class="clear"></div>
                        </div>
                          <dl>
                               <dt>热门城市:</dt>
                                <dd>
                                  <a href="/beijing.html">北京</a>
                                  <a href="/shanghai.html">上海</a>
                                  <a href="/guangzhou.html">广州</a>
                                  <a href="/shenzhen.html">深圳</a>
                                  <a href="/hangzhou.html">杭州</a>
                                  <a href="/tianjin.html">天津</a>
                                  <a href="/chengdu.html">成都</a>
                                  <a href="/nanjing.html">南京</a>
                                  <a href="/xian.html">西安</a>
                                  <a href="/wuhan.html">武汉</a>
                                </dd>
                                
                         </dl>
                         <div class="clear"></div>
                         <dl>
                               <dt>最近访问:</dt>
                               <dd>
                                                              </dd>

                         </dl>
                         <div class="clear"></div>
               </div>
               
               <!--筛选工具条-->
                <div class="city_control">
                      <div class="city_control_tab"><!---当前是谁，就在谁上边加“city_control_current”-->
                                <a class="city_control_current tab_pc" href="javascript:void(0)">按省份</a>
                                <a class="tab_fc" href="javascript:void(0)">按城市</a>
                      </div>
                      <div class="c_search">
                                <div class="search_city">
                                          <input type="text" value="" placeholder="输入城市名" class="search_city_text" id="autocomplete">
                                          <input type="button" class="search_btn search_btn_active">
                                          <div class="clear"></div>
                                 </div>
                                <!--即时显示搜索结果-->
                                 <div class="search_result_width" style="display:none;">
                                           <ul class="search_result">
                                                   <li><a href="">保定</a></li>
                                                   <li><a href="">北京</a></li>
                                                   <li><a href="">包头</a></li>
                                                   <li><a href="">宝鸡</a></li>
                                            </ul>
                                  </div>
                        </div>
                        <div class="clear"></div>
                        <!-- <div class="city_control_A-Z pc_a_z">
                                <a href="">A</a>
                                <a href="">F</a>
                                <a href="">G</a>
                                <a href="">H</a>
                                <a href="">J</a>
                                <a href="">L</a>
                                <a href="">N</a>
                                <a href="">Q</a>
                                <a href="">S</a>
                                <a href="">X</a>
                                <a href="">Y</a>
                                <a href="">Z</a>
                                <a href="">直辖市</a>
                                <a href="">港澳台</a>
                        </div> -->
                        <!-- <div class="city_control_A-Z fc_a_z hide">
                                <a href="javascript:void(0);">A</a>
                                <a href="javascript:void(0);">B</a>
                                <a href="javascript:void(0);">C</a>
                                <a href="javascript:void(0);">D</a>
                                <a href="javascript:void(0);">E</a>
                                <a href="javascript:void(0);">F</a>
                                <a href="javascript:void(0);">G</a>
                                <a href="javascript:void(0);">H</a>
                                <a href="javascript:void(0);">J</a>
                                <a href="javascript:void(0);">K</a>
                                <a href="javascript:void(0);">L</a>
                                <a href="javascript:void(0);">M</a>
                                <a href="javascript:void(0);">N</a>
                                <a href="javascript:void(0);">P</a>
                                <a href="javascript:void(0);">Q</a>
                                <a href="javascript:void(0);">R</a>
                                <a href="javascript:void(0);">S</a>
                                <a href="javascript:void(0);">T</a>
                                <a href="javascript:void(0);">W</a>
                                <a href="javascript:void(0);">X</a>
                                <a href="javascript:void(0);">Y</a>
                                <a href="javascript:void(0);">Z</a>
                                <a href="">直辖市</a>
                                <a href="">港澳台</a>
                        </div> -->
                 </div>
                 <!---按省份数据显示-->
                 <div class="city_province" style="display:block;">
                                                                <!--一般城市-->
                         <div class="city_province_item">
                               <dl>
                                    <dt>安徽</dt>
                                    <dd>
                                                                              <a href="/hefei.html">合肥</a>
                                                                              <a href="/wuhu.html">芜湖</a>
                                                                              <a href="/maanshan.html">马鞍山</a>
                                                                              <a href="/anqing.html">安庆</a>
                                                                              <a href="/bozhou.html">亳州</a>
                                                                              <a href="/bengbu.html">蚌埠</a>
                                                                              <a href="/chuzhou.html">滁州</a>
                                                                              <a href="/chaohu.html">巢湖</a>
                                                                              <a href="/chizhou.html">池州</a>
                                                                              <a href="/huaibei.html">淮北</a>
                                                                              <a href="/huainan.html">淮南</a>
                                                                              <a href="/huangshan.html">黄山</a>
                                                                              <a href="/huangshanfengjingqu.html">黄山风景区</a>
                                                                              <a href="/jiuhuashanfengjingqu.html">九华山风景区</a>
                                                                              <a href="/tongling.html">铜陵</a>
                                                                              <a href="/fuyangshi.html">阜阳</a>
                                                                              <a href="/suzhoushi.html">宿州</a>
                                                                              <a href="/xuancheng.html">宣城</a>
                                                                              <a href="/liuan.html">六安</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                                                                      <!--一般城市-->
                         <div class="city_province_item">
                               <dl>
                                    <dt>福建</dt>
                                    <dd>
                                                                              <a href="/xiamen.html">厦门</a>
                                                                              <a href="/quanzhou.html">泉州</a>
                                                                              <a href="/fuzhou.html">福州</a>
                                                                              <a href="/longyan.html">龙岩</a>
                                                                              <a href="/nanping.html">南平</a>
                                                                              <a href="/putian.html">莆田</a>
                                                                              <a href="/sanming.html">三明</a>
                                                                              <a href="/zhangzhou.html">漳州</a>
                                                                              <a href="/ningde.html">宁德</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                                                                      <!--一般城市-->
                         <div class="city_province_item">
                               <dl>
                                    <dt>广东</dt>
                                    <dd>
                                                                              <a href="/dongguan.html">东莞</a>
                                                                              <a href="/zhongshan.html">中山</a>
                                                                              <a href="/yunfu.html">云浮</a>
                                                                              <a href="/foshan.html">佛山</a>
                                                                              <a href="/guangzhou.html">广州</a>
                                                                              <a href="/huizhou.html">惠州</a>
                                                                              <a href="/jieyang.html">揭阳</a>
                                                                              <a href="/meizhou.html">梅州</a>
                                                                              <a href="/shantou.html">汕头</a>
                                                                              <a href="/shanwei.html">汕尾</a>
                                                                              <a href="/jiangmen.html">江门</a>
                                                                              <a href="/heyuan.html">河源</a>
                                                                              <a href="/shenzhen.html">深圳</a>
                                                                              <a href="/qingyuan.html">清远</a>
                                                                              <a href="/zhanjiang.html">湛江</a>
                                                                              <a href="/chaozhou.html">潮州</a>
                                                                              <a href="/zhuhai.html">珠海</a>
                                                                              <a href="/zhaoqing.html">肇庆</a>
                                                                              <a href="/maoming.html">茂名</a>
                                                                              <a href="/yangjiang.html">阳江</a>
                                                                              <a href="/shaoguan.html">韶关</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                               <!--一般城市-->
                         <div class="city_province_item">
                               <dl>
                                    <dt>甘肃</dt>
                                    <dd>
                                                                              <a href="/lanzhou.html">兰州</a>
                                                                              <a href="/jiayuguan.html">嘉峪关</a>
                                                                              <a href="/jinchang.html">金昌</a>
                                                                              <a href="/baiyin.html">白银</a>
                                                                              <a href="/tianshui.html">天水</a>
                                                                              <a href="/qingyang.html">庆阳</a>
                                                                              <a href="/pingliang.html">平凉</a>
                                                                              <a href="/longnan.html">陇南</a>
                                                                              <a href="/dingxi.html">定西</a>
                                                                              <a href="/wuwei.html">武威</a>
                                                                              <a href="/zhangye.html">张掖</a>
                                                                              <a href="/jiuquan.html">酒泉</a>
                                                                              <a href="/linxiazhou.html">临夏州</a>
                                                                              <a href="/gannanzhou.html">甘南州</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                               <!--一般城市-->
                         <div class="city_province_item">
                               <dl>
                                    <dt>广西</dt>
                                    <dd>
                                                                              <a href="/beihai.html">北海</a>
                                                                              <a href="/nanning.html">南宁</a>
                                                                              <a href="/liuzhou.html">柳州</a>
                                                                              <a href="/guilin.html">桂林</a>
                                                                              <a href="/chongzuo.html">崇左</a>
                                                                              <a href="/laibin.html">来宾</a>
                                                                              <a href="/hechi.html">河池</a>
                                                                              <a href="/hezhou.html">贺州</a>
                                                                              <a href="/baise.html">百色</a>
                                                                              <a href="/qinzhou.html">钦州</a>
                                                                              <a href="/guigang.html">贵港</a>
                                                                              <a href="/fangchenggang.html">防城港</a>
                                                                              <a href="/wuzhou.html">梧州</a>
                                                                              <a href="/yulinshi.html">玉林</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                               <!--一般城市-->
                         <div class="city_province_item">
                               <dl>
                                    <dt>贵州</dt>
                                    <dd>
                                                                              <a href="/guiyang.html">贵阳</a>
                                                                              <a href="/zunyi.html">遵义</a>
                                                                              <a href="/qiandongnanzhou.html">黔东南州</a>
                                                                              <a href="/qiannanzhou.html">黔南州</a>
                                                                              <a href="/qianxinanzhou.html">黔西南州</a>
                                                                              <a href="/bijie.html">毕节</a>
                                                                              <a href="/tongren.html">铜仁</a>
                                                                              <a href="/anshun.html">安顺</a>
                                                                              <a href="/liupanshui.html">六盘水</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                                                                      <!--一般城市-->
                         <div class="city_province_item">
                               <dl>
                                    <dt>海南</dt>
                                    <dd>
                                                                              <a href="/sanya.html">三亚</a>
                                                                              <a href="/haikou.html">海口</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                               <!--一般城市-->
                         <div class="city_province_item">
                               <dl>
                                    <dt>河南</dt>
                                    <dd>
                                                                              <a href="/sanmenxia.html">三门峡</a>
                                                                              <a href="/anyang.html">安阳</a>
                                                                              <a href="/pingdingshan.html">平顶山</a>
                                                                              <a href="/kaifeng.html">开封</a>
                                                                              <a href="/luoyang.html">洛阳</a>
                                                                              <a href="/jiaozuo.html">焦作</a>
                                                                              <a href="/zhengzhou.html">郑州</a>
                                                                              <a href="/hebi.html">鹤壁</a>
                                                                              <a href="/luohe.html">漯河</a>
                                                                              <a href="/nanyang.html">南阳</a>
                                                                              <a href="/puyang.html">濮阳</a>
                                                                              <a href="/shangqiu.html">商丘</a>
                                                                              <a href="/xinxiang.html">新乡</a>
                                                                              <a href="/xuchang.html">许昌</a>
                                                                              <a href="/xinyang.html">信阳</a>
                                                                              <a href="/zhoukou.html">周口</a>
                                                                              <a href="/zhumadian.html">驻马店</a>
                                                                              <a href="/jiyuan.html">济源</a>
                                                                              <a href="/gongyi.html">巩义</a>
                                                                              <a href="/lankaoxian.html">兰考县</a>
                                                                              <a href="/ruzhou.html">汝州</a>
                                                                              <a href="/huaxian.html">滑县</a>
                                                                              <a href="/changyuanxian.html">长垣县</a>
                                                                              <a href="/dengzhou.html">邓州</a>
                                                                              <a href="/gushixian.html">固始县</a>
                                                                              <a href="/luyixian.html">鹿邑县</a>
                                                                              <a href="/xincaixian.html">新蔡县</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                               <!--一般城市-->
                         <div class="city_province_item">
                               <dl>
                                    <dt>河北</dt>
                                    <dd>
                                                                              <a href="/baoding.html">保定</a>
                                                                              <a href="/tangshan.html">唐山</a>
                                                                              <a href="/langfang.html">廊坊</a>
                                                                              <a href="/zhangjiakou.html">张家口</a>
                                                                              <a href="/chengde.html">承德</a>
                                                                              <a href="/cangzhou.html">沧州</a>
                                                                              <a href="/shijiazhuang.html">石家庄</a>
                                                                              <a href="/qinhuangdao.html">秦皇岛</a>
                                                                              <a href="/hengshui.html">衡水</a>
                                                                              <a href="/xingtai.html">邢台</a>
                                                                              <a href="/handan.html">邯郸</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                               <!--一般城市-->
                         <div class="city_province_item">
                               <dl>
                                    <dt>黑龙江</dt>
                                    <dd>
                                                                              <a href="/haerbin.html">哈尔滨</a>
                                                                              <a href="/daqing.html">大庆</a>
                                                                              <a href="/mudanjiang.html">牡丹江</a>
                                                                              <a href="/qiqihaer.html">齐齐哈尔</a>
                                                                              <a href="/jixi.html">鸡西</a>
                                                                              <a href="/hegang.html">鹤岗</a>
                                                                              <a href="/shuangyashan.html">双鸭山</a>
                                                                              <a href="/jiamusi.html">佳木斯</a>
                                                                              <a href="/qitaihe.html">七台河</a>
                                                                              <a href="/heihe.html">黑河</a>
                                                                              <a href="/suihua.html">绥化</a>
                                                                              <a href="/daxinganling.html">大兴安岭</a>
                                                                              <a href="/yichunshi.html">伊春</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                               <!--一般城市-->
                         <div class="city_province_item">
                               <dl>
                                    <dt>湖北</dt>
                                    <dd>
                                                                              <a href="/yichang.html">宜昌</a>
                                                                              <a href="/wuhan.html">武汉</a>
                                                                              <a href="/jingzhou.html">荆州</a>
                                                                              <a href="/huanggang.html">黄冈</a>
                                                                              <a href="/suizhou.html">随州</a>
                                                                              <a href="/xiangyang.html">襄阳</a>
                                                                              <a href="/jingmen.html">荆门</a>
                                                                              <a href="/xiantao.html">仙桃</a>
                                                                              <a href="/qianjiang.html">潜江</a>
                                                                              <a href="/huangshi.html">黄石</a>
                                                                              <a href="/shiyan.html">十堰</a>
                                                                              <a href="/ezhou.html">鄂州</a>
                                                                              <a href="/xiaogan.html">孝感</a>
                                                                              <a href="/xianning.html">咸宁</a>
                                                                              <a href="/xiangfan.html">襄樊</a>
                                                                              <a href="/enshizhou.html">恩施州</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                               <!--一般城市-->
                         <div class="city_province_item">
                               <dl>
                                    <dt>湖南</dt>
                                    <dd>
                                                                              <a href="/yueyang.html">岳阳</a>
                                                                              <a href="/changde.html">常德</a>
                                                                              <a href="/zhangjiajie.html">张家界</a>
                                                                              <a href="/zhuzhou.html">株洲</a>
                                                                              <a href="/xiangtan.html">湘潭</a>
                                                                              <a href="/changsha.html">长沙</a>
                                                                              <a href="/xiangxizhou.html">湘西州</a>
                                                                              <a href="/loudi.html">娄底</a>
                                                                              <a href="/huaihua.html">怀化</a>
                                                                              <a href="/yongzhou.html">永州</a>
                                                                              <a href="/chenzhou.html">郴州</a>
                                                                              <a href="/yiyang.html">益阳</a>
                                                                              <a href="/shaoyang.html">邵阳</a>
                                                                              <a href="/hengyang.html">衡阳</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                                                                      <!--一般城市-->
                         <div class="city_province_item">
                               <dl>
                                    <dt>江西</dt>
                                    <dd>
                                                                              <a href="/jiujiang.html">九江</a>
                                                                              <a href="/nanchang.html">南昌</a>
                                                                              <a href="/fuzhoushi.html">抚州</a>
                                                                              <a href="/ganzhou.html">赣州</a>
                                                                              <a href="/jian.html">吉安</a>
                                                                              <a href="/jingdezhen.html">景德镇</a>
                                                                              <a href="/pingxiang.html">萍乡</a>
                                                                              <a href="/shangrao.html">上饶</a>
                                                                              <a href="/xinyu.html">新余</a>
                                                                              <a href="/yichun.html">宜春</a>
                                                                              <a href="/yingtan.html">鹰潭</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                               <!--一般城市-->
                         <div class="city_province_item">
                               <dl>
                                    <dt>江苏</dt>
                                    <dd>
                                                                              <a href="/nanjing.html">南京</a>
                                                                              <a href="/nantong.html">南通</a>
                                                                              <a href="/jurong.html">句容</a>
                                                                              <a href="/wujiang.html">吴江</a>
                                                                              <a href="/taicang.html">太仓</a>
                                                                              <a href="/yixing.html">宜兴</a>
                                                                              <a href="/suqian.html">宿迁</a>
                                                                              <a href="/changzhou.html">常州</a>
                                                                              <a href="/changshu.html">常熟</a>
                                                                              <a href="/zhangjiagang.html">张家港</a>
                                                                              <a href="/xuzhou.html">徐州</a>
                                                                              <a href="/yangzhou.html">扬州</a>
                                                                              <a href="/wuxi.html">无锡</a>
                                                                              <a href="/kunshan.html">昆山</a>
                                                                              <a href="/jiangyin.html">江阴</a>
                                                                              <a href="/taizhoushi.html">泰州</a>
                                                                              <a href="/haimen.html">海门</a>
                                                                              <a href="/huaian.html">淮安</a>
                                                                              <a href="/liyang.html">溧阳</a>
                                                                              <a href="/yancheng.html">盐城</a>
                                                                              <a href="/suzhou.html">苏州</a>
                                                                              <a href="/lianyungang.html">连云港</a>
                                                                              <a href="/jintan.html">金坛</a>
                                                                              <a href="/zhenjiang.html">镇江</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                               <!--一般城市-->
                         <div class="city_province_item">
                               <dl>
                                    <dt>吉林</dt>
                                    <dd>
                                                                              <a href="/jilin.html">吉林</a>
                                                                              <a href="/changchun.html">长春</a>
                                                                              <a href="/songyuan.html">松原</a>
                                                                              <a href="/liaoyuan.html">辽源</a>
                                                                              <a href="/siping.html">四平</a>
                                                                              <a href="/baishan.html">白山</a>
                                                                              <a href="/baicheng.html">白城</a>
                                                                              <a href="/yanbianzhou.html">延边州</a>
                                                                              <a href="/tonghua.html">通化</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                                                                      <!--一般城市-->
                         <div class="city_province_item">
                               <dl>
                                    <dt>辽宁</dt>
                                    <dd>
                                                                              <a href="/dandong.html">丹东</a>
                                                                              <a href="/dalian.html">大连</a>
                                                                              <a href="/fushun.html">抚顺</a>
                                                                              <a href="/benxi.html">本溪</a>
                                                                              <a href="/shenyang.html">沈阳</a>
                                                                              <a href="/wafangdian.html">瓦房店</a>
                                                                              <a href="/panjin.html">盘锦</a>
                                                                              <a href="/yingkou.html">营口</a>
                                                                              <a href="/huludao.html">葫芦岛</a>
                                                                              <a href="/jinzhou.html">锦州</a>
                                                                              <a href="/anshan.html">鞍山</a>
                                                                              <a href="/chaoyang.html">朝阳</a>
                                                                              <a href="/fuxin.html">阜新</a>
                                                                              <a href="/liaoyang.html">辽阳</a>
                                                                              <a href="/tieling.html">铁岭</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                                                                      <!--一般城市-->
                         <div class="city_province_item">
                               <dl>
                                    <dt>内蒙古</dt>
                                    <dd>
                                                                              <a href="/baotou.html">包头</a>
                                                                              <a href="/huhehaote.html">呼和浩特</a>
                                                                              <a href="/chifeng.html">赤峰</a>
                                                                              <a href="/eerduosi.html">鄂尔多斯</a>
                                                                              <a href="/bayannaoer.html">巴彦淖尔</a>
                                                                              <a href="/erlianhaote.html">二连浩特</a>
                                                                              <a href="/hulunbeier.html">呼伦贝尔</a>
                                                                              <a href="/tongliao.html">通辽</a>
                                                                              <a href="/wuhai.html">乌海</a>
                                                                              <a href="/wulanchabu.html">乌兰察布</a>
                                                                              <a href="/wulanhaote.html">乌兰浩特</a>
                                                                              <a href="/xilinhaote.html">锡林浩特</a>
                                                                              <a href="/bayanhaote.html">巴彦浩特</a>
                                                                              <a href="/manzhouli.html">满洲里</a>
                                                                              <a href="/alashanmeng.html">阿拉善盟</a>
                                                                              <a href="/xinganmeng.html">兴安盟</a>
                                                                              <a href="/xilinguolemeng.html">锡林郭勒盟</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                               <!--一般城市-->
                         <div class="city_province_item">
                               <dl>
                                    <dt>宁夏</dt>
                                    <dd>
                                                                              <a href="/shizuishan.html">石嘴山</a>
                                                                              <a href="/yinchuan.html">银川</a>
                                                                              <a href="/zhongwei.html">中卫</a>
                                                                              <a href="/wuzhong.html">吴忠</a>
                                                                              <a href="/guyuan.html">固原</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                                                                      <!--一般城市-->
                         <div class="city_province_item">
                               <dl>
                                    <dt>青海</dt>
                                    <dd>
                                                                              <a href="/xining.html">西宁</a>
                                                                              <a href="/hainanzhou.html">海南州</a>
                                                                              <a href="/huangnanzhou.html">黄南州</a>
                                                                              <a href="/haibeizhou.html">海北州</a>
                                                                              <a href="/haidong.html">海东</a>
                                                                              <a href="/guoluozhou.html">果洛州</a>
                                                                              <a href="/yushuzhou.html">玉树州</a>
                                                                              <a href="/haixizhou.html">海西州</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                                                                      <!--一般城市-->
                         <div class="city_province_item">
                               <dl>
                                    <dt>上海</dt>
                                    <dd>
                                                                              <a href="/shanghai.html">上海</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                               <!--一般城市-->
                         <div class="city_province_item">
                               <dl>
                                    <dt>山东</dt>
                                    <dd>
                                                                              <a href="/dongying.html">东营</a>
                                                                              <a href="/linyi.html">临沂</a>
                                                                              <a href="/rushan.html">乳山</a>
                                                                              <a href="/jimo.html">即墨</a>
                                                                              <a href="/weihai.html">威海</a>
                                                                              <a href="/shouguang.html">寿光</a>
                                                                              <a href="/pingdu.html">平度</a>
                                                                              <a href="/dezhou.html">德州</a>
                                                                              <a href="/zhaoyuan.html">招远</a>
                                                                              <a href="/wendeng.html">文登</a>
                                                                              <a href="/rizhao.html">日照</a>
                                                                              <a href="/zaozhuang.html">枣庄</a>
                                                                              <a href="/taian.html">泰安</a>
                                                                              <a href="/jinan.html">济南</a>
                                                                              <a href="/jining.html">济宁</a>
                                                                              <a href="/zibo.html">淄博</a>
                                                                              <a href="/binzhou.html">滨州</a>
                                                                              <a href="/weifang.html">潍坊</a>
                                                                              <a href="/yantai.html">烟台</a>
                                                                              <a href="/zhangqiu.html">章丘</a>
                                                                              <a href="/liaocheng.html">聊城</a>
                                                                              <a href="/jiaonan.html">胶南</a>
                                                                              <a href="/jiaozhou.html">胶州</a>
                                                                              <a href="/rongcheng.html">荣成</a>
                                                                              <a href="/laizhou.html">莱州</a>
                                                                              <a href="/laiwu.html">莱芜</a>
                                                                              <a href="/laixi.html">莱西</a>
                                                                              <a href="/heze.html">菏泽</a>
                                                                              <a href="/penglai.html">蓬莱</a>
                                                                              <a href="/qingdao.html">青岛</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                               <!--一般城市-->
                         <div class="city_province_item">
                               <dl>
                                    <dt>山西</dt>
                                    <dd>
                                                                              <a href="/linfen.html">临汾</a>
                                                                              <a href="/datong.html">大同</a>
                                                                              <a href="/taiyuan.html">太原</a>
                                                                              <a href="/changzhi.html">长治</a>
                                                                              <a href="/yangquan.html">阳泉</a>
                                                                              <a href="/jincheng.html">晋城</a>
                                                                              <a href="/jinzhong.html">晋中</a>
                                                                              <a href="/lvliang.html">吕梁</a>
                                                                              <a href="/shuozhou.html">朔州</a>
                                                                              <a href="/xinzhou.html">忻州</a>
                                                                              <a href="/yuncheng.html">运城</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                               <!--一般城市-->
                         <div class="city_province_item">
                               <dl>
                                    <dt>四川</dt>
                                    <dd>
                                                                              <a href="/nanchong.html">南充</a>
                                                                              <a href="/yibin.html">宜宾</a>
                                                                              <a href="/deyang.html">德阳</a>
                                                                              <a href="/chengdu.html">成都</a>
                                                                              <a href="/panzhihua.html">攀枝花</a>
                                                                              <a href="/luzhou.html">泸州</a>
                                                                              <a href="/mianyang.html">绵阳</a>
                                                                              <a href="/zigong.html">自贡</a>
                                                                              <a href="/bazhong.html">巴中</a>
                                                                              <a href="/dazhou.html">达州</a>
                                                                              <a href="/guangan.html">广安</a>
                                                                              <a href="/guangyuan.html">广元</a>
                                                                              <a href="/neijiang.html">内江</a>
                                                                              <a href="/suining.html">遂宁</a>
                                                                              <a href="/leshan.html">乐山</a>
                                                                              <a href="/yaan.html">雅安</a>
                                                                              <a href="/ziyang.html">资阳</a>
                                                                              <a href="/dujiangyan.html">都江堰</a>
                                                                              <a href="/maerkang.html">马尔康</a>
                                                                              <a href="/liangzhong.html">阆中</a>
                                                                              <a href="/emeishan.html">峨眉山</a>
                                                                              <a href="/meishan.html">眉山</a>
                                                                              <a href="/xichang.html">西昌</a>
                                                                              <a href="/kangding.html">康定</a>
                                                                              <a href="/jiangyou.html">江油</a>
                                                                              <a href="/liangshanzhou.html">凉山州</a>
                                                                              <a href="/ganzizhou.html">甘孜州</a>
                                                                              <a href="/abazhou.html">阿坝州</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                               <!--一般城市-->
                         <div class="city_province_item">
                               <dl>
                                    <dt>陕西</dt>
                                    <dd>
                                                                              <a href="/xianyang.html">咸阳</a>
                                                                              <a href="/baoji.html">宝鸡</a>
                                                                              <a href="/yanan.html">延安</a>
                                                                              <a href="/weinan.html">渭南</a>
                                                                              <a href="/xian.html">西安</a>
                                                                              <a href="/tongchuan.html">铜川</a>
                                                                              <a href="/hanzhong.html">汉中</a>
                                                                              <a href="/yulin.html">榆林</a>
                                                                              <a href="/ankang.html">安康</a>
                                                                              <a href="/shangluo.html">商洛</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                                                                      <!--一般城市-->
                         <div class="city_province_item">
                               <dl>
                                    <dt>新疆</dt>
                                    <dd>
                                                                              <a href="/wulumuqi.html">乌鲁木齐</a>
                                                                              <a href="/kelamayi.html">克拉玛依</a>
                                                                              <a href="/kuerle.html">库尔勒</a>
                                                                              <a href="/hetian.html">和田</a>
                                                                              <a href="/yining.html">伊宁</a>
                                                                              <a href="/tulufan.html">吐鲁番</a>
                                                                              <a href="/atushi.html">阿图什</a>
                                                                              <a href="/shihezi.html">石河子</a>
                                                                              <a href="/hami.html">哈密</a>
                                                                              <a href="/kuitun.html">奎屯</a>
                                                                              <a href="/fukang.html">阜康</a>
                                                                              <a href="/wujiaqu.html">五家渠</a>
                                                                              <a href="/wusu.html">乌苏</a>
                                                                              <a href="/beitun.html">北屯</a>
                                                                              <a href="/bozhoushi.html">博州</a>
                                                                              <a href="/aletai.html">阿勒泰</a>
                                                                              <a href="/tacheng.html">塔城</a>
                                                                              <a href="/yilihasakezhou.html">伊犁哈萨克州</a>
                                                                              <a href="/kashi.html">喀什</a>
                                                                              <a href="/kezilesuzhou.html">克孜勒苏州</a>
                                                                              <a href="/akesu.html">阿克苏</a>
                                                                              <a href="/changjizhou.html">昌吉州</a>
                                                                              <a href="/bole.html">博乐</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                               <!--一般城市-->
                         <div class="city_province_item">
                               <dl>
                                    <dt>西藏</dt>
                                    <dd>
                                                                              <a href="/lasa.html">拉萨</a>
                                                                              <a href="/changdu.html">昌都</a>
                                                                              <a href="/naqu.html">那曲</a>
                                                                              <a href="/shannan.html">山南</a>
                                                                              <a href="/linzhi.html">林芝</a>
                                                                              <a href="/ali.html">阿里</a>
                                                                              <a href="/rikaze.html">日喀则</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                                                                      <!--一般城市-->
                         <div class="city_province_item">
                               <dl>
                                    <dt>云南</dt>
                                    <dd>
                                                                              <a href="/kunming.html">昆明</a>
                                                                              <a href="/qujing.html">曲靖</a>
                                                                              <a href="/yuxi.html">玉溪</a>
                                                                              <a href="/baoshan.html">保山</a>
                                                                              <a href="/chuxiongzhou.html">楚雄州</a>
                                                                              <a href="/dalizhou.html">大理州</a>
                                                                              <a href="/lijiang.html">丽江</a>
                                                                              <a href="/lincang.html">临沧</a>
                                                                              <a href="/zhaotong.html">昭通</a>
                                                                              <a href="/wenshanzhou.html">文山州</a>
                                                                              <a href="/mengzi.html">蒙自</a>
                                                                              <a href="/jinghong.html">景洪</a>
                                                                              <a href="/luxi.html">潞西</a>
                                                                              <a href="/liuku.html">六库</a>
                                                                              <a href="/xianggelila.html">香格里拉</a>
                                                                              <a href="/diqingzhou.html">迪庆州</a>
                                                                              <a href="/nujiangzhou.html">怒江州</a>
                                                                              <a href="/dehongzhou.html">德宏州</a>
                                                                              <a href="/xishuangbannazhou.html">西双版纳州</a>
                                                                              <a href="/honghezhou.html">红河州</a>
                                                                              <a href="/simao.html">思茅</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                                                                      <!--一般城市-->
                         <div class="city_province_item">
                               <dl>
                                    <dt>浙江</dt>
                                    <dd>
                                                                              <a href="/linan.html">临安</a>
                                                                              <a href="/lishui.html">丽水</a>
                                                                              <a href="/yiwu.html">义乌</a>
                                                                              <a href="/taizhou.html">台州</a>
                                                                              <a href="/jiaxing.html">嘉兴</a>
                                                                              <a href="/ningbo.html">宁波</a>
                                                                              <a href="/fuyang.html">富阳</a>
                                                                              <a href="/hangzhou.html">杭州</a>
                                                                              <a href="/wenzhou.html">温州</a>
                                                                              <a href="/huzhou.html">湖州</a>
                                                                              <a href="/shaoxing.html">绍兴</a>
                                                                              <a href="/zhoushan.html">舟山</a>
                                                                              <a href="/quzhou.html">衢州</a>
                                                                              <a href="/zhuji.html">诸暨</a>
                                                                              <a href="/jinhua.html">金华</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                                          <!--直辖市和港澳台是特殊的没有字母的形式-->
                   <div class="city_province_item city_province_special">
                         <dl>
                              <dt class="">直辖市</dt>
                              
                              <dd>
                                    <a href="/beijing.html">北京</a>
                                    <a href="/tianjin.html">天津</a>
                                    <a href="/shanghai.html">上海</a>
                                    <a href="/chongqing.html">重庆</a>
                              </dd>
                         </dl>
                         <div class="clear"></div>
                   </div>
                   <div class="city_province_item city_province_special">
                         <dl>
                              
                              <dt class="">港澳台</dt>
                              <dd>
                                                                  <a href="/xianggang.html">香港</a>
                                                                  <a href="/aomen.html">澳门</a>
                                                                  <a href="/xinbei.html">新北</a>
                                                                  <a href="/taibei.html">台北</a>
                                                                  <a href="/taoyuan.html">桃园</a>
                                                                  <a href="/xinzhu.html">新竹</a>
                                                                  <a href="/miaoli.html">苗栗</a>
                                                                  <a href="/taizhong.html">台中</a>
                                                                  <a href="/zhanghua.html">彰化</a>
                                                                  <a href="/nantou.html">南投</a>
                                                                  <a href="/yunlin.html">云林</a>
                                                                  <a href="/jiayixian.html">嘉义</a>
                                                                  <a href="/jiayi.html">嘉義</a>
                                                                  <a href="/tainan.html">台南</a>
                                                                  <a href="/gaoxiong.html">高雄</a>
                                                                  <a href="/pingdong.html">屏东</a>
                                                                  <a href="/taidong.html">台东</a>
                                                                  <a href="/hualian.html">花莲</a>
                                                                  <a href="/yilan.html">宜兰</a>
                                                                  <a href="/jinmen.html">金门</a>
                                                                  <a href="/penghu.html">澎湖</a>
                                                                  <a href="/jilong.html">基隆</a>
                                                            </dd>
                         </dl>
                         <div class="clear"></div>
                   </div>
                 </div>

               <!--按字母搜所有城市，后边增加个类"city_citys"-->
               <div class="city_province city_citys">
                         <!--一般城市-->
                                                  <div class="city_province_item">
                               <dl>
                                    
                                  <dt class="cpi_capital">A</dt>
                                    <dd>
                                                                              <a href="/anyang.html">安阳</a>
                                                                              <a href="/anshan.html">鞍山</a>
                                                                              <a href="/anqing.html">安庆</a>
                                                                              <a href="/atushi.html">阿图什</a>
                                                                              <a href="/aletai.html">阿勒泰</a>
                                                                              <a href="/alashanmeng.html">阿拉善盟</a>
                                                                              <a href="/akesu.html">阿克苏</a>
                                                                              <a href="/ankang.html">安康</a>
                                                                              <a href="/ali.html">阿里</a>
                                                                              <a href="/anshun.html">安顺</a>
                                                                              <a href="/abazhou.html">阿坝州</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                                  <div class="city_province_item">
                               <dl>
                                    
                                  <dt class="cpi_capital">B</dt>
                                    <dd>
                                                                              <a href="/baoding.html">保定</a>
                                                                              <a href="/baotou.html">包头</a>
                                                                              <a href="/beijing.html">北京</a>
                                                                              <a href="/beihai.html">北海</a>
                                                                              <a href="/baoji.html">宝鸡</a>
                                                                              <a href="/benxi.html">本溪</a>
                                                                              <a href="/binzhou.html">滨州</a>
                                                                              <a href="/bozhou.html">亳州</a>
                                                                              <a href="/bengbu.html">蚌埠</a>
                                                                              <a href="/bazhong.html">巴中</a>
                                                                              <a href="/baoshan.html">保山</a>
                                                                              <a href="/bayannaoer.html">巴彦淖尔</a>
                                                                              <a href="/baiyin.html">白银</a>
                                                                              <a href="/beitun.html">北屯</a>
                                                                              <a href="/bozhoushi.html">博州</a>
                                                                              <a href="/bayanhaote.html">巴彦浩特</a>
                                                                              <a href="/baishan.html">白山</a>
                                                                              <a href="/baicheng.html">白城</a>
                                                                              <a href="/bijie.html">毕节</a>
                                                                              <a href="/baise.html">百色</a>
                                                                              <a href="/bole.html">博乐</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                                  <div class="city_province_item">
                               <dl>
                                    
                                  <dt class="cpi_capital">C</dt>
                                    <dd>
                                                                              <a href="/changzhou.html">常州</a>
                                                                              <a href="/changde.html">常德</a>
                                                                              <a href="/changshu.html">常熟</a>
                                                                              <a href="/chengdu.html">成都</a>
                                                                              <a href="/chengde.html">承德</a>
                                                                              <a href="/cangzhou.html">沧州</a>
                                                                              <a href="/chaozhou.html">潮州</a>
                                                                              <a href="/chifeng.html">赤峰</a>
                                                                              <a href="/chongqing.html">重庆</a>
                                                                              <a href="/changchun.html">长春</a>
                                                                              <a href="/changsha.html">长沙</a>
                                                                              <a href="/changzhi.html">长治</a>
                                                                              <a href="/chaoyang.html">朝阳</a>
                                                                              <a href="/chuzhou.html">滁州</a>
                                                                              <a href="/chaohu.html">巢湖</a>
                                                                              <a href="/chizhou.html">池州</a>
                                                                              <a href="/chuxiongzhou.html">楚雄州</a>
                                                                              <a href="/changdu.html">昌都</a>
                                                                              <a href="/changyuanxian.html">长垣县</a>
                                                                              <a href="/changjizhou.html">昌吉州</a>
                                                                              <a href="/chongzuo.html">崇左</a>
                                                                              <a href="/chenzhou.html">郴州</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                                  <div class="city_province_item">
                               <dl>
                                    
                                  <dt class="cpi_capital">D</dt>
                                    <dd>
                                                                              <a href="/dongguan.html">东莞</a>
                                                                              <a href="/dongying.html">东营</a>
                                                                              <a href="/dandong.html">丹东</a>
                                                                              <a href="/datong.html">大同</a>
                                                                              <a href="/daqing.html">大庆</a>
                                                                              <a href="/dalian.html">大连</a>
                                                                              <a href="/dezhou.html">德州</a>
                                                                              <a href="/deyang.html">德阳</a>
                                                                              <a href="/dazhou.html">达州</a>
                                                                              <a href="/dalizhou.html">大理州</a>
                                                                              <a href="/dingxi.html">定西</a>
                                                                              <a href="/dujiangyan.html">都江堰</a>
                                                                              <a href="/dengzhou.html">邓州</a>
                                                                              <a href="/daxinganling.html">大兴安岭</a>
                                                                              <a href="/diqingzhou.html">迪庆州</a>
                                                                              <a href="/dehongzhou.html">德宏州</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                                  <div class="city_province_item">
                               <dl>
                                    
                                  <dt class="cpi_capital">E</dt>
                                    <dd>
                                                                              <a href="/eerduosi.html">鄂尔多斯</a>
                                                                              <a href="/erlianhaote.html">二连浩特</a>
                                                                              <a href="/emeishan.html">峨眉山</a>
                                                                              <a href="/ezhou.html">鄂州</a>
                                                                              <a href="/enshizhou.html">恩施州</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                                  <div class="city_province_item">
                               <dl>
                                    
                                  <dt class="cpi_capital">F</dt>
                                    <dd>
                                                                              <a href="/foshan.html">佛山</a>
                                                                              <a href="/fuyang.html">富阳</a>
                                                                              <a href="/fushun.html">抚顺</a>
                                                                              <a href="/fuzhou.html">福州</a>
                                                                              <a href="/fuxin.html">阜新</a>
                                                                              <a href="/fuzhoushi.html">抚州</a>
                                                                              <a href="/fuyangshi.html">阜阳</a>
                                                                              <a href="/fukang.html">阜康</a>
                                                                              <a href="/fangchenggang.html">防城港</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                                  <div class="city_province_item">
                               <dl>
                                    
                                  <dt class="cpi_capital">G</dt>
                                    <dd>
                                                                              <a href="/guangzhou.html">广州</a>
                                                                              <a href="/guilin.html">桂林</a>
                                                                              <a href="/guiyang.html">贵阳</a>
                                                                              <a href="/guangan.html">广安</a>
                                                                              <a href="/guangyuan.html">广元</a>
                                                                              <a href="/ganzhou.html">赣州</a>
                                                                              <a href="/gannanzhou.html">甘南州</a>
                                                                              <a href="/gongyi.html">巩义</a>
                                                                              <a href="/gushixian.html">固始县</a>
                                                                              <a href="/guoluozhou.html">果洛州</a>
                                                                              <a href="/guyuan.html">固原</a>
                                                                              <a href="/ganzizhou.html">甘孜州</a>
                                                                              <a href="/guigang.html">贵港</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                                  <div class="city_province_item">
                               <dl>
                                    
                                  <dt class="cpi_capital">H</dt>
                                    <dd>
                                                                              <a href="/hefei.html">合肥</a>
                                                                              <a href="/huhehaote.html">呼和浩特</a>
                                                                              <a href="/haerbin.html">哈尔滨</a>
                                                                              <a href="/huizhou.html">惠州</a>
                                                                              <a href="/hangzhou.html">杭州</a>
                                                                              <a href="/heyuan.html">河源</a>
                                                                              <a href="/haikou.html">海口</a>
                                                                              <a href="/haimen.html">海门</a>
                                                                              <a href="/huaian.html">淮安</a>
                                                                              <a href="/huzhou.html">湖州</a>
                                                                              <a href="/heze.html">菏泽</a>
                                                                              <a href="/huludao.html">葫芦岛</a>
                                                                              <a href="/hengshui.html">衡水</a>
                                                                              <a href="/handan.html">邯郸</a>
                                                                              <a href="/hainanzhou.html">海南州</a>
                                                                              <a href="/huaibei.html">淮北</a>
                                                                              <a href="/huainan.html">淮南</a>
                                                                              <a href="/huangshan.html">黄山</a>
                                                                              <a href="/huangshanfengjingqu.html">黄山风景区</a>
                                                                              <a href="/hebi.html">鹤壁</a>
                                                                              <a href="/huanggang.html">黄冈</a>
                                                                              <a href="/hulunbeier.html">呼伦贝尔</a>
                                                                              <a href="/hetian.html">和田</a>
                                                                              <a href="/huangnanzhou.html">黄南州</a>
                                                                              <a href="/haibeizhou.html">海北州</a>
                                                                              <a href="/hami.html">哈密</a>
                                                                              <a href="/huaxian.html">滑县</a>
                                                                              <a href="/huangshi.html">黄石</a>
                                                                              <a href="/hegang.html">鹤岗</a>
                                                                              <a href="/haidong.html">海东</a>
                                                                              <a href="/heihe.html">黑河</a>
                                                                              <a href="/hanzhong.html">汉中</a>
                                                                              <a href="/haixizhou.html">海西州</a>
                                                                              <a href="/honghezhou.html">红河州</a>
                                                                              <a href="/hechi.html">河池</a>
                                                                              <a href="/hezhou.html">贺州</a>
                                                                              <a href="/huaihua.html">怀化</a>
                                                                              <a href="/hengyang.html">衡阳</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                                  <div class="city_province_item">
                               <dl>
                                    
                                  <dt class="cpi_capital">J</dt>
                                    <dd>
                                                                              <a href="/jiujiang.html">九江</a>
                                                                              <a href="/jimo.html">即墨</a>
                                                                              <a href="/jurong.html">句容</a>
                                                                              <a href="/jilin.html">吉林</a>
                                                                              <a href="/jiaxing.html">嘉兴</a>
                                                                              <a href="/jiayuguan.html">嘉峪关</a>
                                                                              <a href="/jieyang.html">揭阳</a>
                                                                              <a href="/jiangmen.html">江门</a>
                                                                              <a href="/jiangyin.html">江阴</a>
                                                                              <a href="/jinan.html">济南</a>
                                                                              <a href="/jining.html">济宁</a>
                                                                              <a href="/jiaozuo.html">焦作</a>
                                                                              <a href="/jiaonan.html">胶南</a>
                                                                              <a href="/jiaozhou.html">胶州</a>
                                                                              <a href="/jingzhou.html">荆州</a>
                                                                              <a href="/jinhua.html">金华</a>
                                                                              <a href="/jintan.html">金坛</a>
                                                                              <a href="/jinchang.html">金昌</a>
                                                                              <a href="/jinzhou.html">锦州</a>
                                                                              <a href="/jincheng.html">晋城</a>
                                                                              <a href="/jinzhong.html">晋中</a>
                                                                              <a href="/jiuhuashanfengjingqu.html">九华山风景区</a>
                                                                              <a href="/jian.html">吉安</a>
                                                                              <a href="/jingdezhen.html">景德镇</a>
                                                                              <a href="/jiuquan.html">酒泉</a>
                                                                              <a href="/jixi.html">鸡西</a>
                                                                              <a href="/jiangyou.html">江油</a>
                                                                              <a href="/jiyuan.html">济源</a>
                                                                              <a href="/jinghong.html">景洪</a>
                                                                              <a href="/jingmen.html">荆门</a>
                                                                              <a href="/jiamusi.html">佳木斯</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                                  <div class="city_province_item">
                               <dl>
                                    
                                  <dt class="cpi_capital">K</dt>
                                    <dd>
                                                                              <a href="/kelamayi.html">克拉玛依</a>
                                                                              <a href="/kuerle.html">库尔勒</a>
                                                                              <a href="/kaifeng.html">开封</a>
                                                                              <a href="/kunshan.html">昆山</a>
                                                                              <a href="/kunming.html">昆明</a>
                                                                              <a href="/kuitun.html">奎屯</a>
                                                                              <a href="/kangding.html">康定</a>
                                                                              <a href="/kashi.html">喀什</a>
                                                                              <a href="/kezilesuzhou.html">克孜勒苏州</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                                  <div class="city_province_item">
                               <dl>
                                    
                                  <dt class="cpi_capital">L</dt>
                                    <dd>
                                                                              <a href="/linan.html">临安</a>
                                                                              <a href="/linfen.html">临汾</a>
                                                                              <a href="/linyi.html">临沂</a>
                                                                              <a href="/lishui.html">丽水</a>
                                                                              <a href="/lanzhou.html">兰州</a>
                                                                              <a href="/langfang.html">廊坊</a>
                                                                              <a href="/lasa.html">拉萨</a>
                                                                              <a href="/liuzhou.html">柳州</a>
                                                                              <a href="/luzhou.html">泸州</a>
                                                                              <a href="/luoyang.html">洛阳</a>
                                                                              <a href="/liyang.html">溧阳</a>
                                                                              <a href="/liaocheng.html">聊城</a>
                                                                              <a href="/laizhou.html">莱州</a>
                                                                              <a href="/laiwu.html">莱芜</a>
                                                                              <a href="/laixi.html">莱西</a>
                                                                              <a href="/lianyungang.html">连云港</a>
                                                                              <a href="/longyan.html">龙岩</a>
                                                                              <a href="/lvliang.html">吕梁</a>
                                                                              <a href="/liaoyang.html">辽阳</a>
                                                                              <a href="/luohe.html">漯河</a>
                                                                              <a href="/lijiang.html">丽江</a>
                                                                              <a href="/lincang.html">临沧</a>
                                                                              <a href="/leshan.html">乐山</a>
                                                                              <a href="/longnan.html">陇南</a>
                                                                              <a href="/linxiazhou.html">临夏州</a>
                                                                              <a href="/liaoyuan.html">辽源</a>
                                                                              <a href="/liuan.html">六安</a>
                                                                              <a href="/liangzhong.html">阆中</a>
                                                                              <a href="/lankaoxian.html">兰考县</a>
                                                                              <a href="/luyixian.html">鹿邑县</a>
                                                                              <a href="/luxi.html">潞西</a>
                                                                              <a href="/liuku.html">六库</a>
                                                                              <a href="/linzhi.html">林芝</a>
                                                                              <a href="/liupanshui.html">六盘水</a>
                                                                              <a href="/liangshanzhou.html">凉山州</a>
                                                                              <a href="/laibin.html">来宾</a>
                                                                              <a href="/loudi.html">娄底</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                                  <div class="city_province_item">
                               <dl>
                                    
                                  <dt class="cpi_capital">M</dt>
                                    <dd>
                                                                              <a href="/meizhou.html">梅州</a>
                                                                              <a href="/mudanjiang.html">牡丹江</a>
                                                                              <a href="/mianyang.html">绵阳</a>
                                                                              <a href="/maoming.html">茂名</a>
                                                                              <a href="/maanshan.html">马鞍山</a>
                                                                              <a href="/manzhouli.html">满洲里</a>
                                                                              <a href="/maerkang.html">马尔康</a>
                                                                              <a href="/meishan.html">眉山</a>
                                                                              <a href="/mengzi.html">蒙自</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                                  <div class="city_province_item">
                               <dl>
                                    
                                  <dt class="cpi_capital">N</dt>
                                    <dd>
                                                                              <a href="/nanjing.html">南京</a>
                                                                              <a href="/nanchong.html">南充</a>
                                                                              <a href="/nanning.html">南宁</a>
                                                                              <a href="/nanchang.html">南昌</a>
                                                                              <a href="/nantong.html">南通</a>
                                                                              <a href="/ningbo.html">宁波</a>
                                                                              <a href="/neijiang.html">内江</a>
                                                                              <a href="/nanyang.html">南阳</a>
                                                                              <a href="/naqu.html">那曲</a>
                                                                              <a href="/nanping.html">南平</a>
                                                                              <a href="/ningde.html">宁德</a>
                                                                              <a href="/nujiangzhou.html">怒江州</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                                  <div class="city_province_item">
                               <dl>
                                    
                                  <dt class="cpi_capital">P</dt>
                                    <dd>
                                                                              <a href="/pingdu.html">平度</a>
                                                                              <a href="/pingdingshan.html">平顶山</a>
                                                                              <a href="/panzhihua.html">攀枝花</a>
                                                                              <a href="/panjin.html">盘锦</a>
                                                                              <a href="/penglai.html">蓬莱</a>
                                                                              <a href="/pingxiang.html">萍乡</a>
                                                                              <a href="/puyang.html">濮阳</a>
                                                                              <a href="/putian.html">莆田</a>
                                                                              <a href="/pingliang.html">平凉</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                                  <div class="city_province_item">
                               <dl>
                                    
                                  <dt class="cpi_capital">Q</dt>
                                    <dd>
                                                                              <a href="/qujing.html">曲靖</a>
                                                                              <a href="/quanzhou.html">泉州</a>
                                                                              <a href="/qingyuan.html">清远</a>
                                                                              <a href="/qinhuangdao.html">秦皇岛</a>
                                                                              <a href="/quzhou.html">衢州</a>
                                                                              <a href="/qingdao.html">青岛</a>
                                                                              <a href="/qiqihaer.html">齐齐哈尔</a>
                                                                              <a href="/qingyang.html">庆阳</a>
                                                                              <a href="/qianjiang.html">潜江</a>
                                                                              <a href="/qitaihe.html">七台河</a>
                                                                              <a href="/qiandongnanzhou.html">黔东南州</a>
                                                                              <a href="/qiannanzhou.html">黔南州</a>
                                                                              <a href="/qianxinanzhou.html">黔西南州</a>
                                                                              <a href="/qinzhou.html">钦州</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                                  <div class="city_province_item">
                               <dl>
                                    
                                  <dt class="cpi_capital">R</dt>
                                    <dd>
                                                                              <a href="/rushan.html">乳山</a>
                                                                              <a href="/rizhao.html">日照</a>
                                                                              <a href="/rongcheng.html">荣成</a>
                                                                              <a href="/ruzhou.html">汝州</a>
                                                                              <a href="/rikaze.html">日喀则</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                                  <div class="city_province_item">
                               <dl>
                                    
                                  <dt class="cpi_capital">S</dt>
                                    <dd>
                                                                              <a href="/sanya.html">三亚</a>
                                                                              <a href="/sanmenxia.html">三门峡</a>
                                                                              <a href="/shanghai.html">上海</a>
                                                                              <a href="/suqian.html">宿迁</a>
                                                                              <a href="/shouguang.html">寿光</a>
                                                                              <a href="/shantou.html">汕头</a>
                                                                              <a href="/shanwei.html">汕尾</a>
                                                                              <a href="/shenyang.html">沈阳</a>
                                                                              <a href="/shenzhen.html">深圳</a>
                                                                              <a href="/shizuishan.html">石嘴山</a>
                                                                              <a href="/shijiazhuang.html">石家庄</a>
                                                                              <a href="/shaoxing.html">绍兴</a>
                                                                              <a href="/suzhou.html">苏州</a>
                                                                              <a href="/shaoguan.html">韶关</a>
                                                                              <a href="/shuozhou.html">朔州</a>
                                                                              <a href="/suzhoushi.html">宿州</a>
                                                                              <a href="/suining.html">遂宁</a>
                                                                              <a href="/shangrao.html">上饶</a>
                                                                              <a href="/shangqiu.html">商丘</a>
                                                                              <a href="/suizhou.html">随州</a>
                                                                              <a href="/sanming.html">三明</a>
                                                                              <a href="/songyuan.html">松原</a>
                                                                              <a href="/shihezi.html">石河子</a>
                                                                              <a href="/shannan.html">山南</a>
                                                                              <a href="/shiyan.html">十堰</a>
                                                                              <a href="/siping.html">四平</a>
                                                                              <a href="/shuangyashan.html">双鸭山</a>
                                                                              <a href="/suihua.html">绥化</a>
                                                                              <a href="/shangluo.html">商洛</a>
                                                                              <a href="/simao.html">思茅</a>
                                                                              <a href="/shaoyang.html">邵阳</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                                  <div class="city_province_item">
                               <dl>
                                    
                                  <dt class="cpi_capital">T</dt>
                                    <dd>
                                                                              <a href="/taizhou.html">台州</a>
                                                                              <a href="/tangshan.html">唐山</a>
                                                                              <a href="/tianjin.html">天津</a>
                                                                              <a href="/taicang.html">太仓</a>
                                                                              <a href="/taiyuan.html">太原</a>
                                                                              <a href="/taian.html">泰安</a>
                                                                              <a href="/taizhoushi.html">泰州</a>
                                                                              <a href="/tongchuan.html">铜川</a>
                                                                              <a href="/tongling.html">铜陵</a>
                                                                              <a href="/tieling.html">铁岭</a>
                                                                              <a href="/tongliao.html">通辽</a>
                                                                              <a href="/tianshui.html">天水</a>
                                                                              <a href="/tulufan.html">吐鲁番</a>
                                                                              <a href="/tacheng.html">塔城</a>
                                                                              <a href="/tonghua.html">通化</a>
                                                                              <a href="/tongren.html">铜仁</a>
                                                                              <a href="/tanggu.html">塘沽</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                                  <div class="city_province_item">
                               <dl>
                                    
                                  <dt class="cpi_capital">W</dt>
                                    <dd>
                                                                              <a href="/wulumuqi.html">乌鲁木齐</a>
                                                                              <a href="/wujiang.html">吴江</a>
                                                                              <a href="/weihai.html">威海</a>
                                                                              <a href="/wendeng.html">文登</a>
                                                                              <a href="/wuxi.html">无锡</a>
                                                                              <a href="/wuhan.html">武汉</a>
                                                                              <a href="/wenzhou.html">温州</a>
                                                                              <a href="/weinan.html">渭南</a>
                                                                              <a href="/weifang.html">潍坊</a>
                                                                              <a href="/wafangdian.html">瓦房店</a>
                                                                              <a href="/wuhu.html">芜湖</a>
                                                                              <a href="/wenshanzhou.html">文山州</a>
                                                                              <a href="/wuhai.html">乌海</a>
                                                                              <a href="/wuwei.html">武威</a>
                                                                              <a href="/wujiaqu.html">五家渠</a>
                                                                              <a href="/wusu.html">乌苏</a>
                                                                              <a href="/wulanchabu.html">乌兰察布</a>
                                                                              <a href="/wulanhaote.html">乌兰浩特</a>
                                                                              <a href="/wuzhong.html">吴忠</a>
                                                                              <a href="/wuzhou.html">梧州</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                                  <div class="city_province_item">
                               <dl>
                                    
                                  <dt class="cpi_capital">X</dt>
                                    <dd>
                                                                              <a href="/xiamen.html">厦门</a>
                                                                              <a href="/xianyang.html">咸阳</a>
                                                                              <a href="/xuzhou.html">徐州</a>
                                                                              <a href="/xiangtan.html">湘潭</a>
                                                                              <a href="/xining.html">西宁</a>
                                                                              <a href="/xian.html">西安</a>
                                                                              <a href="/xingtai.html">邢台</a>
                                                                              <a href="/xuancheng.html">宣城</a>
                                                                              <a href="/xinzhou.html">忻州</a>
                                                                              <a href="/xinyu.html">新余</a>
                                                                              <a href="/xinxiang.html">新乡</a>
                                                                              <a href="/xuchang.html">许昌</a>
                                                                              <a href="/xinyang.html">信阳</a>
                                                                              <a href="/xilinhaote.html">锡林浩特</a>
                                                                              <a href="/xichang.html">西昌</a>
                                                                              <a href="/xincaixian.html">新蔡县</a>
                                                                              <a href="/xianggelila.html">香格里拉</a>
                                                                              <a href="/xiangyang.html">襄阳</a>
                                                                              <a href="/xiantao.html">仙桃</a>
                                                                              <a href="/xiaogan.html">孝感</a>
                                                                              <a href="/xianning.html">咸宁</a>
                                                                              <a href="/xiangfan.html">襄樊</a>
                                                                              <a href="/xishuangbannazhou.html">西双版纳州</a>
                                                                              <a href="/xiangxizhou.html">湘西州</a>
                                                                              <a href="/xinganmeng.html">兴安盟</a>
                                                                              <a href="/xilinguolemeng.html">锡林郭勒盟</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                                  <div class="city_province_item">
                               <dl>
                                    
                                  <dt class="cpi_capital">Y</dt>
                                    <dd>
                                                                              <a href="/yiwu.html">义乌</a>
                                                                              <a href="/yunfu.html">云浮</a>
                                                                              <a href="/yixing.html">宜兴</a>
                                                                              <a href="/yibin.html">宜宾</a>
                                                                              <a href="/yichang.html">宜昌</a>
                                                                              <a href="/yueyang.html">岳阳</a>
                                                                              <a href="/yanan.html">延安</a>
                                                                              <a href="/yangzhou.html">扬州</a>
                                                                              <a href="/yantai.html">烟台</a>
                                                                              <a href="/yuxi.html">玉溪</a>
                                                                              <a href="/yancheng.html">盐城</a>
                                                                              <a href="/yingkou.html">营口</a>
                                                                              <a href="/yinchuan.html">银川</a>
                                                                              <a href="/yangjiang.html">阳江</a>
                                                                              <a href="/yangquan.html">阳泉</a>
                                                                              <a href="/yuncheng.html">运城</a>
                                                                              <a href="/yaan.html">雅安</a>
                                                                              <a href="/yichun.html">宜春</a>
                                                                              <a href="/yingtan.html">鹰潭</a>
                                                                              <a href="/yining.html">伊宁</a>
                                                                              <a href="/yanbianzhou.html">延边州</a>
                                                                              <a href="/yilihasakezhou.html">伊犁哈萨克州</a>
                                                                              <a href="/yulin.html">榆林</a>
                                                                              <a href="/yushuzhou.html">玉树州</a>
                                                                              <a href="/yongzhou.html">永州</a>
                                                                              <a href="/yiyang.html">益阳</a>
                                                                              <a href="/yulinshi.html">玉林</a>
                                                                              <a href="/yichunshi.html">伊春</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                                  <div class="city_province_item">
                               <dl>
                                    
                                  <dt class="cpi_capital">Z</dt>
                                    <dd>
                                                                              <a href="/zhongshan.html">中山</a>
                                                                              <a href="/zhangjiakou.html">张家口</a>
                                                                              <a href="/zhangjiagang.html">张家港</a>
                                                                              <a href="/zhangjiajie.html">张家界</a>
                                                                              <a href="/zhaoyuan.html">招远</a>
                                                                              <a href="/zaozhuang.html">枣庄</a>
                                                                              <a href="/zhuzhou.html">株洲</a>
                                                                              <a href="/zibo.html">淄博</a>
                                                                              <a href="/zhanjiang.html">湛江</a>
                                                                              <a href="/zhuhai.html">珠海</a>
                                                                              <a href="/zhangqiu.html">章丘</a>
                                                                              <a href="/zhaoqing.html">肇庆</a>
                                                                              <a href="/zigong.html">自贡</a>
                                                                              <a href="/zhoushan.html">舟山</a>
                                                                              <a href="/zhuji.html">诸暨</a>
                                                                              <a href="/zunyi.html">遵义</a>
                                                                              <a href="/zhengzhou.html">郑州</a>
                                                                              <a href="/zhenjiang.html">镇江</a>
                                                                              <a href="/zhaotong.html">昭通</a>
                                                                              <a href="/ziyang.html">资阳</a>
                                                                              <a href="/zhoukou.html">周口</a>
                                                                              <a href="/zhumadian.html">驻马店</a>
                                                                              <a href="/zhangye.html">张掖</a>
                                                                              <a href="/zhangzhou.html">漳州</a>
                                                                              <a href="/zhongwei.html">中卫</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                                                  <!--直辖市和港澳台是特殊的没有字母的形式-->
                         <div class="city_province_item city_province_special">
                               <dl>
                                    
                                <dt class="">直辖市</dt>
                                    <dd>
                                          <a href="/beijing.html">北京</a>
                                          <a href="/tianjin.html">天津</a>
                                          <a href="/shanghai.html">上海</a>
                                          <a href="/chongqing.html">重庆</a>
                                    </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                         <div class="city_province_item city_province_special">
                               <dl>
                                    
                                <dt class="">港澳台</dt>
                                    <dd>
                                                                              <a href="/xianggang.html">香港</a>
                                                                              <a href="/aomen.html">澳门</a>
                                                                              <a href="/xinbei.html">新北</a>
                                                                              <a href="/taibei.html">台北</a>
                                                                              <a href="/taoyuan.html">桃园</a>
                                                                              <a href="/xinzhu.html">新竹</a>
                                                                              <a href="/miaoli.html">苗栗</a>
                                                                              <a href="/taizhong.html">台中</a>
                                                                              <a href="/zhanghua.html">彰化</a>
                                                                              <a href="/nantou.html">南投</a>
                                                                              <a href="/yunlin.html">云林</a>
                                                                              <a href="/jiayixian.html">嘉义</a>
                                                                              <a href="/jiayi.html">嘉義</a>
                                                                              <a href="/tainan.html">台南</a>
                                                                              <a href="/gaoxiong.html">高雄</a>
                                                                              <a href="/pingdong.html">屏东</a>
                                                                              <a href="/taidong.html">台东</a>
                                                                              <a href="/hualian.html">花莲</a>
                                                                              <a href="/yilan.html">宜兰</a>
                                                                              <a href="/jinmen.html">金门</a>
                                                                              <a href="/penghu.html">澎湖</a>
                                                                              <a href="/jilong.html">基隆</a>
                                                                        </dd>
                               </dl>
                               <div class="clear"></div>
                         </div>
                 </div>
    </div>
  </div>
</div>

<script>
seajs.use(['$', 'tabs', 'cookie', 'tinyscrollbar', 'autocomplete'], function($, Tabs, Cookie){

  $(document).ready(function(){
    new Tabs({
        element: '.minicity',
        triggers: '.city_control_tab a',
        triggerType: 'click',
        activeTriggerClass: 'city_control_current',
        panels: '.city_province',
        activeIndex: 0
    });

    $('.tab_pc').click(function(){
      $('.pc_a_z').show();
      $('.fc_a_z').hide();
    });

    $('.tab_fc').click(function(){
      $('.pc_a_z').hide();
      $('.fc_a_z').show();
    });

    $('.minicity_clk').click(function(){
      $('.minicity').animate({right:0}, 'slow');
    });
    $('.mt_close').click(function(){
      $('.minicity').animate({right:'-900px'}, 'slow');
    });

    var h = $(window).height()-132;if(h<0)h=0;
    $(".viewport").css('height',h);
    $('#scrollbar1').tinyscrollbar();

    window.onresize = function(){
      var h = $(window).height()-132;if(h<0)h=0;
      $(".viewport").css('height',h);
      $(".scrollbar").css('height',h);
      $(".track").css('height',h);
      $('#scrollbar1').tinyscrollbar();
    }

    $('.city_citys').addClass('hide');

    var cities = [{"value":"\u4e09\u4e9a","data":"sanya","fl":"SY"},{"value":"\u4e09\u95e8\u5ce1","data":"sanmenxia","fl":"SMX"},{"value":"\u4e0a\u6d77","data":"shanghai","fl":"SH"},{"value":"\u4e1c\u839e","data":"dongguan","fl":"dg"},{"value":"\u4e1c\u8425","data":"dongying","fl":"DY"},{"value":"\u4e2d\u5c71","data":"zhongshan","fl":"ZS"},{"value":"\u4e34\u5b89","data":"linan","fl":"LA"},{"value":"\u4e34\u6c7e","data":"linfen","fl":"LF"},{"value":"\u4e34\u6c82","data":"linyi","fl":"LY"},{"value":"\u4e39\u4e1c","data":"dandong","fl":"DD"},{"value":"\u4e3d\u6c34","data":"lishui","fl":"LS"},{"value":"\u4e49\u4e4c","data":"yiwu","fl":"YW"},{"value":"\u4e4c\u9c81\u6728\u9f50","data":"wulumuqi","fl":"WLMQ"},{"value":"\u4e5d\u6c5f","data":"jiujiang","fl":"JJ"},{"value":"\u4e73\u5c71","data":"rushan","fl":"RS"},{"value":"\u4e91\u6d6e","data":"yunfu","fl":"YF"},{"value":"\u4f5b\u5c71","data":"foshan","fl":"FS"},{"value":"\u4fdd\u5b9a","data":"baoding","fl":"BD"},{"value":"\u514b\u62c9\u739b\u4f9d","data":"kelamayi","fl":"KLMY"},{"value":"\u5170\u5dde","data":"lanzhou","fl":"LZ"},{"value":"\u5305\u5934","data":"baotou","fl":"BT"},{"value":"\u5317\u4eac","data":"beijing","fl":"BJ"},{"value":"\u5317\u6d77","data":"beihai","fl":"BH"},{"value":"\u5357\u4eac","data":"nanjing","fl":"NJ"},{"value":"\u5357\u5145","data":"nanchong","fl":"NC"},{"value":"\u5357\u5b81","data":"nanning","fl":"NN"},{"value":"\u5357\u660c","data":"nanchang","fl":"NC"},{"value":"\u5357\u901a","data":"nantong","fl":"NT"},{"value":"\u5373\u58a8","data":"jimo","fl":"JM"},{"value":"\u53a6\u95e8","data":"xiamen","fl":"XM"},{"value":"\u53e5\u5bb9","data":"jurong","fl":"JR"},{"value":"\u53f0\u5dde","data":"taizhou","fl":"TZ"},{"value":"\u5408\u80a5","data":"hefei","fl":"HF"},{"value":"\u5409\u6797","data":"jilin","fl":"JL"},{"value":"\u5434\u6c5f","data":"wujiang","fl":"WJ"},{"value":"\u547c\u548c\u6d69\u7279","data":"huhehaote","fl":"HHHT"},{"value":"\u54b8\u9633","data":"xianyang","fl":"XY"},{"value":"\u54c8\u5c14\u6ee8","data":"haerbin","fl":"HEB"},{"value":"\u5510\u5c71","data":"tangshan","fl":"TS"},{"value":"\u5609\u5174","data":"jiaxing","fl":"JX"},{"value":"\u5609\u5cea\u5173","data":"jiayuguan","fl":"JYG"},{"value":"\u5927\u540c","data":"datong","fl":"DT"},{"value":"\u5927\u5e86","data":"daqing","fl":"DQ"},{"value":"\u5927\u8fde","data":"dalian","fl":"DL"},{"value":"\u5929\u6d25","data":"tianjin","fl":"TJ"},{"value":"\u592a\u4ed3","data":"taicang","fl":"TC"},{"value":"\u592a\u539f","data":"taiyuan","fl":"TY"},{"value":"\u5a01\u6d77","data":"weihai","fl":"WH"},{"value":"\u5b81\u6ce2","data":"ningbo","fl":"NB"},{"value":"\u5b89\u9633","data":"anyang","fl":"AY"},{"value":"\u5b9c\u5174","data":"yixing","fl":"YX"},{"value":"\u5b9c\u5bbe","data":"yibin","fl":"YB"},{"value":"\u5b9c\u660c","data":"yichang","fl":"YC"},{"value":"\u5b9d\u9e21","data":"baoji","fl":"BJ"},{"value":"\u5bbf\u8fc1","data":"suqian","fl":"SQ"},{"value":"\u5bcc\u9633","data":"fuyang","fl":"FY"},{"value":"\u5bff\u5149","data":"shouguang","fl":"SG"},{"value":"\u5cb3\u9633","data":"yueyang","fl":"YY"},{"value":"\u5e38\u5dde","data":"changzhou","fl":"CZ"},{"value":"\u5e38\u5fb7","data":"changde","fl":"CD"},{"value":"\u5e38\u719f","data":"changshu","fl":"CS"},{"value":"\u5e73\u5ea6","data":"pingdu","fl":"PD"},{"value":"\u5e73\u9876\u5c71","data":"pingdingshan","fl":"PDS"},{"value":"\u5e7f\u5dde","data":"guangzhou","fl":"GZ"},{"value":"\u5e93\u5c14\u52d2","data":"kuerle","fl":"KEL"},{"value":"\u5eca\u574a","data":"langfang","fl":"LF"},{"value":"\u5ef6\u5b89","data":"yanan","fl":"YA"},{"value":"\u5f00\u5c01","data":"kaifeng","fl":"KF"},{"value":"\u5f20\u5bb6\u53e3","data":"zhangjiakou","fl":"ZJK"},{"value":"\u5f20\u5bb6\u6e2f","data":"zhangjiagang","fl":"ZJG"},{"value":"\u5f20\u5bb6\u754c","data":"zhangjiajie","fl":"ZJJ"},{"value":"\u5f90\u5dde","data":"xuzhou","fl":"XZ"},{"value":"\u5fb7\u5dde","data":"dezhou","fl":"DZ"},{"value":"\u5fb7\u9633","data":"deyang","fl":"DY"},{"value":"\u60e0\u5dde","data":"huizhou","fl":"HZ"},{"value":"\u6210\u90fd","data":"chengdu","fl":"CD"},{"value":"\u626c\u5dde","data":"yangzhou","fl":"YZ"},{"value":"\u627f\u5fb7","data":"chengde","fl":"CD"},{"value":"\u629a\u987a","data":"fushun","fl":"FS"},{"value":"\u62c9\u8428","data":"lasa","fl":"LS"},{"value":"\u62db\u8fdc","data":"zhaoyuan","fl":"ZY"},{"value":"\u63ed\u9633","data":"jieyang","fl":"JY"},{"value":"\u6500\u679d\u82b1","data":"panzhihua","fl":"PZH"},{"value":"\u6587\u767b","data":"wendeng","fl":"WD"},{"value":"\u65e0\u9521","data":"wuxi","fl":"WX"},{"value":"\u65e5\u7167","data":"rizhao","fl":"RZ"},{"value":"\u6606\u5c71","data":"kunshan","fl":"KS"},{"value":"\u6606\u660e","data":"kunming","fl":"KM"},{"value":"\u66f2\u9756","data":"qujing","fl":"QJ"},{"value":"\u672c\u6eaa","data":"benxi","fl":"BX"},{"value":"\u676d\u5dde","data":"hangzhou","fl":"HZ"},{"value":"\u67a3\u5e84","data":"zaozhuang","fl":"ZZ"},{"value":"\u67f3\u5dde","data":"liuzhou","fl":"LZ"},{"value":"\u682a\u6d32","data":"zhuzhou","fl":"ZZ"},{"value":"\u6842\u6797","data":"guilin","fl":"GL"},{"value":"\u6885\u5dde","data":"meizhou","fl":"MZ"},{"value":"\u6b66\u6c49","data":"wuhan","fl":"WH"},{"value":"\u6c55\u5934","data":"shantou","fl":"ST"},{"value":"\u6c55\u5c3e","data":"shanwei","fl":"SW"},{"value":"\u6c5f\u95e8","data":"jiangmen","fl":"JM"},{"value":"\u6c5f\u9634","data":"jiangyin","fl":"JY"},{"value":"\u6c88\u9633","data":"shenyang","fl":"SY"},{"value":"\u6ca7\u5dde","data":"cangzhou","fl":"CZ"},{"value":"\u6cb3\u6e90","data":"heyuan","fl":"HY"},{"value":"\u6cc9\u5dde","data":"quanzhou","fl":"QZ"},{"value":"\u6cf0\u5b89","data":"taian","fl":"TA"},{"value":"\u6cf0\u5dde","data":"taizhoushi","fl":"tz"},{"value":"\u6cf8\u5dde","data":"luzhou","fl":"LZ"},{"value":"\u6d1b\u9633","data":"luoyang","fl":"LY"},{"value":"\u6d4e\u5357","data":"jinan","fl":"JN"},{"value":"\u6d4e\u5b81","data":"jining","fl":"JN"},{"value":"\u6d77\u53e3","data":"haikou","fl":"HK"},{"value":"\u6d77\u95e8","data":"haimen","fl":"HM"},{"value":"\u6dc4\u535a","data":"zibo","fl":"ZB"},{"value":"\u6dee\u5b89","data":"huaian","fl":"HA"},{"value":"\u6df1\u5733","data":"shenzhen","fl":"SZ"},{"value":"\u6e05\u8fdc","data":"qingyuan","fl":"QY"},{"value":"\u6e29\u5dde","data":"wenzhou","fl":"WZ"},{"value":"\u6e2d\u5357","data":"weinan","fl":"WN"},{"value":"\u6e56\u5dde","data":"huzhou","fl":"HZ"},{"value":"\u6e58\u6f6d","data":"xiangtan","fl":"XT"},{"value":"\u6e5b\u6c5f","data":"zhanjiang","fl":"ZJ"},{"value":"\u6ea7\u9633","data":"liyang","fl":"LY"},{"value":"\u6ee8\u5dde","data":"binzhou","fl":"BZ"},{"value":"\u6f4d\u574a","data":"weifang","fl":"WF"},{"value":"\u6f6e\u5dde","data":"chaozhou","fl":"CZ"},{"value":"\u70df\u53f0","data":"yantai","fl":"YT"},{"value":"\u7126\u4f5c","data":"jiaozuo","fl":"JZ"},{"value":"\u7261\u4e39\u6c5f","data":"mudanjiang","fl":"MDJ"},{"value":"\u7389\u6eaa","data":"yuxi","fl":"YX"},{"value":"\u73e0\u6d77","data":"zhuhai","fl":"ZH"},{"value":"\u74e6\u623f\u5e97","data":"wafangdian","fl":"WFD"},{"value":"\u76d0\u57ce","data":"yancheng","fl":"YC"},{"value":"\u76d8\u9526","data":"panjin","fl":"PJ"},{"value":"\u77f3\u5634\u5c71","data":"shizuishan","fl":"SZS"},{"value":"\u77f3\u5bb6\u5e84","data":"shijiazhuang","fl":"SJZ"},{"value":"\u798f\u5dde","data":"fuzhou","fl":"FZ"},{"value":"\u79e6\u7687\u5c9b","data":"qinhuangdao","fl":"QHD"},{"value":"\u7ae0\u4e18","data":"zhangqiu","fl":"ZQ"},{"value":"\u7ecd\u5174","data":"shaoxing","fl":"SX"},{"value":"\u7ef5\u9633","data":"mianyang","fl":"MY"},{"value":"\u804a\u57ce","data":"liaocheng","fl":"LC"},{"value":"\u8087\u5e86","data":"zhaoqing","fl":"ZQ"},{"value":"\u80f6\u5357","data":"jiaonan","fl":"JN"},{"value":"\u80f6\u5dde","data":"jiaozhou","fl":"JZ"},{"value":"\u81ea\u8d21","data":"zigong","fl":"ZG"},{"value":"\u821f\u5c71","data":"zhoushan","fl":"ZS"},{"value":"\u829c\u6e56","data":"wuhu","fl":"WH"},{"value":"\u82cf\u5dde","data":"suzhou","fl":"SZ"},{"value":"\u8302\u540d","data":"maoming","fl":"MM"},{"value":"\u8346\u5dde","data":"jingzhou","fl":"JZ"},{"value":"\u8363\u6210","data":"rongcheng","fl":"RC"},{"value":"\u83b1\u5dde","data":"laizhou","fl":"LZ"},{"value":"\u83b1\u829c","data":"laiwu","fl":"LW"},{"value":"\u83b1\u897f","data":"laixi","fl":"LX"},{"value":"\u83cf\u6cfd","data":"heze","fl":"HZ"},{"value":"\u8425\u53e3","data":"yingkou","fl":"YK"},{"value":"\u846b\u82a6\u5c9b","data":"huludao","fl":"HLD"},{"value":"\u84ec\u83b1","data":"penglai","fl":"PL"},{"value":"\u8861\u6c34","data":"hengshui","fl":"HS"},{"value":"\u8862\u5dde","data":"quzhou","fl":"QZ"},{"value":"\u897f\u5b81","data":"xining","fl":"XN"},{"value":"\u897f\u5b89","data":"xian","fl":"XA"},{"value":"\u8bf8\u66a8","data":"zhuji","fl":"ZJ"},{"value":"\u8d35\u9633","data":"guiyang","fl":"GY"},{"value":"\u8d64\u5cf0","data":"chifeng","fl":"CF"},{"value":"\u8fde\u4e91\u6e2f","data":"lianyungang","fl":"LYG"},{"value":"\u9075\u4e49","data":"zunyi","fl":"ZY"},{"value":"\u90a2\u53f0","data":"xingtai","fl":"XT"},{"value":"\u90af\u90f8","data":"handan","fl":"HD"},{"value":"\u90d1\u5dde","data":"zhengzhou","fl":"ZZ"},{"value":"\u9102\u5c14\u591a\u65af","data":"eerduosi","fl":"EEDS"},{"value":"\u91cd\u5e86","data":"chongqing","fl":"CQ"},{"value":"\u91d1\u534e","data":"jinhua","fl":"JH"},{"value":"\u91d1\u575b","data":"jintan","fl":"JT"},{"value":"\u91d1\u660c","data":"jinchang","fl":"JC"},{"value":"\u94dc\u5ddd","data":"tongchuan","fl":"TC"},{"value":"\u94f6\u5ddd","data":"yinchuan","fl":"YC"},{"value":"\u9526\u5dde","data":"jinzhou","fl":"JZ"},{"value":"\u9547\u6c5f","data":"zhenjiang","fl":"ZJ"},{"value":"\u957f\u6625","data":"changchun","fl":"CC"},{"value":"\u957f\u6c99","data":"changsha","fl":"CS"},{"value":"\u957f\u6cbb","data":"changzhi","fl":"CZ"},{"value":"\u9633\u6c5f","data":"yangjiang","fl":"YJ"},{"value":"\u9633\u6cc9","data":"yangquan","fl":"YQ"},{"value":"\u9752\u5c9b","data":"qingdao","fl":"QD"},{"value":"\u978d\u5c71","data":"anshan","fl":"AS"},{"value":"\u97f6\u5173","data":"shaoguan","fl":"SG"},{"value":"\u9a6c\u978d\u5c71","data":"maanshan","fl":"MAS"},{"value":"\u9f50\u9f50\u54c8\u5c14","data":"qiqihaer","fl":"QQHE"},{"value":"\u5b89\u5e86","data":"anqing","fl":"aq"},{"value":"\u6d77\u5357\u5dde","data":"hainanzhou","fl":"hnz"},{"value":"\u4eb3\u5dde","data":"bozhou","fl":"bz"},{"value":"\u868c\u57e0","data":"bengbu","fl":"bb"},{"value":"\u5df4\u4e2d","data":"bazhong","fl":"bz"},{"value":"\u4fdd\u5c71","data":"baoshan","fl":"BS"},{"value":"\u5df4\u5f66\u6dd6\u5c14","data":"bayannaoer","fl":"byne"},{"value":"\u671d\u9633","data":"chaoyang","fl":"cy"},{"value":"\u6ec1\u5dde","data":"chuzhou","fl":"cz"},{"value":"\u6c60\u5dde","data":"chizhou","fl":"cz"},{"value":"\u695a\u96c4\u5dde","data":"chuxiongzhou","fl":"cxz"},{"value":"\u660c\u90fd","data":"changdu","fl":"cd"},{"value":"\u8fbe\u5dde","data":"dazhou","fl":"dz"},{"value":"\u5927\u7406\u5dde","data":"dalizhou","fl":"dlz"},{"value":"\u961c\u65b0","data":"fuxin","fl":"fx"},{"value":"\u9f99\u5ca9","data":"longyan","fl":"ly"},{"value":"\u629a\u5dde","data":"fuzhoushi","fl":"FS"},{"value":"\u5e7f\u5b89","data":"guangan","fl":"ga"},{"value":"\u5e7f\u5143","data":"guangyuan","fl":"gy"},{"value":"\u8d63\u5dde","data":"ganzhou","fl":"GZ"},{"value":"\u6dee\u5317","data":"huaibei","fl":"hb"},{"value":"\u6dee\u5357","data":"huainan","fl":"hn"},{"value":"\u9ec4\u5c71","data":"huangshan","fl":"hs"},{"value":"\u9e64\u58c1","data":"hebi","fl":"hb"},{"value":"\u9ec4\u5188","data":"huanggang","fl":"hg"},{"value":"\u547c\u4f26\u8d1d\u5c14","data":"hulunbeier","fl":"HLBE"},{"value":"\u664b\u57ce","data":"jincheng","fl":"JC"},{"value":"\u664b\u4e2d","data":"jinzhong","fl":"JZ"},{"value":"\u5409\u5b89","data":"jian","fl":"JA"},{"value":"\u666f\u5fb7\u9547","data":"jingdezhen","fl":"JDZ"},{"value":"\u5415\u6881","data":"lvliang","fl":"LL"},{"value":"\u8fbd\u9633","data":"liaoyang","fl":"ly"},{"value":"\u5185\u6c5f","data":"neijiang","fl":"nj"},{"value":"\u94dc\u9675","data":"tongling","fl":"tl"},{"value":"\u6f2f\u6cb3","data":"luohe","fl":"LH"},{"value":"\u4e3d\u6c5f","data":"lijiang","fl":"LJ"},{"value":"\u4e34\u6ca7","data":"lincang","fl":"LC"},{"value":"\u961c\u9633","data":"fuyangshi","fl":"fys"},{"value":"\u5357\u9633","data":"nanyang","fl":"ny"},{"value":"\u90a3\u66f2","data":"naqu","fl":"nq"},{"value":"\u5357\u5e73","data":"nanping","fl":"np"},{"value":"\u840d\u4e61","data":"pingxiang","fl":"PX"},{"value":"\u6fee\u9633","data":"puyang","fl":"py"},{"value":"\u8386\u7530","data":"putian","fl":"PT"},{"value":"\u6714\u5dde","data":"shuozhou","fl":"sz"},{"value":"\u5bbf\u5dde","data":"suzhoushi","fl":"szs"},{"value":"\u9042\u5b81","data":"suining","fl":"sn"},{"value":"\u4e0a\u9976","data":"shangrao","fl":"SR"},{"value":"\u5546\u4e18","data":"shangqiu","fl":"sq"},{"value":"\u968f\u5dde","data":"suizhou","fl":"sz"},{"value":"\u662d\u901a","data":"zhaotong","fl":"ZT"},{"value":"\u4e09\u660e","data":"sanming","fl":"SM"},{"value":"\u94c1\u5cad","data":"tieling","fl":"tl"},{"value":"\u4e50\u5c71","data":"leshan","fl":"ls"},{"value":"\u901a\u8fbd","data":"tongliao","fl":"TL"},{"value":"\u6587\u5c71\u5dde","data":"wenshanzhou","fl":"wsz"},{"value":"\u4e4c\u6d77","data":"wuhai","fl":"wh"},{"value":"\u5ba3\u57ce","data":"xuancheng","fl":"xc"},{"value":"\u5ffb\u5dde","data":"xinzhou","fl":"XZ"},{"value":"\u65b0\u4f59","data":"xinyu","fl":"XY"},{"value":"\u65b0\u4e61","data":"xinxiang","fl":"xx"},{"value":"\u8bb8\u660c","data":"xuchang","fl":"xc"},{"value":"\u4fe1\u9633","data":"xinyang","fl":"xy"},{"value":"\u8fd0\u57ce","data":"yuncheng","fl":"yc"},{"value":"\u96c5\u5b89","data":"yaan","fl":"ya"},{"value":"\u5b9c\u6625","data":"yichun","fl":"YC"},{"value":"\u9e70\u6f6d","data":"yingtan","fl":"YT"},{"value":"\u8d44\u9633","data":"ziyang","fl":"zy"},{"value":"\u5468\u53e3","data":"zhoukou","fl":"zk"},{"value":"\u9a7b\u9a6c\u5e97","data":"zhumadian","fl":"zmd"},{"value":"\u9999\u6e2f","data":"xianggang","fl":"XG"},{"value":"\u65b0\u5317","data":"xinbei","fl":"XB"},{"value":"\u53f0\u5317","data":"taibei","fl":"TB"},{"value":"\u6843\u56ed","data":"taoyuan","fl":"TY"},{"value":"\u65b0\u7af9","data":"xinzhu","fl":"XZ"},{"value":"\u82d7\u6817","data":"miaoli","fl":"ML"},{"value":"\u53f0\u4e2d","data":"taizhong","fl":"TZ"},{"value":"\u5f70\u5316","data":"zhanghua","fl":"ZH"},{"value":"\u5357\u6295","data":"nantou","fl":"NT"},{"value":"\u4e91\u6797","data":"yunlin","fl":"YL"},{"value":"\u5609\u4e49","data":"jiayixian","fl":"JYX"},{"value":"\u5609\u7fa9","data":"jiayi","fl":"JY"},{"value":"\u53f0\u5357","data":"tainan","fl":"TN"},{"value":"\u9ad8\u96c4","data":"gaoxiong","fl":"GX"},{"value":"\u5c4f\u4e1c","data":"pingdong","fl":"PD"},{"value":"\u53f0\u4e1c","data":"taidong","fl":"TD"},{"value":"\u82b1\u83b2","data":"hualian","fl":"HL"},{"value":"\u5b9c\u5170","data":"yilan","fl":"YL"},{"value":"\u91d1\u95e8","data":"jinmen","fl":"JM"},{"value":"\u6f8e\u6e56","data":"penghu","fl":"PH"},{"value":"\u57fa\u9686","data":"jilong","fl":"JL"},{"value":"\u767d\u94f6","data":"baiyin","fl":"BY"},{"value":"\u5929\u6c34","data":"tianshui","fl":"TS"},{"value":"\u5e86\u9633","data":"qingyang","fl":"QY"},{"value":"\u5e73\u51c9","data":"pingliang","fl":"pl"},{"value":"\u9647\u5357","data":"longnan","fl":"ln"},{"value":"\u5b9a\u897f","data":"dingxi","fl":"dx"},{"value":"\u6b66\u5a01","data":"wuwei","fl":"ww"},{"value":"\u5f20\u6396","data":"zhangye","fl":"zy"},{"value":"\u9152\u6cc9","data":"jiuquan","fl":"jq"},{"value":"\u4e34\u590f\u5dde","data":"linxiazhou","fl":"lxz"},{"value":"\u7518\u5357\u5dde","data":"gannanzhou","fl":"GN"},{"value":"\u548c\u7530","data":"hetian","fl":"ht"},{"value":"\u9ec4\u5357\u5dde","data":"huangnanzhou","fl":"hnz"},{"value":"\u9e21\u897f","data":"jixi","fl":"jx"},{"value":"\u5410\u9c81\u756a","data":"tulufan","fl":"tlf"},{"value":"\u677e\u539f","data":"songyuan","fl":"sy"},{"value":"\u77f3\u6cb3\u5b50","data":"shihezi","fl":"shz"},{"value":"\u6d77\u5317\u5dde","data":"haibeizhou","fl":"hbz"},{"value":"\u54c8\u5bc6","data":"hami","fl":"hm"},{"value":"\u4e94\u5bb6\u6e20","data":"wujiaqu","fl":"wjq"},{"value":"\u535a\u5dde","data":"bozhoushi","fl":"bzs"},{"value":"\u8fbd\u6e90","data":"liaoyuan","fl":"ly"},{"value":"\u4e4c\u5170\u5bdf\u5e03","data":"wulanchabu","fl":"ulcb"},{"value":"\u516d\u5b89","data":"liuan","fl":"la"},{"value":"\u7709\u5c71","data":"meishan","fl":"ms"},{"value":"\u6f33\u5dde","data":"zhangzhou","fl":"ZZ"},{"value":"\u5b81\u5fb7","data":"ningde","fl":"ND"},{"value":"\u5c71\u5357","data":"shannan","fl":"sn"},{"value":"\u8346\u95e8","data":"jingmen","fl":"jm"},{"value":"\u9ec4\u77f3","data":"huangshi","fl":"hs"},{"value":"\u5341\u5830","data":"shiyan","fl":"sy"},{"value":"\u9102\u5dde","data":"ezhou","fl":"ez"},{"value":"\u5b5d\u611f","data":"xiaogan","fl":"xg"},{"value":"\u54b8\u5b81","data":"xianning","fl":"xn"},{"value":"\u6797\u829d","data":"linzhi","fl":"lz"},{"value":"\u4e2d\u536b","data":"zhongwei","fl":"zw"},{"value":"\u963f\u52d2\u6cf0","data":"aletai","fl":"alt"},{"value":"\u56db\u5e73","data":"siping","fl":"sp"},{"value":"\u963f\u62c9\u5584\u76df","data":"alashanmeng","fl":"alsm"},{"value":"\u767d\u5c71","data":"baishan","fl":"bs"},{"value":"\u5854\u57ce","data":"tacheng","fl":"tc"},{"value":"\u767d\u57ce","data":"baicheng","fl":"bc"},{"value":"\u5ef6\u8fb9\u5dde","data":"yanbianzhou","fl":"ybz"},{"value":"\u4f0a\u7281\u54c8\u8428\u514b\u5dde","data":"yilihasakezhou","fl":"ylhskz"},{"value":"\u5580\u4ec0","data":"kashi","fl":"ks"},{"value":"\u9e64\u5c97","data":"hegang","fl":"hg"},{"value":"\u53cc\u9e2d\u5c71","data":"shuangyashan","fl":"sys"},{"value":"\u514b\u5b5c\u52d2\u82cf\u5dde","data":"kezilesuzhou","fl":"kzlsz"},{"value":"\u963f\u514b\u82cf","data":"akesu","fl":"aks"},{"value":"\u4f73\u6728\u65af","data":"jiamusi","fl":"jms"},{"value":"\u6d77\u4e1c","data":"haidong","fl":"hd"},{"value":"\u4e03\u53f0\u6cb3","data":"qitaihe","fl":"qth"},{"value":"\u9ed1\u6cb3","data":"heihe","fl":"hh"},{"value":"\u7ee5\u5316","data":"suihua","fl":"sh"},{"value":"\u5927\u5174\u5b89\u5cad","data":"daxinganling","fl":"dxal"},{"value":"\u8944\u6a0a","data":"xiangfan","fl":"xf"},{"value":"\u6c49\u4e2d","data":"hanzhong","fl":"hz"},{"value":"\u6986\u6797","data":"yulin","fl":"yl"},{"value":"\u5b89\u5eb7","data":"ankang","fl":"ak"},{"value":"\u5546\u6d1b","data":"shangluo","fl":"sl"},{"value":"\u963f\u91cc","data":"ali","fl":"al"},{"value":"\u65e5\u5580\u5219","data":"rikaze","fl":"rkz"},{"value":"\u679c\u6d1b\u5dde","data":"guoluozhou","fl":"glz"},{"value":"\u7389\u6811\u5dde","data":"yushuzhou","fl":"ysz"},{"value":"\u6d77\u897f\u5dde","data":"haixizhou","fl":"hxz"},{"value":"\u5434\u5fe0","data":"wuzhong","fl":"wz"},{"value":"\u901a\u5316","data":"tonghua","fl":"th"},{"value":"\u56fa\u539f","data":"guyuan","fl":"gy"},{"value":"\u660c\u5409\u5dde","data":"changjizhou","fl":"cjz"},{"value":"\u9ed4\u4e1c\u5357\u5dde","data":"qiandongnanzhou","fl":"qdnz"},{"value":"\u8fea\u5e86\u5dde","data":"diqingzhou","fl":"dqz"},{"value":"\u6012\u6c5f\u5dde","data":"nujiangzhou","fl":"njz"},{"value":"\u5fb7\u5b8f\u5dde","data":"dehongzhou","fl":"dhz"},{"value":"\u897f\u53cc\u7248\u7eb3\u5dde","data":"xishuangbannazhou","fl":"xsbnz"},{"value":"\u7ea2\u6cb3\u5dde","data":"honghezhou","fl":"hhz"},{"value":"\u601d\u8305","data":"simao","fl":"sm"},{"value":"\u9ed4\u5357\u5dde","data":"qiannanzhou","fl":"qnz"},{"value":"\u9ed4\u897f\u5357\u5dde","data":"qianxinanzhou","fl":"qxnz"},{"value":"\u6bd5\u8282","data":"bijie","fl":"bj"},{"value":"\u94dc\u4ec1","data":"tongren","fl":"tr"},{"value":"\u5b89\u987a","data":"anshun","fl":"as"},{"value":"\u6069\u65bd\u5dde","data":"enshizhou","fl":"esz"},{"value":"\u516d\u76d8\u6c34","data":"liupanshui","fl":"lps"},{"value":"\u51c9\u5c71\u5dde","data":"liangshanzhou","fl":"lsz"},{"value":"\u7518\u5b5c\u5dde","data":"ganzizhou","fl":"gzz"},{"value":"\u963f\u575d\u5dde","data":"abazhou","fl":"abz"},{"value":"\u5d07\u5de6","data":"chongzuo","fl":"cz"},{"value":"\u6765\u5bbe","data":"laibin","fl":"lb"},{"value":"\u6cb3\u6c60","data":"hechi","fl":"hc"},{"value":"\u8d3a\u5dde","data":"hezhou","fl":"hz"},{"value":"\u767e\u8272","data":"baise","fl":"bs"},{"value":"\u94a6\u5dde","data":"qinzhou","fl":"qz"},{"value":"\u8d35\u6e2f","data":"guigang","fl":"gg"},{"value":"\u9632\u57ce\u6e2f","data":"fangchenggang","fl":"fcg"},{"value":"\u68a7\u5dde","data":"wuzhou","fl":"wz"},{"value":"\u6e58\u897f\u5dde","data":"xiangxizhou","fl":"xxz"},{"value":"\u5a04\u5e95","data":"loudi","fl":"ld"},{"value":"\u6000\u5316","data":"huaihua","fl":"hh"},{"value":"\u6c38\u5dde","data":"yongzhou","fl":"yz"},{"value":"\u90f4\u5dde","data":"chenzhou","fl":"cz"},{"value":"\u76ca\u9633","data":"yiyang","fl":"yy"},{"value":"\u90b5\u9633","data":"shaoyang","fl":"sy"},{"value":"\u8861\u9633","data":"hengyang","fl":"hy"},{"value":"\u5174\u5b89\u76df","data":"xinganmeng","fl":"xam"},{"value":"\u9521\u6797\u90ed\u52d2\u76df","data":"xilinguolemeng","fl":"xlglm"},{"value":"\u7389\u6797","data":"yulinshi","fl":"yls"},{"value":"\u4f0a\u6625","data":"yichunshi","fl":"yc"}];

    $('#autocomplete').autocomplete({
        lookup: cities,
        lookupLimit: 15,
        width: '200px',
        lookupFilter: function(suggestion, originalQuery, queryLowerCase){
          var pattern = '^'+queryLowerCase;
          return suggestion.data.match(pattern) || suggestion.fl.toLowerCase().match(pattern);
        },
        formatResult: function (suggestion, currentValue) {
          return '<a href="/'+suggestion.data+'.html">'+suggestion.value+'</a>';
        },
        onSelect: function (suggestion) {
        }
    });

    var checkCity = function(){
      $.ajax({
        type: "post",
        dataType: 'json',
        url: 'http://www.pm25.com/city/cityCheck',
        data: {cityname: $('#autocomplete').val()},
        success:function(res){
          if(res.err == 0) {
            window.location.href = '/'+res.areapy+'.html';
          } else {
            alert('对不起，该城市不存在!')
          }
        }
      });
    }

    $('.search_btn').click(function(){
      checkCity();
    });

    $('.search_city_text').keypress(function(e){
      if(e.which == 13) {
        checkCity();
      }  
    }); 

    $('.city_default_shezhi').click(function(){
      var currentCity = $('.city_default_shezhi').attr('city');
      Cookie.set('default_city', currentCity, {
        path: '/',
        expires: 18000
      });
      $('.city_default_two').show();
      $('.default_city').text(currentCity);
      $('.city_default_shezhi').hide();
    });

    $('.city_default_shanchu').click(function(){
      Cookie.remove('default_city', {
        path: '/'
      });
      $('.city_default_two').hide();
      $('.city_default_shezhi').show();
    });

  });

});
</script>
<script>
seajs.use(['$', 'switchable', 'dadadan', 'danmu', 'danmuxml'], function($){
$(document).ready(function(){

  $('.bi_location_content_dropdown').click(function(e){
    e.stopPropagation();
    if($('.bi_location_content_active').hasClass("hide")){
      $('.bi_location_content_active').removeClass('hide');
      $('.bi_location_content ').addClass('bi_location_content_hover');
    } else {
      $('.bi_location_content_active').addClass("hide");
      $('.bi_location_content ').removeClass('bi_location_content_hover');
    }
  });

  // 点击其他地方层消失
  $(document).click(function(){
    if(!$('.bi_location_content_active').hasClass("hide")){
      $('.bi_location_content_active').addClass("hide");
      $('.bi_location_content ').removeClass('bi_location_content_hover');
    }
  });

  $('.dontSelect').click(function(){
    $('.bi_location_content_active').addClass("hide");
    $('.bi_location_content ').removeClass('bi_location_content_hover');
  });

  $('.bi_location_content_active li a').click(function(e){
    var e = $(e.target);
    var lv = e.attr('lv');
    $('.mon_span').text(e.attr('mon'));
    $('.bi_aqiarea_num').text(e.attr('aqi')).attr('href', e.attr('url'));
    $('.pm25_span').text(e.attr('pm25'));
    $('.bi_aqiarea_wuran').text(e.attr('qua')).removeClass('wuranlevel_1 wuranlevel_2 wuranlevel_3 wuranlevel_4 wuranlevel_5 wuranlevel_6').addClass('wuranlevel_' + lv);
  });

  $('.lzi_pic').switchable({
    triggers: $('.lzi_num .tr-point'),
    triggerType: 'click',
    currentTriggerCls: 'current',
    autoplay: true,
    interval: 5,
    panels: 'li',
    effect: 'fade',
    /* fade effect only supports steps == 1 */
    // steps: 4,
    easing: 'ease-in-out',
    prev: $('.lzi_numbtn_pre'),
    next: $('.lzi_numbtn_next'),
    onSwitch: function(event, currentIndex) {
      var api = this;
      api.prevBtn.toggleClass('disabled', currentIndex === 0);
      api.nextBtn.toggleClass('disabled', currentIndex === api.length - 1);
    }
  });


  var guideShow = function(){
    guideShowFunc = setInterval(function(){
      var qty = Math.floor(Math.random() * ( 5 + 1));
      var hoverDom = $('.im_shenghuo_item_hover');
      hoverDom.fadeOut();
      hoverDom.eq(qty).fadeIn();
    }, 3000)
  };

  guideShow();

  $('.im_shenghuo_details li').each(function(){
    var hoverDom = $(this).find('.im_shenghuo_item_hover');
    $(this).hover(function(){
      $('.im_shenghuo_item_hover').hide();
      clearInterval(guideShowFunc);
      hoverDom.show(); 
    },function(){
      guideShow();
      hoverDom.hide(); 
    });
  });

  $('.jiance_close_btn').click(function(){
    $('.fixed_jiance').hide();
    $('.jiance_zhao').hide();
  });

  $('.jiance_btn').click(function(){
    $('.jiance_tanchu_width').show();
    $('.jiance_zhao').show();
  })

  $('.jiance_tanchu_close').click(function(){
    $('.jiance_tanchu_width').hide();
    $('.jiance_zhao').hide();
  });

  if ($(".bi_news_closed li").length > 0) { 
    setInterval(function(){
    $('.bi_news_closed').find("li:first").animate({
        marginTop: "-25px"
      }, 2000, function(){
        $(this).css({
          marginTop: "0px"
        }).appendTo(".bi_news_closed");
      });
    }, 5000);
  } else { 
    $(".bi_news_closed").hide() 
  }

  var title = encodeURIComponent('绿色呼吸PM2.5');
  var city = $('.cml_city').text();
  var desc = encodeURIComponent('【石家庄2017-05-07 16:00：良，PM2.5当前浓度45微克/立方米】#PM2.5#指数为87，预计24小时内吸入648微克，沉淀进肺泡无法排出432微克，心肺疾病死亡风险升高7.1%，癌症死亡风险升高9.9%，更多http://www.pm25.com/');
  var url = location.href;
  var pic = '';
  if(pic != ''){
    pic = 'http://www.pm25.com/' + pic;
  }
  $('.bi_info_share_active_sina, .jtb_share_sina').click(function(){window.open('http://v.t.sina.com.cn/share/share.php?appkey=57458049&url='+url+'&title='+desc+'&content=gb2312&pic='+pic+'&ralateUid=5108207785', '绿色呼吸PM25', 'height=816, width=768,top=0,left=500,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');});
  $('.bi_info_share_active_qzone, .jtb_share_qzone').click(function(){window.open('http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url='+url+'&desc='+desc+'&title='+title, '绿色呼吸PM25', 'height=816, width=768,top=,left=500,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');});

 
  // duoshuo
  var duoshuo_uid = '';
  var duoshuo_uname;
  var thread_key = 'city_shijiazhuang';

  $.ajax({
    type: 'get',
    dataType: 'json',
    url: '/duoshuo/uinfo',
    success:function(r){
      if(r.code == 0) {
        duoshuo_uname = r.response.name;
        $('.duoshuo_avatar').attr('src', r.response.avatar_url).attr('title', r.response.avatar_url);
        $('.duoshuo_uname').text(r.response.name);
      }
    }
  });

  $('.alert_login').click(function(){
    $('.tan_login_width, .tanmu_max_zhezhao').show();
  });

  $('.mmi_btn').click(function(){
    var message = $('.mmi_ipt').val();
    if(message == '') {alert('评论内容不能为空');return false;}
    if(duoshuo_uid == '') {
      $.ajax({
        type: 'post',
        dataType: 'json',
        url: '/duoshuo/loacladd',
        data: {thread_key: thread_key, message: message, author_name: '游客'},
        success:function(r){
          if(r.code == 200) {
            $('.mmi_ipt').val('');
            dmAdd(r.response.message);
          } else if(r.code == 400) {
            alert(r.response);
          }
        }
      });
    } else {
      $.ajax({
        type: 'post',
        dataType: 'json',
        url: '/duoshuo/loacladd',
        data: {thread_key: thread_key, message: message},
        success:function(r){
          if(r.code == 0) {
            $('.mmi_ipt').val('');
            dmAdd(r.response.message);
          }
        }
      });
    }
  });

  // danmu
  $('.bi_opentanmu').click(function(){
    $('.tanmubox').show();
    $('.abp').show();
    if(cm == undefined) {
      cm = dmInit();
    } else {
      dmStart();
    }
  });
  $('.close_minilogin').click(function(){
    $('.tanmubox').hide();
    $('.abp').hide();
    dmStop();
    mindanmu();
  });

  $('.login_close').click(function(){
    $('.tan_login_width, .tanmu_max_zhezhao').hide();
  });

  var cm;
  var tmr = -1;
  var start = 0;
  var playhead = 0;

  var dmInit = function(){
    if(cm != undefined) return cm;
    // danmu
    cm = new CommentManager(document.getElementById('danmu'));
    cm.init();
    
    tmr = -1;
    start = 0;
    playhead = 0;

    CommentLoader('/duoshuo/localxml/' + thread_key, cm);
    cm.startTimer();
    start = new Date().getTime();
    tmr = setInterval(function(){
      playhead = new Date().getTime() - start;
      cm.time(playhead);
    },42);

    return cm;
  }

  var dmStart = function(){
    if(tmr !== -1)
      return;
    cm.startTimer();
    start = new Date().getTime() - playhead;
    tmr = setInterval(function(){
      playhead = new Date().getTime() - start;
      cm.time(playhead);
    },42);
  }

  var dmStop = function(){
    cm.stopTimer();
    clearInterval(tmr);
    tmr = -1;
  }

  var dmReset = function(){
    playhead = 0;
    start = (new Date()).getTime() + 1000;
    cm.clear();
  }

  var dmAdd = function(msg){
    cm.send({
      'border': false,
      'color': 16777215,
      'data': 1308104419,
      'dbid': 31188880,
      'hash': "Db20c852",
      'mode': 1,
      'pool': 0,
      'position': "absolute",
      'size': 25,
      'stime': 0,
      'text': msg
    });
  }

  /*
  $('.message_quanping').click(function(){
    if($('.message_quanping').attr('data-full') == 0) {
      fulldanmu();
    } else {
      mindanmu()
    }
  });
  */

  $('.message_quanping').click(function(){
    dmReset();
  });

  var fulldanmu = function(){
    $('#danmu').css({
        'position': 'fixed',
        'top': '0px',
        'bottom': '0px',
        'left': '0px',
        'right': '0px',
        'width': 'auto',
        'height': 'auto',
        'background-color': 'rgba(0, 0, 0, 0.7)'
      });
      $('.tanmu_mini_width').css({
        'position': 'fixed',
        'z-index': '999',
        'bottom': '0px',
        'top': 'auto'
      });
      $('.message_quanping').attr('data-full', 1).html('<i></i>退出全屏');
      $('.tanmu_mini_zhezhao').hide();
  }

  var mindanmu = function(){
    $('#danmu').removeAttr('style').css({'width':'100%','height':'290px'});
    $('.tanmu_mini_width').removeAttr('style');
    $('.message_quanping').attr('data-full', 0).html('<i></i>全屏浏览');
    $('.tanmu_mini_zhezhao').show();
  }

});
});
</script>
