最简单的Flash流媒体例子
Simplest Flashmedia Example

雷霄骅 Lei Xiaohua
leixiaohua1020@126.com
中国传媒大学/数字电视技术
Communication University of China / Digital TV Technology
http://blog.csdn.net/leixiaohua1020

本工程包含如下基于Flash技术的流媒体的例子：
simplest_as3_rtmp_player:      最简单的RTMP播放器（基于ActionScript）
simplest_as3_rtmp_streamer:    最简单的RTMP推流器（基于ActionScript）
rtmp_sample_player_adobe:      从Adobe Flash Media Sever提取出来的测试播放器
rtmp_sample_player_wowza:      从Wowza服务器中提取出来的测试播放器
rtmp_sample_player_flowplayer: 基于FlowPlayer的RTMP/HTTP播放器（添加RTMP plugin）
rtmp_sample_player_videojs:    基于VideoJS的RTMP/HTTP播放器
rtmp_sample_player_jwplayer:   基于JWplayer的RTMP/HTTP播放器
hls_sample_player_flowplayer:  基于FlowPlayer的HLS播放器（添加HLS plugin）
hls_video_player_html5:        基于HTML5的HLS/HTTP播放器
activex_vlc_player:            基于VLC的ActiveX控件的播放器

注意：某些播放器直接打开html页面是不能工作的，需要把播放器放到Web服务器上。
（例如Apache或者Nginx）

This project contains following examples about Flash streaming media:
simplest_as3_rtmp_player:      Simplest RTMP Player(ActionScript)
simplest_as3_rtmp_streamer:    Simplest RTMP Streamer (ActionScript)
rtmp_sample_player_adobe:      Sample Player extracted from Adobe Flash Media Server
rtmp_sample_player_wowza:      Sample Player extracted from Wowza Server
rtmp_sample_player_flowplayer: RTMP/HTTP Player based on FlowPlayer (with RTMP plugin)
rtmp_sample_player_videojs:    RTMP/HTTP Player based on VideoJS
rtmp_sample_player_jwplayer:   RTMP/HTTP Player based on JWPlayer
hls_sample_player_flowplayer:  HLS Player based on FlowPlayer (with HLS plugin)
hls_video_player_html5:        HLS/HTTP Player based on HTML5
activex_vlc_player:            Video Player based on VLC ActiveX

Note: Some example couldn't work directly. You should upload them to web server such as 
Nginx or Apache.