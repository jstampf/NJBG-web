﻿// Item Name: imgScroll - jQuery Scrolling Gallery
// Author: Mapalla
// Author URI: http://codecanyon.net/user/Mapalla
// Version: 1.0

(function($){

  //start of plugin
  $.fn.imgScroll = function(options) {
  
  var defaults = {thumbsContainer:'.thumbnail', mouseNavigation:true, mouseWheelSpeed:155, keyboardNavigation:true,  
                mainImageContainer:'.main_image', transition:'slide', animateScroll:true ,
                descriptionContainer:'.main_description', autoplay:false, autoplayInterval:10000, cycle:true,
                arrowButtonSpeed:155, imagePreloader:'images/6-32.gif', lightbox:true,
                thumbCaption:true, transitionEasing:'swing', animationSpeed:500,

                // dimensions
                thumbImages: {width: 150, height: 100},
                mainContainer: {width: 800, height: 400},
                infoBoxWidth: 150
                };
  
  var o = jQuery.extend(defaults, options);
  
  return this.each(function(){
    var imgs = $(this);
    imgs.mouseNavigation = o.mouseNavigation;
    imgs.mouseSpeed = o.mouseWheelSpeed;
    imgs.keys = o.keyboardNavigation;
    imgs.cycle = o.cycle;
    imgs.transition = o.transition;
    imgs.arrowButtonSpeed = o.arrowButtonSpeed;
    imgs.animateScroll = o.animateScroll;
    imgs.imagePreloader = o.imagePreloader;
    imgs.transitionEasing = o.transitionEasing;
    imgs.animationSpeed = o.animationSpeed;
    imgs.isAnimationRunning = false ;
    imgs.lightbox = o.lightbox;
    
    /* THUMBNAIL */
    imgs.thumbsContainer = imgs.find(o.thumbsContainer);
    imgs.thumbsList = imgs.thumbsContainer.children('ul');
    imgs.thumbItem = imgs.thumbsList.children('li'); 
    imgs.thumbItemActive = 0;
    imgs.thumbCaption = o.thumbCaption;
    imgs.dataContainer = imgs.thumbItem.children('.data');
    imgs.thumbDimensions = o.thumbImages;

	imgs.thumbItem.css(imgs.thumbDimensions);

    imgs.thumbItem.bind('click', imgs, thumbClick);

    /* DESCRIPTION */
    imgs.descriptionContainer = imgs.find(o.descriptionContainer) ;

	imgs.descriptionContainer.css({
		width: o.infoBoxWidth,
		height: o.mainContainer.height - (imgs.descriptionContainer.outerHeight(true) - imgs.descriptionContainer.height())
	});

    createDescWrapper(imgs);
    insertDescToWrapper(imgs);
    showDescription(imgs);
    
    /* MAIN IMAGE */
    imgs.mainImageContainer = imgs.find(o.mainImageContainer);

	imgs.mainImageContainer.css({
		width: o.mainContainer.width,
		height: o.mainContainer.height
	});

	imgs.width(imgs.mainImageContainer.outerWidth(true) + imgs.descriptionContainer.outerWidth(true));
	imgs.thumbsContainer.width(imgs.width());
    
    //loadThumbImage(imgs);
    stylingThumbnail(imgs);
    createScrollbar(imgs);
    stylingActiveThumbnail(imgs);
    createThumbHoverState(imgs);

    imgs.fileTypes = { 
        //images
        images:{
                reg: /\.(jpg|jpeg|gif|png|bmp|tiff)(.*)?$/i, 
                type:'image'},
        //swf
        swf: {
                reg: /[^\.]\.(swf)\s*$/i, 
                type:'swf',
                width:600,
                height:400},
        megavideo: {
                reg: /megavideo.com/i,
                split: '=',
                index: 1,
                url: "http://www.megavideo.com/v/%id%",
                type: 'object',
                width:600,
                height: 400},
        gametrailers: {
                reg: /gametrailers.com/i,
                split: '/',
                index: 5,
                url: "http://www.gametrailers.com/remote_wrap.php?mid=%id%",
                type: 'object',
                width: 600,
                height: 400},
        collegehumor: {
                reg: /collegehumor.com/i,
                split: '/',
                index: 4,
                url: "http://www.collegehumor.com/moogaloop/moogaloop.swf?clip_id=%id%&amp;use_node_id=true&amp;fullscreen=1",
                type: 'object',
                width: 600,
                height: 400},
        videopress: {
                reg: /videos.videopress.com/i,
                split: '/',
                index: 3,
                url: "http://s0.videopress.com/player.swf?guid=%id%&amp;v=1.02",
                type: 'object',
                width: 600,
                height: 400},
     
        //iframe
        youtube: {
                reg: /youtube\.com\/watch/i, 
                split: '=', 
                index: 1, 
                url:'http://www.youtube.com/embed/%id%?autoplay=0&amp;fs=1&amp;rel=0', 
                type:'video',
                width:640,
                height:390},
        vimeo: {
                reg: /vimeo\.com/i, 
                split: '/', 
                index: 3, 
                url: 'http://player.vimeo.com/video/%id%?portrait=0&amp;autoplay=0', 
                type:'video',
                width:640,
                height:390},
        dailymotion:{
                reg: /dailymotion\.com\/video/i,
                split: '/',
                index: 4,
                url: 'http://www.dailymotion.com/embed/video/%id%',
                type:'video',
                width:600,
                height:400},
        twitvid: {
                reg: /twitvid.com/i,
                split: '/',
                index: 3,
                url: 'http://www.twitvid.com/embed.php?guid=%id%&amp;autoplay=0',
                type: 'video',
                width:600,
                height:400},
        //maps
        googlemaps: {
                reg: /maps.google.com/i, 
                split: '?', 
                index: 1, 
                url: 'http://maps.google.com/?output=embed&amp;%id%', 
                type: 'map',
                width:640,
                height:480},
        googlestreetview: {
                reg: /maps.google.com(.*)layer=c/i, 
                split: '?', 
                index: 1, 
                url: 'http://maps.google.com/?output=svembed&amp;%id%', 
                type: 'streetview',
                width:700,
                height:394},        
        bingmaps: {
                reg: /bing.com\/maps/i, 
                split: '?', 
                index: 1, 
                url: 'http://www.bing.com/maps/embed/?emid=3ede2bc8-227d-8fec-d84a-00b6ff19b1cb&amp;w=%width%&amp;h=%height%&amp;%id%', 
                type: 'map',
                width:640,
                height:480}
        } ; 
    
    createMainImageWrapper(imgs);
    createImageContainer(imgs);
    //insertMainContents(imgs);
        
    
    /* AUTOPLAY */
    imgs.autoplay = o.autoplay;
    imgs.autoplayInterval = o.autoplayInterval;
    imgs.pauseAutoplay = false ;
    imgs.pauseButton = false ;
    
    if (imgs.autoplay == true){
        runAutoplay(imgs);
        createPlayControl(imgs);
        createPauseControl(imgs);
    }
    
    /* MOUSE */
    if (imgs.mouseNavigation == true){
        imgs.thumbsContainer.mousewheel(function(event, delta){
            if (delta > 0){
                mouseWheelUp(imgs);
                return false ;
            } 
            if (delta < 0) {
                mouseWheelDown(imgs);
                return false ;
            }
        });
    }
    
    /* LIGHTBOX */
    imgs.lightboxItems = imgs.thumbItem.find('.lightbox');
    imgs.lightboxItemNumber = imgs.lightboxItems.length;
    imgs.lightboxItemActive = 0;
    imgs.isLightboxRunning = false ;
    //insertLinkImage(imgs);
    
    $(document).keydown(function(event){
        if (event.keyCode == '27'){
            if (imgs.isLightboxRunning == true){
                removeLightbox(imgs);
            }
            return false ;
        }
    });
	   
  }); // end of return
    
  }; //end of plugin
  
  //function here
  
  /* ___________________________________________________________________________ */
  
  /* THUMBNAIL */
  /* ___________________________________________________________________________ */
  
  //loading thumb image
  function loadThumbImage(imgs){
    var imgThumb = imgs.thumbItem.find('img');
    imgThumb.hide();
    
    for (var i=0; i < imgs.thumbItem.length; i++){
        imgThumb.eq(i).load(function(){
            $(this).fadeIn();
        });
    }
  };
    
  //styling thumbnail list
  function stylingThumbnail(imgs){
    var thumbItemWidth = imgs.thumbItem.outerWidth(true),
        thumbItemNumber = imgs.thumbItem.length,
        thumbsListWidth = thumbItemWidth * thumbItemNumber ;
    
    imgs.thumbsContainer.css('overflow', 'hidden');
    imgs.thumbsList.css('width', thumbsListWidth + 'px');
  };
  
  //create scrollbar
  function createScrollbar(imgs){
	imgs.thumbsContainer.css({height: imgs.thumbDimensions.height + 55});
    var element = imgs.thumbsContainer.jScrollPane({showArrows:true, enableKeyboardNavigation:imgs.keys, 
        animateScroll:imgs.animateScroll, arrowButtonSpeed:imgs.arrowButtonSpeed});
        
    imgs.apiScroll = element.data('jsp');
  };
  
  //styling active thumbnail
  function stylingActiveThumbnail(imgs){
    var x = imgs.thumbItemActive,
		thumbItemActiveObj = imgs.thumbItem.eq(x),
		thumbnail_active;

    thumbItemActiveObj.append('<div class="thumbnail_active"></div>');

	thumbnail_active = thumbItemActiveObj.children('.thumbnail_active');
	thumbnail_active
		.css({
			width: (imgs.thumbDimensions.width - parseInt(thumbnail_active.css('borderLeftWidth'), 10) - parseInt(thumbnail_active.css('borderRightWidth'), 10)),
			height: (imgs.thumbDimensions.height - parseInt(thumbnail_active.css('borderTopWidth'), 10) - parseInt(thumbnail_active.css('borderBottomWidth'), 10))
		});
  };
  
  //remove active thumbnail style
  function removeThumbsActiveStyle(imgs){
    imgs.thumbItem.children('.thumbnail_active').remove();
  };
  
  //thumbnail click event
  function thumbClick(event){
    var imgs = event.data,
        $this = $(this),
        currentActiveThumb = imgs.thumbItemActive;
    
    if (imgs.isAnimationRunning == true){
        return false ;
    }
    
    if ($this.index() == currentActiveThumb){
        
        return false;
    }
    else {
        imgs.thumbItemActive = $this.index();

        removeThumbsActiveStyle(imgs);
        stylingActiveThumbnail(imgs);
        showDescription(imgs);
    
        if (imgs.transition == 'slide'){
            if ($this.index() > currentActiveThumb){
                slideInLeft(imgs, currentActiveThumb);
            }
            else {
                slideInRight(imgs, currentActiveThumb);
            }
        }
        else if(imgs.transition == 'swipe'){
            if ($this.index() > currentActiveThumb){
                swipeInLeft(imgs, currentActiveThumb);
            }
            else {
                swipeInRight(imgs, currentActiveThumb);
            }
        }
        else if (imgs.transition == 'fade'){
            fadeIn(imgs, currentActiveThumb);
        }
        
        
        return false ;
    }
    
  };
    
  //show thumbnail caption
  function createThumbHoverState(imgs){
    imgs.thumbItem.hover(function(){
        var $this = $(this),
            thumbItem = $this.children('a').children('img'),
            caption = thumbItem.attr('title'),
			thumbnail_hover;
        
        if (imgs.thumbCaption == true){
            $this.append('<div class="thumbnail_hover"><p>'+caption+'</p></div>');
        }
        else {
            $this.append('<div class="thumbnail_hover"></div>');
        }
		thumbnail_hover = $this.children('.thumbnail_hover');
		
		thumbnail_hover
			.css({
				width: (imgs.thumbDimensions.width - parseInt(thumbnail_hover.css('borderLeftWidth'), 10) - parseInt(thumbnail_hover.css('borderRightWidth'), 10)),
				height: (imgs.thumbDimensions.height - parseInt(thumbnail_hover.css('borderTopWidth'), 10) - parseInt(thumbnail_hover.css('borderBottomWidth'), 10))
			});
    }, function(){
        imgs.thumbItem.children('.thumbnail_hover').remove();
    });    
  };
  
  /* _______________________________________________________________________ */
  
  /* DESCRIPTION */
  /* _______________________________________________________________________ */
  
  // show main description
  function createDescWrapper(imgs){
    var itemsNumber = imgs.thumbItem.length,
        descContainer = imgs.descriptionContainer,
        containerWidth = descContainer.width(),
        containerHeight = descContainer.height();
    
    for (var i = 0; i < itemsNumber ; i++ ){
        $('<div></div>')
            .hide()
            .css({'position':'absolute', 'width':containerWidth+'px', 'height':containerHeight+'px'})
            .appendTo(descContainer);        
    }
  };
  
  //insert description
  function insertDescToWrapper(imgs){
    var itemsNumber = imgs.thumbItem.length ;
    
    for (var i = 0; i < itemsNumber; i++){
        var imgDesc = imgs.thumbItem.eq(i).children('.data').find('div').html(),
            container = imgs.descriptionContainer.children('div').eq(i);
        
        container.append(imgDesc);
    }
  };
  
  //show description
  function showDescription(imgs){
    var itemActive = imgs.thumbItemActive,
        descItem = imgs.descriptionContainer.children('div');
    
    descItem.fadeOut();
    descItem.eq(itemActive).fadeIn();
  };
  
  /* _______________________________________________________________________ */
  
  /* MAIN IMAGE */
  /* _______________________________________________________________________ */
  
  //get file type
  function getFileType(imgs, url){
    var fileType,
        fileUrl,
        fileWidth,
        fileHeight,
        arrFile;
    
    $.each(imgs.fileTypes, function(i, e){
        if (url.match(e.reg)){
            fileType = e.type;
            
            if (fileType == 'image'){
                fileUrl = url ; 
                arrFile = new Array(fileType, fileUrl);
            }
            else if (fileType == 'video'){
                var videoid = url.split(e.split)[e.index].split('?')[0].split('&')[0];
                fileUrl = e.url.replace("%id%", videoid);
                if (imgs.isLightboxRunning == true){
                    fileWidth = e.width;
                    fileHeight = e.height;
                }
                else {
                    fileWidth = imgs.mainImageContainer.width();
                    fileHeight = imgs.mainImageContainer.height();
                }
                arrFile = new Array(fileType, fileUrl, fileWidth, fileHeight);
            } 
            else if (fileType == 'map'){
                var id = url.split(e.split)[e.index];
                if (imgs.isLightboxRunning == true){
                    fileWidth = e.width;
                    fileHeight = e.height;
                }
                else {
                    fileWidth = imgs.mainImageContainer.width();
                    fileHeight = imgs.mainImageContainer.height();
                }
                fileUrl = e.url.replace("%id%", id).replace("%width%", fileWidth).replace("%height%", fileHeight);
                arrFile = new Array(fileType, fileUrl, fileWidth, fileHeight);
            }
            else if (fileType == 'streetview'){
                var id = url.split(e.split)[e.index];
                if (imgs.isLightboxRunning == true){
                    fileWidth = e.width;
                    fileHeight = e.height;
                }
                else {
                    fileWidth = imgs.mainImageContainer.width();
                    fileHeight = imgs.mainImageContainer.height();
                }
                fileUrl = e.url.replace("%id%", id).replace("%width%", fileWidth).replace("%height%", fileHeight);
                arrFile = new Array(fileType, fileUrl, fileWidth, fileHeight);
            }
            else if (fileType == 'swf'){
                fileUrl = url ;
                if (imgs.isLightboxRunning == true){
                    fileWidth = e.width;
                    fileHeight = e.height;
                }
                else {
                    fileWidth = imgs.mainImageContainer.width();
                    fileHeight = imgs.mainImageContainer.height();
                }
                arrFile = new Array(fileType, fileUrl, fileWidth, fileHeight);
            }
            else if (fileType == 'object'){
                var id = url.split(e.split)[e.index];
                if (imgs.isLightboxRunning == true){
                    fileWidth = e.width;
                    fileHeight = e.height;
                }
                else {
                    fileWidth = imgs.mainImageContainer.width();
                    fileHeight = imgs.mainImageContainer.height();
                }
                fileUrl = e.url.replace("%id%", id).replace("%width%", fileWidth).replace("%height%", fileHeight);
                arrFile = new Array(fileType, fileUrl, fileWidth, fileHeight);
            } else {
				
			}
        }
    });

	if (typeof arrFile == 'undefined') {
		arrFile = new Array('link', url);
	}
    
    return arrFile;
  };
  
  //create images list container
  function createMainImageWrapper(imgs){
    var mainImageContainer = imgs.mainImageContainer,
        wrapperHeight = mainImageContainer.height(),
        wrapperWidth = mainImageContainer.width() * imgs.thumbItem.length;
    
    if (imgs.transition == 'slide'){
        $('<div class="wrapper"></div>')
            .css({'position':'relative', 'width':mainImageContainer.width()*2+'px', 'height':wrapperHeight+'px'})
            .appendTo(mainImageContainer);   
    }
    else if (imgs.transition == 'swipe'){
         $('<div class="wrapper"></div>')
            .css({'position':'relative', 'width':mainImageContainer.width()+'px', 'height':wrapperHeight+'px'})
            .appendTo(mainImageContainer);  
    }
    else if (imgs.transition == 'fade'){
         $('<div class="wrapper"></div>')
            .css({'position':'relative', 'width':mainImageContainer.width()+'px', 'height':wrapperHeight+'px'})
            .appendTo(mainImageContainer);  
    }
      
  };
  
  //create image container for each item
  function createImageContainer(imgs){
    var mainImageContainer = imgs.mainImageContainer,
        wrapper = mainImageContainer.children('.wrapper'),
        containersNumber = imgs.thumbItem.length,
        containerWidth = mainImageContainer.width(),
        containerHeight = mainImageContainer.height();
    
    if (imgs.transition == 'slide'){
        for (var i = 0; i < containersNumber; i++){
            $('<div></div>')
                .hide()
                .css({'position':'absolute', 'top':'0', 'left':'0','background': '#000 url("'+imgs.imagePreloader+'") no-repeat center', 
                    'width':containerWidth+'px', 'height':containerHeight+'px'})
                .appendTo(wrapper);
        }
        
        wrapper.children('div').eq(0).show();
        insertMainContents(imgs, wrapper.children('div').eq(0));
    }
    else if (imgs.transition == 'swipe'){
        for (var i = 0; i < containersNumber; i++){
            $('<div></div>')
                .hide()
                .css({'position':'absolute', 'top':'0', 'left':'0','background': '#000 url("'+imgs.imagePreloader+'") no-repeat center', 
                    'width':containerWidth+'px', 'height':containerHeight+'px'})
                .appendTo(wrapper);
        }
        
        wrapper.children('div').eq(0).show();
        insertMainContents(imgs, wrapper.children('div').eq(0));
    }
    else if (imgs.transition == 'fade'){
        for (var i = 0; i < containersNumber; i++){
            $('<div></div>')
                .hide()
                .css({'position':'absolute', 'top':'0', 'left':'0','background': '#000 url("'+imgs.imagePreloader+'") no-repeat center', 
                    'width':containerWidth+'px', 'height':containerHeight+'px'})
                .appendTo(wrapper);
        }
        
        wrapper.children('div').eq(0).show();
        insertMainContents(imgs, wrapper.children('div').eq(0));
    }
    
  };
  
  //insert content
  function insertMainContents(imgs, container){
    
    var itemsCount = imgs.thumbItem.length,
        wrapper = imgs.mainImageContainer.children('.wrapper'),
        wrapperChilds = wrapper.children('div'),
        containerIndex = wrapperChilds.index(container),
        w = container.width(),
        h = container.height(),
        thumbItem = imgs.thumbItem.eq(containerIndex),
        imgUrl = thumbItem.children('a').attr('href'),
        imgAlt = thumbItem.find('img').attr('alt'),
        arrFile = getFileType(imgs, imgUrl ),
        type = arrFile[0],
        url = arrFile[1],
        linkContent;

        if (type == 'image'){
            $('<img />')
                .attr({'src': url , 'alt': imgAlt})
                .css({'width':w+'px', 'height':h+'px', 'border':'0'})
                .hide()
                .load(function(){ $(this).fadeIn(); })
                .appendTo(container);
                
            insertLinkImage(imgs, containerIndex);
            
        }
        else if(type == 'video'){
            $('<iframe></iframe>')
            .attr({'width':w+'px', 'height':h+'px', 'src':url, 'frameborder':'0'})
            .appendTo(container);
        }
        else if (type == 'map'){
        
            container.html('<iframe width="'+w+'px" height="'+h+'px" src="'+url+'" frameborder="0" style="margin:0; padding:0;"></iframe>');
                    
        }
        else if (type == 'streetview'){
            $('<iframe></iframe>')
                .attr({'width':w, 'height':h, 'src':url, 'frameborder':0, 'scrolling':'no'})
                .appendTo(container);            
        }
        else if (type == 'object' || type == 'swf'){
            var str = '<object width="'+w+'px" height="'+h+'px" type="application/x-shockwave-flash" data="'+url+'">';
                str += '<param name="allowfullscreen" value="true" />' ;
                str += '<param name="wmode" value="transparent" />';
                str += '<param name="allowScriptAccess" value="always" />';
                str += '<param name="movie" value="'+url+'" />';
                str += '<embed src="'+url+'" type="application/x-shockwave-flash" wmode="transparent" width="'+w+'px" height="'+h+'px" allowscriptaccess="always" allowfullscreen="true"></embed>';
                str += '</object>';
                
            container.append(str);
        } else {
			linkContent = thumbItem.children('.data').children('a');
			linkImg = linkContent.children('img');

			var newLink = $('<a href="' + linkContent.attr('href') + '" title="' + linkContent.attr('title') + '"></a>'),
				newImg = $('<img />')
					.attr({src: linkImg.attr('src') , alt: linkImg.attr('alt')})
					.css({width: w+'px', height: h+'px', border: 0})
					.hide()
					.load(function(){ $(this).fadeIn(); })
					.appendTo(newLink);

			container.append(newLink);
		}
  };
  
  //insert link image
  function insertLinkImage(imgs, itemIndex){
    var itemsCount = imgs.thumbItem.length,
        wrapper = imgs.mainImageContainer.children('.wrapper');
    
        var img = wrapper.children('div').eq(itemIndex).children('img'),
            link = imgs.thumbItem.eq(itemIndex).children('.data').children('a'),
            linkUrl = link.attr('href');
        if (link.hasClass('lightbox')){
            img.wrap('<a href="'+linkUrl+'" class="lightbox" style="border:0; text-decoration:none; outline:0;"></a>');
        }
        else {
            img.wrap('<a href="'+linkUrl+'" style="border:0; text-decoration:none; outline:0;"></a>');
        }
    
    if (imgs.lightbox == true){
        var imageLink = wrapper.find('.lightbox');
        imageLink.bind('click', imgs, linkImageClick);
    }
    
  };
  
  //link image click
  function linkImageClick(event){
    var $this = $(this),
        imgs = event.data;
    
    createLightboxOverlay(imgs);
    
    var container = imgs.mainImageContainer.find('.lightbox') ;
    imgs.lightboxItemActive = container.index($this);
    
    return false ;
  };
  
  //sliding left main image
  function slideInLeft(imgs, currentActiveThumb){
    imgs.isAnimationRunning = true ;
    var mainImageContainer = imgs.mainImageContainer,
        containerWidth = mainImageContainer.width(),
        wrapper = mainImageContainer.children('.wrapper'),
        marginLeft = -containerWidth,
        wrapperChild = wrapper.children('div'),
        nextItem = wrapperChild.eq(imgs.thumbItemActive),
        currentItem = wrapperChild.eq(currentActiveThumb);
	
	wrapper.css({'marginLeft':'0'});
	currentItem
	    .css('left', '0')
	    .fadeOut(imgs.animationSpeed);
	    
	insertMainContents(imgs, nextItem);
	
	nextItem
	    .css({'top':'0', 'left':containerWidth+'px'})
	    .fadeIn(imgs.animationSpeed*2);
	    
	wrapper.animate({'marginLeft':marginLeft+'px'}, imgs.animationSpeed, imgs.transitionEasing, function(){
	            currentItem.hide();
	            currentItem.children().remove();
	            imgs.isAnimationRunning = false ;   
	        });	
  };
  
  //sliding right
  function slideInRight(imgs, currentActiveThumb){
    imgs.isAnimationRunning = true ;
    var mainImageContainer = imgs.mainImageContainer,
        containerWidth = mainImageContainer.width(),
        wrapper = mainImageContainer.children('.wrapper'),
        marginLeft = -containerWidth,
        wrapperChild = wrapper.children('div'),
        nextItem = wrapperChild.eq(imgs.thumbItemActive),
        currentItem = wrapperChild.eq(currentActiveThumb);
	
	wrapper.css({'marginLeft':marginLeft+'px'});
	currentItem
	    .css('left', containerWidth+'px')
	    .fadeOut(imgs.animationSpeed);
	    
	insertMainContents(imgs, nextItem);
		
	nextItem
	    .css({'top':'0', 'left':'0'})
	    .fadeIn(imgs.animationSpeed*2);	
	    
    wrapper.animate({'marginLeft':'0'}, imgs.animationSpeed, imgs.transitionEasing, function(){
	            currentItem.hide();
	            currentItem.children().remove();  
	            imgs.isAnimationRunning = false ;
	        });
  };
  
  //swipe in left
  function swipeInLeft(imgs, currentActiveThumb){
    imgs.isAnimationRunning = true ;
    var mainImageContainer = imgs.mainImageContainer,
        containerWidth = mainImageContainer.width(),
        wrapper = mainImageContainer.children('.wrapper'),
        wrapperChild = wrapper.children('div'),
        nextItem = wrapperChild.eq(imgs.thumbItemActive),
        currentItem = wrapperChild.eq(currentActiveThumb);
        
    insertMainContents(imgs, nextItem);
	
	nextItem 
	    .css({'left':containerWidth+'px', 'z-index':'999'})
	    .show('fast', function(){
	        var $this = $(this) ;
	        $this.animate({'left':'0'}, imgs.animationSpeed, imgs.transitionEasing, function(){
	            currentItem.hide();
	            currentItem.children().remove();
	            $this.css('z-index', '0');
	            imgs.isAnimationRunning = false ;    
	        });
	    });
	    
  }; 
  
  //swipe in right
  function swipeInRight(imgs, currentActiveThumb){
    imgs.isAnimationRunning = true ;
    var mainImageContainer = imgs.mainImageContainer,
        containerWidth = mainImageContainer.width(),
        wrapper = mainImageContainer.children('.wrapper'),
        wrapperChild = wrapper.children('div'),
        nextItem = wrapperChild.eq(imgs.thumbItemActive),
        currentItem = wrapperChild.eq(currentActiveThumb);
        
    insertMainContents(imgs, nextItem);
	
	nextItem 
	    .css({'left':-containerWidth+'px', 'z-index':'999'})
	    .show('fast', function(){
	        var $this = $(this) ;
	        $this.animate({'left':'0'}, imgs.animationSpeed, imgs.transitionEasing, function(){
	            currentItem.hide();
	            currentItem.children().remove();
	            $this.css('z-index', '0');
	            imgs.isAnimationRunning = false ;    
	        });
	    });
  }; 
  
  //fade in
  function fadeIn(imgs, currentActiveThumb){
    imgs.isAnimationRunning = true ;
    var wrapper = imgs.mainImageContainer.children('.wrapper'),
        wrapperChild = wrapper.children('div'),
        nextItem = wrapperChild.eq(imgs.thumbItemActive),
        currentItem = wrapperChild.eq(currentActiveThumb);
        
    insertMainContents(imgs, nextItem);
	
	currentItem.fadeOut(imgs.animationSpeed, function(){
	    $(this).children().remove();
	});
	nextItem.fadeIn(imgs.animationSpeed, function(){
	    imgs.isAnimationRunning = false ;
	});
  };
  
  
  
  /* _____________________________________________________________________________ */
  
  /* AUTOPLAY */
  /* _____________________________________________________________________________ */
  
  //show next image
  function showNextImage(imgs){
    if (imgs.isAnimationRunning == true){
        return ;
    }
    
    var currentActiveThumb = imgs.thumbItemActive;
     
    if (imgs.thumbItemActive == (imgs.thumbItem.length - 1)){
        if (imgs.cycle == true){
            imgs.thumbItemActive = 0;
        }
        else {
            imgs.pauseAutoplay = true ;
            stopAutoplay();
            return ;
        }
    }
    else {
        imgs.thumbItemActive += 1;
    }
    
    removeThumbsActiveStyle(imgs);
    stylingActiveThumbnail(imgs);
    showDescription(imgs);
    
    var transition = imgs.transition;
    if (transition == 'slide'){
        slideInLeft(imgs, currentActiveThumb);
    }
    else if(transition == 'swipe'){
        swipeInLeft(imgs, currentActiveThumb);
    }
    else if (transition == 'fade'){
        fadeIn(imgs, currentActiveThumb);
    }
    
    imgs.apiScroll.scrollToElement(imgs.thumbItem.eq(imgs.thumbItemActive), true);
        
  };
  
  //run autoplay
  function runAutoplay(imgs){
        intervalProcess = setInterval(function(){
            showNextImage(imgs);
            }, imgs.autoplayInterval);
  };
  
  //stop autoplay
  function stopAutoplay(){
    clearInterval(intervalProcess);
    return ;
  };
  
  //create play control
  function createPlayControl(imgs){
    var mainImageContainer = imgs.mainImageContainer;
    
    $('<div class="play"></div>')
        .hide()
        .click(function(){
            imgs.pauseButton = false;
            playAutoplay(imgs);
            $(this).fadeOut(function(){mainImageContainer.children('.pause').fadeIn();});
        })
        .appendTo(mainImageContainer);
        
    mainImageContainer.hover(function(){
        if (imgs.pauseAutoplay == true){
            $(this).children('.play').fadeIn();
        }
    }, function(){
        $(this).children('.play').fadeOut();
    });
  };
  
  //create pause control
  function createPauseControl(imgs){
    var mainImageContainer = imgs.mainImageContainer;
    
    $('<div class="pause"></div>')
        .hide()
        .click(function(){
            imgs.pauseButton = true ;
            pauseAutoplay(imgs);
            $(this).fadeOut(function(){mainImageContainer.children('.play').fadeIn();});
        })
        .appendTo(mainImageContainer);
        
    mainImageContainer.hover(function(){
        if (imgs.pauseAutoplay == false){
            $(this).children('.pause').fadeIn();
        }
    }, function(){
        $(this).children('.pause').fadeOut();
    });
  };
  
  //pause autoplay
  function pauseAutoplay(imgs){
    imgs.pauseAutoplay = true ;
    stopAutoplay();
  }
  
  //play autoplay
  function playAutoplay(imgs){
    imgs.pauseAutoplay = false ;
    runAutoplay(imgs);
  }
  
  /* ____________________________________________________________________________________ */
  
  /* MOUSE */
  /* ____________________________________________________________________________________ */
  
  //mouse wheel down
  function mouseWheelDown(imgs){
     imgs.apiScroll.scrollByX(imgs.mouseSpeed);
  };
  
  //mouse whell up
  function mouseWheelUp(imgs){
    imgs.apiScroll.scrollByX(-imgs.mouseSpeed);
  };
  
 
  
  /* _____________________________________________________________________________ */
  
  /* LIGHTBOX */
  /* _____________________________________________________________________________ */
  
  //create lightbox overlay
  function createLightboxOverlay(imgs){
    var $doc = $(document);
    $('<div class="lightboxOverlay"></div>')
        .css({'position':'absolute', 'left':'0', 'top':'0', 'z-index':'9997', 'width':$doc.width()+'px', 'height':$doc.height()+'px'})
        .hide()
        .bind('click', imgs, overlayClick)
        .fadeIn(function(){
            createLightbox(imgs);
        })
        .appendTo('body');
    
    imgs.isLightboxRunning = true  ;
    
    if (imgs.autoplay == true){
        if (imgs.pauseButton == false){
            pauseAutoplay(imgs);           
        }
    }
  };
  
  //remove lightbox
  function removeLightbox(imgs){
    $('.lightboxOverlay, .lightboxContainer').fadeOut(function(){
        $(this).remove();
    });
    
    if (imgs.autoplay == true){
        if (imgs.pauseButton == false){
            playAutoplay(imgs);
        }        
    }
    
    imgs.isLightboxRunning = false ;
  };
  
  //overlay click
  function overlayClick(event){
    var imgs = event.data;
    removeLightbox(imgs);
  };
  
  //create lightbox
  function createLightbox(imgs){
    $('<div class="lightboxContainer"></div>')
        .css({'position':'absolute', 'z-index':'9999'})
        .hide()    
        .appendTo('body');
        
    centeringLightbox(imgs);
  };
  
  
  //centering lightbox
  function centeringLightbox(imgs){
    var $window = $(window),
        w = $window.width(),
        h = $window.height(),
        lightboxContainer = $('.lightboxContainer'),
        lightboxWidth = lightboxContainer.outerWidth(true),
        lightboxHeight = lightboxContainer.outerHeight(true),
        leftPosition = ((w - lightboxWidth) / 2) + $window.scrollLeft(),
        topPosition = ((h - lightboxHeight) / 2) + $window.scrollTop();
    
    lightboxContainer
        .css({'left':leftPosition+'px', 'top':topPosition+'px'})
        .fadeIn(function(){
            createLightboxImage(imgs, imgs.thumbItemActive);
        });
  };
  
  //create lightbox title
  function createLightboxTitle(imgs, container){
    var lightboxContainer = $('.lightboxContainer'),
        contentWidth = lightboxContainer.children(container).width(),
        title =  imgs.thumbItem.eq(imgs.thumbItemActive).children('.data').find('.lightbox').attr('title');
    
    $('<div class="lightboxTitle">'+title+'</div>')
        .hide()
        .css({'width':contentWidth+'px', 'height':'auto'})
        .appendTo(lightboxContainer);
  };
  
  //create lightbox control
  function createLightboxControls(imgs, container){
    var lightboxContainer = $('.lightboxContainer'),
        contentWidth = lightboxContainer.children(container).width();
    
    $('<div class="lightboxControls"></div>')
        .hide()
        .css({'position':'relative', 'width':contentWidth+'px'})
        .append('<div class="close_button"></div>')
        .appendTo(lightboxContainer);
        
    $('.lightboxContainer .lightboxControls .close_button').click(function(){
        removeLightbox(imgs);
    });

  };
    
  //create lightbox image
  function createLightboxImage(imgs, itemIndex){
    var item = imgs.thumbItem.eq(itemIndex),
        imgUrl = item.children('.data').find('.lightbox').attr('href'),
        imgAlt = item.find('img').attr('alt'),
        arrFile = getFileType(imgs, imgUrl ),
        type = arrFile[0],
        url = arrFile[1];
    
    if (type == 'image'){
        var lightboxContainer = $('.lightboxContainer');
        
        $('<div class="lightboxImage"></div>')
		    .hide()
		    .css({'position':'relative', 'border':'0'})
		    .appendTo(lightboxContainer);
		    
		var lightboxImage = lightboxContainer.children('.lightboxImage');
		
		var image = new Image();
		image.src = url;
		
		lightboxImage.html('<img src="'+url+'" alt="'+imgAlt+'" width="'+image.width+'" height="'+image.height+'" />');
                
        lightboxImage.children('img').load(function(){
            createLightboxTitle(imgs, lightboxImage);
            createLightboxControls(imgs, lightboxImage);
            resizeLightbox(imgs, lightboxImage);
        });
    }
    else if (type == 'video'){
        var lightboxContainer = $('.lightboxContainer');
        
        $('<div class="lightboxVideo"></div>')
		    .hide()
		    .css({'position':'relative', 'border':'0', 'width':arrFile[2]+'px', 'height':arrFile[3]+'px'})
		    .appendTo(lightboxContainer);
		
		var lightboxVideo = lightboxContainer.children('.lightboxVideo');
        
        $('<iframe></iframe>')
            .attr({'width':arrFile[2]+'px', 'height':arrFile[3]+'px', 'src':url, 'frameborder':'0'})
            .appendTo(lightboxVideo);
            
        lightboxVideo.children('iframe').load(function(){
            createLightboxTitle(imgs, lightboxVideo);
            createLightboxControls(imgs, lightboxVideo);
            resizeLightbox(imgs, lightboxVideo);
        });
    }
    else if(type == 'map'){
        var lightboxContainer = $('.lightboxContainer');
        
        $('<div class="lightboxMap"></div>')
		    .css({'position':'relative', 'border':'0', 'width':arrFile[2]+'px', 'height':arrFile[3]+'px'})
		    .appendTo(lightboxContainer);
		    
		var lightboxMap = lightboxContainer.children('.lightboxMap');
		createLightboxTitle(imgs, lightboxMap);
        createLightboxControls(imgs, lightboxMap);
        resizeLightbox(imgs, lightboxMap);
		
		lightboxMap.html('<iframe width="'+arrFile[2]+'px" height="'+arrFile[3]+'px" src="'+url+'" frameborder="0" style="margin:0; padding:0;"></iframe>');
        
    }
    else if (type == 'streetview'){
        var lightboxContainer = $('.lightboxContainer');
        
        $('<div class="lightboxSv"></div>')
		    .hide()
		    .css({'position':'relative', 'border':'0', 'width':arrFile[2]+'px', 'height':arrFile[3]+'px'})
		    .appendTo(lightboxContainer);
		    
		var lightboxSv = lightboxContainer.children('.lightboxSv') ;
                
        $('<iframe></iframe>')
            .attr({'width':arrFile[2], 'height':arrFile[3], 'src':url, 'frameborder':0, 'scrolling':'no'})
            .appendTo(lightboxSv);
            
        lightboxSv.children('iframe').load(function(){
            createLightboxTitle(imgs, lightboxSv);
            createLightboxControls(imgs, lightboxSv);
            resizeLightbox(imgs, lightboxSv);
        });
            
    }
    else if (type == 'object' || type == 'swf'){
        var lightboxContainer = $('.lightboxContainer'),
            str = '<object width="'+arrFile[2]+'px" height="'+arrFile[3]+'px" type="application/x-shockwave-flash" data="'+url+'">';
        str += '<param name="allowfullscreen" value="true" />' ;
        str += '<param name="wmode" value="transparent" />';
        str += '<param name="allowScriptAccess" value="always" />';
        str += '<param name="movie" value="'+url+'" />';
        str += '<embed src="'+url+'" type="application/x-shockwave-flash" wmode="transparent" width="'+arrFile[2]+'px" height="'+arrFile[3]+'px" allowscriptaccess="always" allowfullscreen="true"></embed>';
        str += '</object>';
        
        var bgColor = lightboxContainer.css('backgroundColor'),
            bgImage = lightboxContainer.css('backgroundImage');
        
        $('<div class="lightboxObject"></div>')
		    .hide()
		    .css({'position':'relative', 'border':'0', 'width':arrFile[2]+'px', 'height':arrFile[3]+'px'})
		    .appendTo(lightboxContainer);
		
		var lightboxObject = lightboxContainer.children('.lightboxObject');
            
        lightboxObject.fadeIn(function(){
            $(this).append(str);
            createLightboxTitle(imgs, lightboxObject);
            createLightboxControls(imgs, lightboxObject);
            resizeLightbox(imgs, lightboxObject);
        });
    }
  };
  
  //resize lightbox
  function resizeLightbox(imgs, container){
    var lightboxContainer = $('.lightboxContainer'),
        lightboxBorderLeft = parseInt(lightboxContainer.css('borderLeftWidth')),
        lightboxBorderRight = parseInt(lightboxContainer.css('borderRightWidth')),
        contentWidth = container.width(),
        lightboxNewWidth = lightboxBorderLeft + lightboxBorderRight + contentWidth,
        lightboxBorderTop = parseInt(lightboxContainer.css('borderTopWidth')),
        lightboxBorderBottom = parseInt(lightboxContainer.css('borderBottomWidth')),
        titleHeight = lightboxContainer.children('.lightboxTitle').outerHeight(true),
        controlsHeight =  lightboxContainer.children('.lightboxControls').outerHeight(true),
        contentHeight = container.height() + titleHeight + controlsHeight,
        lightboxNewHeight = lightboxBorderTop + lightboxBorderBottom + contentHeight,
        $doc = $(document),
        docWidth = $doc.width(),
        docHeight = $doc.height(),
        lightboxOverlay = $('.lightboxOverlay'),
        overlayWidth = lightboxOverlay.width(),
        overlayHeight = lightboxOverlay.height(),
        $window = $(window),
        w = $window.width(),
        h = $window.height(),
        leftPosition = ((w - lightboxNewWidth) / 2) + $window.scrollLeft(),
        topPosition = ((h - lightboxNewHeight) / 2) + $window.scrollTop();
    
    if (lightboxNewHeight > h){
        topPosition = 20 + $window.scrollTop();
    }
    
    if (lightboxNewWidth > w){
        leftPosition = 20 + $window.scrollLeft();
    }
    
    if (lightboxNewHeight > overlayHeight){
        topPosition = 20 + $window.scrollTop();
        lightboxOverlay.css('height', lightboxNewHeight + 40 +'px');
    }
    
    if (lightboxNewWidth > overlayWidth){
        leftPosition = 20 + $(window).scrollLeft();
        lightboxOverlay.css('width', lightboxNewWidth + 40 +'px');
    }    
    
    lightboxContainer.animate({'left':leftPosition+'px', 'top':topPosition+'px', 'width':contentWidth+'px', 'height':contentHeight+'px'}, function(){
        var $this = $(this);
        
        container.fadeIn();
        $this.children('.lightboxTitle').fadeIn();
        $this.children('.lightboxControls').fadeIn();
        
    });
    
  };
  
		
})( jQuery );

