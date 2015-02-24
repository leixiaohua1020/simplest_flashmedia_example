/**
 * 最简单的基于ActionScript的RTMP推流器
 * Simplest AS3 RTMP Streamer
 *
 * 雷霄骅 Lei Xiaohua
 * leixiaohua1020@126.com
 * 中国传媒大学/数字电视技术
 * Communication University of China / Digital TV Technology
 * http://blog.csdn.net/leixiaohua1020
 * 
 * 本程序使用ActionScript3语言完成，推送本地摄像头的数据至RTMP流媒体服务器，
 * 是最简单的基于ActionScript3的推流器。
 *
 * This software is written in Actionscript3, it streams camera's video to
 * RTMP server.
 * It's the simplest RTMP streamer based on ActionScript3.
 * 
 */


package {
    import flash.display.MovieClip;
    import flash.net.NetConnection;
    import flash.events.NetStatusEvent;
    import flash.net.NetStream;
    import flash.media.Video;
	import flash.media.Camera;
    import flash.media.Microphone;
	//import flash.media.H264Profile;  
    //import flash.media.H264VideoStreamSettings; 

    public class simplest_as3_rtmp_streamer extends MovieClip
    {
		var nc:NetConnection;
		var ns:NetStream;
		var nsPlayer:NetStream;
		var vid:Video;
		var vidPlayer:Video;
		var cam:Camera;
		var mic:Microphone;
		
		var screen_w:int=320;
		var screen_h:int=240;

		public function simplest_as3_rtmp_streamer()
        {
			nc = new NetConnection();
			nc.addEventListener(NetStatusEvent.NET_STATUS, onNetStatus);
			nc.connect("rtmp://localhost/live");
        }

		private function onNetStatus(event:NetStatusEvent):void{
			trace(event.info.code);
			if(event.info.code == "NetConnection.Connect.Success"){
				publishCamera();
				displayPublishingVideo();
				displayPlaybackVideo();
			}
		}

		private function publishCamera() {
			
			//Cam
			
			cam = Camera.getCamera();

			/**
             * public function setMode(width:int, height:int, fps:Number, favorArea:Boolean = true):void  
             *  width:int — The requested capture width, in pixels. The default value is 160.  
             *  height:int — The requested capture height, in pixels. The default value is 120.  
             *  fps:Number — The requested capture frame rate, in frames per second. The default value is 15.  
             */
			cam.setMode(640, 480, 15);  
			
			/**
			 * public function setKeyFrameInterval(keyFrameInterval:int):void
			 * The number of video frames transmitted in full (called keyframes) instead of being interpolated by the video compression algorithm.
			 * The default value is 15, which means that every 15th frame is a keyframe. A value of 1 means that every frame is a keyframe. 
			 * The allowed values are 1 through 300. 
			 */
            cam.setKeyFrameInterval(25);
			
			/**
			 * public function setQuality(bandwidth:int, quality:int):void  
             * bandwidth:int — Specifies the maximum amount of bandwidth that the current outgoing video feed can use, in bytes per second (bps).   
             *    To specify that the video can use as much bandwidth as needed to maintain the value of quality, pass 0 for bandwidth.   
             *    The default value is 16384.  
             * quality:int — An integer that specifies the required level of picture quality, as determined by the amount of compression   
             *     being applied to each video frame. Acceptable values range from 1 (lowest quality, maximum compression) to 100   
             *    (highest quality, no compression). To specify that picture quality can vary as needed to avoid exceeding bandwidth,   
             *    pass 0 for quality.  
             */
			cam.setQuality(200000, 90); 
			
			/**
			 * public function setProfileLevel(profile:String, level:String):void
			 * Set profile and level for video encoding. 
			 * Possible values for profile are H264Profile.BASELINE and H264Profile.MAIN. Default value is H264Profile.BASELINE.
			 * Other values are ignored and results in an error.
			 * Supported levels are 1, 1b, 1.1, 1.2, 1.3, 2, 2.1, 2.2, 3, 3.1, 3.2, 4, 4.1, 4.2, 5, and 5.1.
			 * Level may be increased if required by resolution and frame rate.
			 */
			//var h264setting:H264VideoStreamSettings = new H264VideoStreamSettings();  
            // h264setting.setProfileLevel(H264Profile.MAIN, 4);   
            
			
			//Mic
			
			mic = Microphone.getMicrophone();
			
			/*
			 * The encoded speech quality when using the Speex codec. Possible values are from 0 to 10. The default value is 6. 
			 * Higher numbers represent higher quality but require more bandwidth, as shown in the following table. 
			 * The bit rate values that are listed represent net bit rates and do not include packetization overhead. 
             * ------------------------------------------
			 * Quality value | Required bit rate (kbps)
			 *-------------------------------------------
			 *      0        |       3.95 
			 *      1        |       5.75 
			 *      2        |       7.75 
			 *      3        |       9.80 
			 *      4        |       12.8 
			 *      5        |       16.8 
			 *      6        |       20.6 
			 *      7        |       23.8 
			 *      8        |       27.8 
			 *      9        |       34.2 
			 *      10       |       42.2 
			 *-------------------------------------------
			 */
			mic.encodeQuality = 9;  
			
            /* The rate at which the microphone is capturing sound, in kHz. Acceptable values are 5, 8, 11, 22, and 44. The default value is 8 kHz   
             * if your sound capture device supports this value. Otherwise, the default value is the next available capture level above 8 kHz that   
             * your sound capture device supports, usually 11 kHz.  
			 *
             */
			mic.rate = 44;  
			
			
			ns = new NetStream(nc);
			//H.264 Setting
			//ns.videoStreamSettings = h264setting; 
			ns.attachCamera(cam);
			ns.attachAudio(mic);
			ns.publish("myCamera", "live");
		}

		private function displayPublishingVideo():void {
			vid = new Video(screen_w, screen_h);
			vid.x = 10;
			vid.y = 10;
			vid.attachCamera(cam);
			addChild(vid);
		}

		private function displayPlaybackVideo():void{
			nsPlayer = new NetStream(nc);
			nsPlayer.play("myCamera");
			vidPlayer = new Video(screen_w, screen_h);
			vidPlayer.x = screen_w + 20;
			vidPlayer.y = 10;
			vidPlayer.attachNetStream(nsPlayer);
			addChild(vidPlayer);
		}
	}
}