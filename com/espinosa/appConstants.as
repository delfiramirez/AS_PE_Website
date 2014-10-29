class com.espinosa.appConstants
{
	public static var BASE_URL:String = "http://www.pereespinosa.net";
	public var appScreen_txt:Text;
	public var appappVideo_mc:MovieClip;
	public var appImages_mc:MovieClip;
	public var appMusic_mc:MovieClip;
	public var _square:MovieClip;
	public var appClipContent:MovieClip;
	public var appClipBar2_mc:MovieClip;
	public var appBackground_mc:MovieClip;
	public var appAuthor_mc:MovieClip;
	public var appAuthorBio_mc:MovieClip;
	public var appIntroText_mc:MovieClip;

	public var app_mc:MovieClip;
	public var dest_mc:MovieClip;

	var appMVL:MovieClipLoader = new MovieClipLoader ();

	// -- Private Functions --
	private var appListener:Object = new Object ();
	private var resizeappListener:Object = new Object ();

	private var addEventListener:Function;
	private var removeEventListener:Function;
	private var onResize:Function;
	private var onLoadStart:Function;
	private var onLoadComplete:Function;



	public var totalBlur:Number = 8;
	public var noBlur:Number = 0;
	public var blurTween:Tween;
	public var blur:BlurFilter = new BlurFilter (totalBlur, totalBlur, 3);

	public var appMenu:ContextMenu = new ContextMenu ();

	public var appCopyright:Function;
	public var onMail:Function;

	public var moveSquare:Function;
	public var appSquareMov:Function;


	public static var speed:Number = 9;
	public static var i:Number = 0;

	public var appBang_mc:MovieClip;
	public var appBar_mc:MovieClip;
	public var appBlog_mc:MovieClip;
	public var appAuthorBio_mc:MovieClip;
	public var appBackgroundBio_mc:MovieClip;
	public var appBackgroundVideo_mc:MovieClip;
	public var appCredits_mc:MovieClip;
	public var appContact_mc:MovieClip;
	public var appIntroText_mc:MovieClip;
	public var appEvent2009_mc:MovieClip;
	public var appMultimedia_mc:MovieClip;
	public var appPlayer_mc:MovieClip,
	public var appStick:MovieClip;
	public var appNews_mc:MovieClip;

	public var appPrivacy_mc:MovieClip;
	public var appTop_mc:MovieClip;

	public var contact_txt:TextField;
	public var credits_txt:TextField;

	public var appStart:Function;

	// -- Getters and Setters --

	public var appMCRelease:Function;
	public var hideappEvent2009:Function;
	public var hideIntroText:Function;
	public var hideappMediaParent:Function;
	public var showappMediaParent:Function;
	public var unloadAppMediaParent:Function;
	public var hideappBackgroundColoured:Function;
	public var hideMovieclipSquare:Function;

	public static var applicationFiles_array:Array = new Array("appAuthorBio.swf","appURL.swf","appMusic.swf","appMultimedia.swf","appCredits.swf","appPrivacy.swf");

}