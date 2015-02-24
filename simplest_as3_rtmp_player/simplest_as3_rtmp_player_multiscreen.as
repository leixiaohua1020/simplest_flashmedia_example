/**
 * 最简单的基于ActionScript的RTMP播放器-多屏
 * Simplest AS3 RTMP Player MultiScreen
 *
 * 雷霄骅 Lei Xiaohua
 * leixiaohua1020@126.com
 * 中国传媒大学/数字电视技术
 * Communication University of China / Digital TV Technology
 * http://blog.csdn.net/leixiaohua1020
 * 
 * 本程序使用ActionScript3语言完成，播放RTMP服务器上的流媒体
 * 是最简单的基于ActionScript3的播放器。
 *
 * This software is written in Actionscript3, it plays stream
 * on RTMP server
 * It's the simplest RTMP player based on ActionScript3.
 * 
 */
package {
    import flash.display.Sprite;
    import flash.net.NetConnection;
    import flash.events.NetStatusEvent;
    import flash.events.AsyncErrorEvent;
    import flash.net.NetStream;
    import flash.media.Video;

    public class simplest_as3_rtmp_player_multiscreen extends Sprite
    {
        var nc0:NetConnection;
        var ns0:NetStream;
		var video0:Video;
		
		var nc1:NetConnection;
        var ns1:NetStream;
		var video1:Video;
		
		var nc2:NetConnection;
        var ns2:NetStream;
		var video2:Video;
		
		var nc3:NetConnection;
        var ns3:NetStream;
		var video3:Video;
		
		//var border:int=10;
		var app_w:int=640;
		var app_h:int=480;
		var screen_w:int=app_w/2;
		var screen_h:int=app_h/2;

        public function simplest_as3_rtmp_player_multiscreen()
        {
      		nc0 = new NetConnection();
        	nc0.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler0);
			//HKS | rtmp://live.hkstv.hk.lxdns.com/live/hks
			nc0.connect("rtmp://live.hkstv.hk.lxdns.com/live");
			
			nc1 = new NetConnection();
            nc1.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler1);
			//Beijing Mobile | rtmp://www.bj-mobiletv.com:8000/live/live1
			nc1.connect("rtmp://www.bj-mobiletv.com:8000/live");
			
			nc2 = new NetConnection();
            nc2.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler2);
			//Dongguan TV | rtmp://ftv.sun0769.com/dgrtv1/mp4:b1
			nc2.connect("rtmp://ftv.sun0769.com/dgrtv1");
			
			nc3 = new NetConnection();
            nc3.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler3);
			//CNR Mall | rtmp://wx.cnrmall.com/live/flv
			nc3.connect("rtmp://wx.cnrmall.com/live");
        }



        private function netStatusHandler0(event:NetStatusEvent):void
        {
			trace("[video 0] event.info.level: " + event.info.level + "\n", "event.info.code: " + event.info.code);
            switch (event.info.code)
            {
                case "NetConnection.Connect.Success":
	                doVideo0(nc0);
	                break;
	        }
        }
		
		private function netStatusHandler1(event:NetStatusEvent):void
        {
			trace("[video 1] event.info.level: " + event.info.level + "\n", "event.info.code: " + event.info.code);
            switch (event.info.code)
            {
                case "NetConnection.Connect.Success":
	                doVideo1(nc1);
	                break;
	        }
        }
		
		private function netStatusHandler2(event:NetStatusEvent):void
        {
			trace("[video 2] event.info.level: " + event.info.level + "\n", "event.info.code: " + event.info.code);
            switch (event.info.code)
            {
                case "NetConnection.Connect.Success":
	                doVideo2(nc2);
	                break;
	        }
        }
		
		private function netStatusHandler3(event:NetStatusEvent):void
        {
			trace("[video 3] event.info.level: " + event.info.level + "\n", "event.info.code: " + event.info.code);
            switch (event.info.code)
            {
                case "NetConnection.Connect.Success":
	                doVideo3(nc3);
	                break;
	        }
        }


        // play a recorded stream on the server
        private function doVideo0(nc:NetConnection):void {
           ns0 = new NetStream(nc);
           ns0.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler0);

           video0 = new Video(screen_w,screen_h);
		   video0.x=0;
		   video0.y=0;
           video0.attachNetStream(ns0);

           ns0.play("hks");
           addChild(video0);
        }
		
		private function doVideo1(nc:NetConnection):void {
           ns1 = new NetStream(nc);
           ns1.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler1);

           video1 = new Video(screen_w,screen_h);
		   video1.x=screen_w;
		   video1.y=0;
           video1.attachNetStream(ns1);

           ns1.play("live1");
           addChild(video1);
        }
		
		private function doVideo2(nc:NetConnection):void {
           ns2 = new NetStream(nc);
           ns2.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler2);

           video2 = new Video(screen_w,screen_h);
		   video2.x=0;
		   video2.y=screen_h;
           video2.attachNetStream(ns2);

           ns2.play("mp4:b1");
           addChild(video2);
        }
		
		private function doVideo3(nc:NetConnection):void {
           ns3 = new NetStream(nc);
           ns3.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler0);

           video3 = new Video(screen_w,screen_h);
		   video3.x=screen_w;
		   video3.y=screen_h;
           video3.attachNetStream(ns3);

           ns3.play("flv");
           addChild(video3);
        }
    }
}
