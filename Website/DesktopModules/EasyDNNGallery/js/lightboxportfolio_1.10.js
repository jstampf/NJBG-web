(function () {
var lightboxPortfolio = function ($) {
	$.fn.portfolioSetter = function (options) {
		var defaults = {
				//default settings
				ppanimationSpeed: false,
				ppgroup: 'M300',
				pptheme: 'dark_rounded',
				ppslideshow: false,
				ppautoplay_slideshow: false,
				ppoverlay_gallery: false,
				ppLightboxTitle: 'false',
				ppLightboxDescription: 'false',
				ppMediaTitle: 'false',
				ppMediaDescription: 'false',
				pfqtip: 'false',
				pfShowQtip: 'false',
				pfdiv: 'EasyDNNGallery',
				pfShowEffect: 'slide',
				pfHideEffect: 'slide',
				pfShowDuration: '300',
				pfHideDuration: '300',
				pfTargetPos: 'topMiddle',
				pfTooltipPos: 'topMiddle',
				pfTheme: 'cream',
				pfcorner: 5,
				pfradius: 5,
				pfOpenMediaUrl: 'False',
				pfOpenMediaTarget: '_self',
				//Lightbox options
				ppprint_image_text: 'Print image',
				ppitem_emailing_text: 'Email link',
				ppitem_emailing_subject: 'Email subject',
				ppallow_image_printing: false,
				ppenable_item_emailing: false,
				ppshow_social_sharing: false,
				ppdownload_handler_url: 'false',

				itemMargin: 10,  //margin of each of the portfolio items
				showCategories: true,
				myshowCategories: true,  // if set to false, the categories will be hidden
				allText: 'ALL', //the ALL text displayed before the categories names
				showAllBtn: true, // change
				easing: 'easeOutExpo', //the animation easing
				animationSpeed: 800, //the speed of the animation of the pagination
				navButtonWidth: 21,  //the width of the pagination button
				xmlSource: 'portfolio.xml',  //the XML file from which the data is exctracted
				navigationId: 'portfolio_pagination',  //the ID of the pagination div
				categoriesId: 'portfolio_categories', //the ID of the categories div
				itemClass: 'EDGimage', //the class of the div that wraps each portfolio item data
				itemsPerPage: 0,
				downloadItemText: 'Download',

				categorySelector: 'classic', //classic, dropdown, left
				categorySelectorSlideable: false,
				sidewayCatsWidth: 200,

				showNavigationArrows: true,
				hidableNavigationArrows: true,
				hideNavigationArrowsOnEnds: false,
				customTitle: false,
				fullscreenable: true,
				fullscreenButtonText: 'Show fullscreen',
				moduleCssId: 'EDG_0_Shadow',
				fullscreenCssId: 'EDG_0_Shadow',
				scrollableContent: false,

				// dropdown and arrows sprite files
				navDDMFile: false,
				navArrowsFile: false,

				// XML request parameters
				xmlRequestParams: {
					GalleryType: 'portfolio',
					ModuleID: 0,
					ModulePath: '/DesktopModules/EasyDNNGallery/',
					PortalHome: '/Portals/0/',
					PortalID: 0,
					LocaleCode: 'False',
					Html5Video: 'False',
					Html5Audio: 'False'
				},

				// Rendering options
				maxImgWidth: 150,
				maxImgHeight: 150,
				containerWidth: 710,
				containerHeight: 410,
				smartResize: true,
				spaceOutPage: true,
				fullscreenMode: false,
				containerWidthIsRatio: false,

				showSharingButtons: {
					facebook: false,
					twitter: false,
					gplus: false
				},

				itemToOpen: false
			},
			options = $.extend(defaults, options),

		//define some helper variables
			categories = [], items = [], pageWrappers = [], imagesLoaded = 0, counter = 0, ie = false, categoryHolder,

			root = $('<div />'),
			rootParent = $(this),
			rootGrandparent = rootParent.parent(),

		// Dropdown category selector vars
			$portfolioCategoriesDropdown, $portfolioCategoriesDropdownSelector, $portfolioCategoriesDropdownContainer, dropdownCategorySelectorTimer = null,

		// Navigation arrows
			$navigationArrowLeft, $navigationArrowRight,

		// Rendering vars
			rendering = {
				masterContainerWidth: 0,
				containerWidth: 0,
				containerRealWidth: 0,
				itemContainerWidth: 0,
				itemContainerHeight: 0,
				itemTopSpace: 0,
				itemLeftSpace: 0,
				itemsPerPage: 0,
				maxItemsPerRow: 0,
				maxRowCount: 0,
				pageCount: 0,
				pageRightPadding: 0,
				pageWidth: 0,
				pageHeight: 0,
				valuesInitialized: false,
				innitialCategory: null,
				hasDownloadableItems: false,
				sidewayCategories: (options.categorySelector == 'left' || options.categorySelector == 'right' ? true : false),
				initialItemOpened: false,
				itemsLoaded: false
			};

		rendering.masterContainerWidth = rootGrandparent.parents('.portfolioDimensionsContainer').width();

		if (options.containerWidthIsRatio) {
			options.itemsPerPage = 0;
			rendering.containerWidth = rendering.containerRealWidth = Math.floor(options.containerWidth * rendering.masterContainerWidth);
		} else {
			rendering.containerWidth = rendering.containerRealWidth = options.containerWidth;
		}

		if (rendering.sidewayCategories)
			rendering.containerWidth -= options.sidewayCatsWidth;

		root.css({ width: (rendering.containerWidth), height: options.containerHeight, 'float': 'left' });

		rootParent
			.css({ width: rendering.containerWidth, height: 'auto', overflow: 'hidden' })
			.append(root);

		var grandparentCss = {width: rendering.containerWidth};

		if (options.containerWidthIsRatio && options.containerWidth != 1) {
			grandparentCss.position = 'relative';
			grandparentCss.left = Math.floor((rendering.masterContainerWidth - rendering.containerRealWidth) / 2);
		}

		rootGrandparent
			.addClass('portfolio_gallery_container')
			.css(grandparentCss);

		if (rendering.sidewayCategories) {
			if (options.categorySelector == 'left')
				rootGrandparent.css({
					marginLeft: options.sidewayCatsWidth
				});
			else
				rootGrandparent.css({
					marginRight: options.sidewayCatsWidth
				});
		}

		if (options.fullscreenMode) {
			options.ppgroup = options.ppgroup + '_fullscreen';

			options.navigationId = options.navigationId + '_fullscreen';
			options.categoriesId = options.categoriesId + '_fullscreen';
		}

		init();
		function init() {
			rootParent.append('<div class="loading"></div>');
			loadItems();
		}

		if (options.containerWidthIsRatio)
			$(window).resize(function () {
				var runResize = function () {
						var grandparentCss;

						rendering.masterContainerWidth = rootGrandparent.parents('.portfolioDimensionsContainer').width();

						rendering.containerWidth = rendering.containerRealWidth = Math.floor(options.containerWidth * rendering.masterContainerWidth);

						if (rendering.sidewayCategories)
							rendering.containerWidth -= options.sidewayCatsWidth;

						root.css({ width: rendering.containerWidth});

						rootParent.css({ width: rendering.containerWidth});

						grandparentCss = {width: rendering.containerWidth};
						if (options.containerWidth != 1) {
							grandparentCss.left = Math.floor((rendering.masterContainerWidth - rendering.containerRealWidth) / 2);
						}

						rootGrandparent.css(grandparentCss);

						rendering.valuesInitialized = false;

						displayItems();
					},
					timeout;

				clearTimeout(timeout);
				timeout = setTimeout(runResize, 50);
			});

		if (options.fullscreenMode) {
			var $fullscreenMain = rootGrandparent.parent(),
				$fullscreenWrapper = $fullscreenMain.parent(),
				cat_wrapper_width;

			$fullscreenMain
				.bind('resize_gallery', function () {
					rendering.containerWidth = $fullscreenMain.width();

					if (rendering.sidewayCategories)
						rendering.containerWidth -= options.sidewayCatsWidth;

					options.containerHeight = $fullscreenWrapper.height() - $fullscreenMain.data('initialOuterHeight') - (options.categorySelector == 'classic' ? (options.customTitle ? 135 : 107) : 70);

					root.height(options.containerHeight);
					rootParent.width(rendering.containerWidth);
					rootGrandparent.width(rendering.containerWidth);

					if (options.categorySelector == 'classic' && options.categorySelectorSlideable) {
						cat_wrapper_width = categoryHolder.width() - 30 - categoryHolder.find('> .EDG_portfolio_categories_classic_left').outerWidth(true);
						cat_wrapper_width -= categoryHolder.find('> .EDG_portfolio_categories_classic_arrow.left').outerWidth(true);
						cat_wrapper_width -= categoryHolder.find('> .EDG_portfolio_categories_classic_arrow.right').outerWidth(true);
						cat_wrapper_width -= categoryHolder.find('> .EDG_portfolio_categories_classic_right').outerWidth(true);
						categoryHolder.find('> .EDG_portfolio_categories_classic_wrapper').width(cat_wrapper_width);
					}

					rendering.valuesInitialized = false;

					displayItems()
				})
				.bind('toNextPage', function () {
					moveToNext();
				})
				.bind('toPrevPage', function () {
					moveToPrev();
				});
		} else {
			// show the fullscreen button if enabled
			if (options.fullscreenable) {
				rootParent.after('<div class="EasyDNNGallery_fullscreen_btn_container"><a class="EasyDNNGallery_fullscreen_btn" href="#" onclick="eds1_10().fullscreenPortfolioGallery(\'' + rootParent.attr('id') + '\'); return false;">' + options.fullscreenButtonText + '</a></div>');
			}
		}

		if (options.fullscreenMode || options.scrollableContent) {
			var scrollTarget = options.fullscreenMode ? $fullscreenWrapper : root;

			scrollTarget.bind('mousewheel.EasyDNNGallery_portfolio_mousewheel', function (event, delta) {
				if (delta > 0) {
					moveToPrev();
				} else {
					moveToNext();
				}

				return false;
			});
		}

		if (!options.fullscreenMode) {
			rootParent.data('EasyDNNGallery.portfolio.options', options);
		}


		/**
		* Parses the XML portfolio item data.
		*/
		function loadItems() {
			if (navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPod/i) || navigator.userAgent.match(/iPad/i)) {
				options.xmlRequestParams.Html5Video = 'True';
				options.xmlRequestParams.Html5Audio = 'True';
			}

			$.ajax({
				type: 'POST',
				url: options.xmlSource,
				dataType: 'xml',
				data: options.xmlRequestParams,
				cache: false,
				success: function (xml) {
					if (options.myshowCategories && (!options.showAllBtn || options.showCategories)) {
						//get the portfolio categories
						$(xml).find('categories').eq(0).find('category').each(function (i) {
							var current = $(this);
							var category = {
								id: current.attr('id'),
								name: current.text()
							};
							categories.push(category);
						});
					}

					//get the portfolio items
					$(xml).find('item').each(function (i) {
						var current = $(this),
							thum = current.find('thumbnail:first').text().replace('\\', '/'),
							prev = current.find('preview:first').text(),
							cat = current.find('category:first').text().split(','),
							desc = current.find('description:first').text(),
							imgtitle = current.find('title:first').text(),
							imgalt = current.find('title:first').text(),
							imgdesc = current.find('description:first').text(),
							imgURL = current.find('mediaURL:first').text(),
							mediatype = current.find('mediatype:first').text(),
							downloadItemUrl = current.find('downhref:first').text(),
							edgpid = current.find('edgpid:first').text(),
							lbnestedurl = current.find('lbnestedurl:first').text(),
							html5_video = current.find('html5_video:first').text(),
							html5_audio = current.find('html5_audio:first').text(),
							cssClass = 'empty';

						if (downloadItemUrl != 'false') {
							rendering.hasDownloadableItems = true;
						}

						if (imgtitle.length > 0 && options.ppMediaTitle == 'true') {
							cssClass = 'title';
						}

						if (desc.length > 0 && options.ppMediaDescription == 'true') {
							cssClass = 'title';
						}

						if (options.ppLightboxTitle == 'false') {
							imgalt = '';
						}

						if (options.ppLightboxDescription == 'false') {
							imgdesc = '';
						}

						if (options.ppMediaTitle == 'false') {
							imgtitle = '';

						}

						if (options.ppMediaDescription == 'false') {
							desc = '';

						}
						medTarget = options.pfOpenMediaTarget;
						relTag = "prettyPhoto";
						if (options.pfOpenMediaUrl == 'True' && mediatype == "Image") {
							prev = imgURL;
							relTag = "";
						}
						else {
							medTarget = "";
						}

						var itemData = {
							itemClass: options.itemClass,
							relTag: relTag,
							ppgroup: options.ppgroup,
							prev: prev,
							imgdesc: imgdesc,
							medTarget: medTarget,
							imgalt: imgalt,
							thum: thum,
							cssClass: cssClass,
							imgtitle: imgtitle,
							desc: desc,
							downloadItemUrl: downloadItemUrl,
							edgpid: edgpid,
							lbnestedurl: lbnestedurl,
							html5_video: html5_video,
							html5_audio: html5_audio
						},
							item = {
								thumbnail: thum,
								category: cat,
								data: itemData,
								obj: generateItemObject(itemData)
							};
						items.push(item);
					});

					setSetter();
				}
			});
		}

		/**
		* Calls the main functions for setting the portfolio items.
		*/
		function setSetter() {
			if ($.browser.msie) {
				ie = true;
			}
			root.siblings('.loading').remove();
			root.after('<div id="' + options.navigationId + '" class="EDG_portfolio_pagination"><ul></ul></div>');
			if (options.fullscreenMode) {
				rootParent.before('<a href="#" class="closeFullscreenBtn ' + options.categorySelector + '"></a>');
				$fullscreenMain.trigger('fullscreen_close_btn_initialized');
			}

			if (options.myshowCategories) {
				displayCategories();
			}
			if (options.customTitle) {
				if (options.categorySelector == 'dropdown' || options.categorySelector == 'classic') {
					rootParent.before('<h1 class="portfolio_custom_title">' + options.customTitle + '</h1>');
				}
			} else {
				if (options.categorySelector == 'dropdown') {
					rootParent.before('<h1 class="portfolio_custom_title">&nbsp;</h1>');
				}
			}
			loadImages();

		}

		/**
		* Displays the categories.
		*/
		function displayCategories() {
			switch (options.categorySelector) {
				case 'dropdown':
					displayDropdownCategories();
					break;

				case 'left':
				case 'right':
					displaySidewayCategories();
					break;

				default:
					displayClassicCategories();
			}
		}

		function displaySidewayCategories() {
			var catNumber = categories.length,
				i = 0,
				categories_html = '',
				css_object,
				cat_list;

			categoryHolder = $('<div id="' + options.categoriesId + '" class="portfolio_gallery_categories_sideways ' + options.categorySelector + '">' + (options.customTitle ? '<h1><span>' + options.customTitle + '</span></h1>' : '') + '<ul></ul></div>');
			cat_list = categoryHolder.find('> ul');

			rootParent.before(categoryHolder);

			css_object = {
				height: options.containerHeight - (categoryHolder.outerHeight(true) - categoryHolder.height()),
				width: options.sidewayCatsWidth - (categoryHolder.outerWidth(true) - categoryHolder.width())
			};

			if (options.categorySelector == 'left')
				css_object.marginLeft = -options.sidewayCatsWidth;
			else
				css_object.marginRight = -options.sidewayCatsWidth;

			categoryHolder.css(css_object);

			//add all the category names to the list
			for (; i < catNumber; i++) {
				categories_html += '<li><a href="#">' + categories[i].name + '</a><span class="id">' + categories[i].id + '</span></li>';
			}

			cat_list.append(categories_html);

			if (options.showAllBtn) {
				//add the ALL link
				cat_list.prepend('<li class="selected"><a href="#">' + options.allText + '</a><span class="id">0</span></li>');
			} else {
				cat_list.find('> li').eq(0).addClass('selected');
				rendering.innitialCategory = categories[0].id;
			}

			cat_list.delegate('a', 'click', function () {
				var $clicked = $(this),
					galleryId = $clicked.siblings('span.id').text();

				$clicked.parent()
					.addClass('selected')
					.siblings()
						.removeClass('selected');

				if (galleryId == '0')
					displayItems();
				else
					displayItems(galleryId);

				return false;
			});
		}

		/**
		* Displays the dropdown category selector.
		*/
		function displayDropdownCategories() {
			categoryHolder = $('<div class="portfolio_gallery_categories_dropdown" class="portfolio_gallery_category_selector"></div>');
			categoryHolder.append('<a href="#" class="portfolio_categories_dropdown_selector"><span></span></a><div class="portfolio_categories_dropdown_container"><ul></ul></div>');
			rootParent.before(categoryHolder);

			var catUl = categoryHolder.find('ul'),
				selectedCat = categoryHolder.find('.portfolio_categories_dropdown_selector');

			selectedCat
				.children('span:first').text(options.showAllBtn ? options.allText : categories[0].name)
				.click(function () {
					return false;
				});

			if (options.showAllBtn) {
				//add the ALL link
				catUl.append('<li><a href="#">' + options.allText + '</a><span class="id">0</span></li>');
			} else {
				rendering.innitialCategory = categories[0].id;
			}

			//add all the category names to the list
			var catNumber = categories.length;
			for (var i = 0; i < catNumber; i++) {
				catUl.append('<li><a href="#">' + categories[i].name + '</a><span class="id">' + categories[i].id + '</span></li>');
			};

			$portfolioCategoriesDropdown = rootGrandparent.children('.portfolio_gallery_categories_dropdown');
			$portfolioCategoriesDropdownSelector = rootGrandparent.find('.portfolio_categories_dropdown_selector');
			$portfolioCategoriesDropdownContainer = rootGrandparent.find('.portfolio_categories_dropdown_container');

			if (options.navDDMFile) {
				$portfolioCategoriesDropdownSelector.css('background-image', 'url("' + options.navDDMFile + '")');
				$portfolioCategoriesDropdownContainer.find('a').css('background-image', 'url("' + options.navDDMFile + '")');
			}

			// Preload dropdown background
			(new Image()).src = options.xmlRequestParams.ModulePath + 'Themes/portfolio/bgrd_gray_tr.png';

			$portfolioCategoriesDropdownContainer
				.data('closable', true)
				.delegate('a', 'click', function () {
					var $clicked = $(this), galleryId;

					$portfolioCategoriesDropdownSelector.find('span:first').text($clicked.text());
					$portfolioCategoriesDropdownContainer.hide();

					galleryId = $clicked.parent().children('span.id').text();
					if (galleryId == '0') {
						displayItems();
					} else {
						displayItems(galleryId);
					}

					return false;
				})
				.mouseover(function () {
					clearTimeout(dropdownCategorySelectorTimer);
					$portfolioCategoriesDropdownContainer.data('closable', false);
				})
				.mouseout(function () {
					$portfolioCategoriesDropdownContainer.data('closable', true);
					dropdownCategorySelectorTimer = setTimeout(function () {
						if ($portfolioCategoriesDropdownContainer.data('closable')) {
							$portfolioCategoriesDropdownContainer.hide();
						}
					}, 150);
				});

			$portfolioCategoriesDropdownSelector
				.mouseover(function () {
					$portfolioCategoriesDropdownContainer.data('closable', false);
					$portfolioCategoriesDropdownContainer.show();
				})
				.mouseout(function () {
					$portfolioCategoriesDropdownContainer.data('closable', true);
					dropdownCategorySelectorTimer = setTimeout(function () {
						if ($portfolioCategoriesDropdownContainer.data('closable')) {
							$portfolioCategoriesDropdownContainer.hide();
						}
					}, 150);
				});
		}

		/**
		* Displays the classic category selector.
		*/
		function displayClassicCategories() {
			categoryHolder = $('<div id="' + options.categoriesId + '" class="EDG_portfolio_categories_classic"></div>');

			if (options.categorySelectorSlideable) {
				categoryHolder
					.css({
						visibility: 'hidden'
					})
					.append('<div class="EDG_portfolio_categories_classic_left"></div><div class="EDG_portfolio_categories_classic_arrow left"></div><div class="EDG_portfolio_categories_classic_wrapper" style="float: left; position: relative; top: 0; left: 0; margin: 0 15px; padding: 0; overflow: hidden;"><ul style="padding: 0;"></ul></div><div class="EDG_portfolio_categories_classic_right"></div><div class="EDG_portfolio_categories_classic_arrow right"></div>');

				categoryHolder.find('> .EDG_portfolio_categories_classic_arrow').click(function () {
					var $clicked = $(this),
						$categories = $clicked.parent().find('ul'),
						new_left,
						max_to_left;

					new_left = parseInt($categories.css('left'));

					if ($clicked.hasClass('left')) {
						new_left += 40;

						if (new_left > 0)
							new_left = 0;
					} else {
						new_left -= 40;

						max_to_left = -($categories.outerWidth(true) - 40);

						if (new_left < max_to_left)
							new_left = max_to_left;
					}
					$categories.css('left', new_left);

					return false;
				});
			} else
				categoryHolder.append('<div class="EDG_portfolio_categories_classic_left"></div><ul></ul><div class="EDG_portfolio_categories_classic_right"></div>');

			root.before(categoryHolder);

			var catUl = categoryHolder.find('ul'),
				cat_wrapper = categoryHolder.find('> .EDG_portfolio_categories_classic_wrapper'),
				cat_wrapper_width,
				all_categories,
				all_categories_width = 0;

			if (options.categorySelectorSlideable) {
				cat_wrapper_width = categoryHolder.width() - 30 - categoryHolder.find('> .EDG_portfolio_categories_classic_left').outerWidth(true);
				cat_wrapper_width -= categoryHolder.find('> .EDG_portfolio_categories_classic_arrow.left').outerWidth(true);
				cat_wrapper_width -= categoryHolder.find('> .EDG_portfolio_categories_classic_arrow.right').outerWidth(true);
				cat_wrapper_width -= categoryHolder.find('> .EDG_portfolio_categories_classic_right').outerWidth(true);
				cat_wrapper.width(cat_wrapper_width);

				categoryHolder.css('visibility', '');

				catUl.width(50000);
			}

			if (options.showAllBtn) {
				//add the ALL link
				var allLink = $('<li>' + options.allText + '</li>');
				catUl.append(allLink);
				showSelectedCat(allLink);

				//bind the click event
				allLink.bind({
					'click': function () {
						displayItems();
						showSelectedCat($(this));

						return false;
					},
					'mouseover': function () {
						$(this).css({ cursor: 'pointer' });
					}
				});
			} else {
				rendering.innitialCategory = categories[0].id;
			}

			//add all the category names to the list
			var catNumber = categories.length;
			for (var i = 0; i < catNumber; i++) (function (i) {
				var category = $('<li>' + categories[i].name + '</li>');
				catUl.append(category);

				if (!options.showAllBtn && i === 0)
					showSelectedCat(category);

				//bind the click event
				category.bind({
					'click': function () {
						displayItems(categories[i].id);
						showSelectedCat($(this));

						return false;
					},
					'mouseover': function () {
						$(this).css({ cursor: 'pointer' });
					}
				});
			})(i);

			if (options.categorySelectorSlideable) {
				all_categories = catUl.find('> li');

				if (options.showAllBtn)
					catNumber += 1

				for (var i = 0; i < catNumber; i++)
					all_categories_width += all_categories.eq(i).outerWidth(true);

				catUl.width(all_categories_width);
			}
		}

		function showSelectedCat(selected) {
			//hide the previous selected element
			var prevSelected = categoryHolder.find('ul li.selected');
			if (prevSelected[0]) {
				var prevHtml = prevSelected.find('div.port_cat').html();
				prevSelected.html(prevHtml);
				prevSelected.removeClass('selected');
			}

			//show the new selected element
			var html = selected.html();
			selected.html('<div class="port_cat_active"><div class="port_cat_l"></div><div class="port_cat">' + html + '</div><div class="port_cat_r"></div> </div>');
			selected.addClass('selected');
		}

		/**
		* Loads the images. When all the images are loaded calls the displayItems 
		* function to display the images.
		*/
		function loadImages() {
			var imageCount = items.length;
			for (var i in items) {
				if (items.hasOwnProperty(i)) {
					var img = new Image();
					$(img).load(function () {
						imagesLoaded++;
						if (imagesLoaded === imageCount) {
							//all the images are loaded, display them all
							rendering.itemsLoaded = true;
							displayItems(rendering.innitialCategory);
						}
					}).attr('src', items[i].thumbnail);
				}
			}
		}

		/**
		* Displays the portfolio items.
		*/
		function displayItems() {
			var itemCount = items.length,
				catId = arguments[0],
				$currentEDGmain = null,
				$pageDiv = null,
				itemsDisplayed = 0;

			if (!rendering.itemsLoaded)
				return;

			root
				.html('')
				.animate({ marginLeft: 0 })
				.width(1);
			pageWrappers = [];

			// Determine the width and height of .EDGmainContainer
			if (!rendering.valuesInitialized) {
				rendering.valuesInitialized = true;
				items[0].obj.css('visibility', 'hidden');
				root.append(items[0].obj);
				$currentEDGmain = root.find('.EDGmain');

				rendering.itemContainerWidth = options.maxImgWidth + ($currentEDGmain.outerWidth(true) - $currentEDGmain.find('img').width());
				rendering.itemContainerHeight = options.maxImgHeight + ($currentEDGmain.outerHeight(true) - $currentEDGmain.find('img').height()) + (rendering.hasDownloadableItems ? 17 : 0);

				rendering.itemTopSpace = parseInt($currentEDGmain.css('borderTopWidth')) + parseInt($currentEDGmain.css('paddingTop')) + parseInt($currentEDGmain.css('marginTop'));
				rendering.itemLeftSpace = parseInt($currentEDGmain.css('borderLeftWidth')) + parseInt($currentEDGmain.css('paddingLeft')) + parseInt($currentEDGmain.css('marginLeft'));

				$currentEDGmain = null;
				root.html('');
				items[0].obj.css('visibility', '');

				// Calculate the rendering vars
				rendering.maxItemsPerRow = Math.floor(rendering.containerWidth / rendering.itemContainerWidth + 0.05);
				rendering.pageWidth = rendering.maxItemsPerRow * rendering.itemContainerWidth;

				if (!options.containerHeight) {
					if (!options.itemsPerPage) {
						options.containerHeight = 410;
					} else {
						options.containerHeight = Math.ceil(options.itemsPerPage / rendering.maxItemsPerRow) * rendering.itemContainerHeight;
						root.height(options.containerHeight);
					}
				}

				rendering.maxRowCount = Math.floor(options.containerHeight / rendering.itemContainerHeight + 0.15);
				rendering.itemsPerPage = options.itemsPerPage == 0 ? rendering.maxRowCount * rendering.maxItemsPerRow : options.itemsPerPage;
				rendering.pageHeight = rendering.maxRowCount * rendering.itemContainerHeight;
			}

			if (options.fullscreenMode) {
				if (rendering.pageWidth < rendering.containerWidth) {
					rendering.pageWidth = rendering.containerWidth;
				}
			} else {
				if (options.spaceOutPage && rendering.pageWidth < rendering.containerWidth) {
					rendering.pageRightPadding = rendering.containerWidth - rendering.pageWidth;
				}
			}

			for (var i = 0; i < itemCount; i++) {
				if (catId == undefined || (catId && array_contains(items[i].category, catId))) {
					if (itemsDisplayed % rendering.itemsPerPage === 0) {
						$pageDiv = $('<div />').css({ 'float': 'left', overflow: 'hidden', width: rendering.pageWidth, height: rendering.pageHeight, display: 'none', paddingRight: rendering.pageRightPadding });
						pageWrappers.push($pageDiv);
						root.width(root.width() + rendering.pageWidth + rendering.pageRightPadding);
						root.append($pageDiv);

						$pageDiv.fadeIn().animate({ opacity: 1 }, 0);

						if (options.fullscreenMode && options.spaceOutPage) {
							$pageDiv = $('<div />').css({ margin: 'auto', overflow: 'hidden', width: (rendering.maxItemsPerRow * rendering.itemContainerWidth) });
							pageWrappers[pageWrappers.length - 1].append($pageDiv);
						}
					}

					if (ie) {
						items[i].obj = generateItemObject(items[i].data);
						$pageDiv.append(items[i].obj);
					} else {
						$pageDiv.append(items[i].obj);
					}

					if (items[i].obj.find('video').length == 0)
						items[i].obj
							.width(rendering.itemContainerWidth)
							.height(rendering.itemContainerHeight);

					itemsDisplayed++;

					if (!options.smartResize) {
						$currentEDGmain = items[i].obj.children('.EDGmain');

						if (rendering.itemContainerHeight - $currentEDGmain.outerHeight(true) > 1) {
							$currentEDGmain.css({
								position: 'relative',
								top: '50%',
								marginTop: -Math.floor($currentEDGmain.find('img').height() / 2)
							});
						}
						if (rendering.itemContainerWidth - $currentEDGmain.outerWidth(true) > 1) {
							$currentEDGmain.css({
								position: 'relative',
								left: '50%',
								marginLeft: -Math.floor($currentEDGmain.find('img').width() / 2)
							});
						}
					}
				}
			}
			root.width(root.width() - 1);

			rendering.pageCount = pageWrappers.length;

			//call the lightbox plugin
			$(document).ready(function () {

				//				if (options.pfOpenMediaUrl == 'False') 
				//				{
				$('a[rel="prettyPhoto_' + options.ppgroup + '"]').prettyPhoto({
					animationSpeed: 'options.ppanimationSpeed',
					slideshow: options.ppslideshow,
					overlay_gallery: options.ppoverlay_gallery,
					autoplay_slideshow: options.ppautoplay_slideshow,
					hideflash: false,
					showTitle: true,
					print_image_text: options.ppprint_image_text,
					item_emailing_text: options.ppitem_emailing_text,
					item_emailing_subject: options.ppitem_emailing_subject,
					allow_image_printing: options.ppallow_image_printing,
					enable_item_emailing: options.ppenable_item_emailing,
					show_social_sharing: options.ppshow_social_sharing,
					download_handler_url: options.ppdownload_handler_url,
					theme: options.pptheme
				});
				// }
				if (options.pfShowQtip == 'True') {
					$('#' + options.pfdiv + ' .EDGcontent a[title]').each(function () {
						if ($(this).attr("title").length > 0) {
							$(this).qtip({
								show: {
									effect: function (offset) {
										$(this).slideDown(options.pfShowEffect); 
									}
								},
								hide: {
									effect: function (offset) {
										$(this).slideUp(options.pfHideEffect);
									}
								},
								position: { at: options.pfTargetPos, my: options.pfTooltipPos },
								style: { classes: 'qtip-' + options.pfTheme + ' eds_edn_qtip2_style', tip: { corner: true, width: 10, height: 5} }
							});
						}
					});
				}
				else {
					$('#' + options.pfdiv + ' .EDGcontent a[title]').each(function () {
						if ($(this).attr("title").length > 0) {
							$(this).attr("title", "");
						}
					});
				}
			});

			//show the navigation buttons
			showNavigation();
			setHoverFunctionality();

			if (options.itemToOpen !== false && !rendering.initialItemOpened) {
				var $openingItem = root.find('a[rel="prettyPhoto_' + options.ppgroup + '"][edgpid="' + options.itemToOpen + '"]');

				rendering.initialItemOpened = true;
				$openingItem.click();

				moveItemContainer(Math.floor(($openingItem.parents('.EDGmainContainer').index() + $openingItem.parents('.EDGmainContainer').parent().index() * rendering.itemsPerPage) / rendering.itemsPerPage));
			}
		}


		/**
		* Displays the navigation buttons.
		*/
		function showNavigation() {
			//reset the divs and arrays
			var navUl = root.siblings('#' + options.navigationId).find('ul'),
				paginationArrows;

			navUl.html('');

			rootGrandparent.children('div.portfolio_navigation_arrows_container').remove();

			if (rendering.pageCount > 1) {

				for (var i = 0; i < rendering.pageCount; i++) {
					navUl.append('<li></li>');
				}

				navUl.delegate('li', 'click', function () {
					moveItemContainer($(this).index());
				});

				navUl.find('li:first').addClass('selected');

				// Show navigation arrows
				if (options.showNavigationArrows) {
					rootParent.after('<div class="portfolio_navigation_arrows_container"><a href="#" class="portfolio_paggination_arrow left"></a><a href="#" class="portfolio_paggination_arrow right"></a></div>');
					$navigationArrowLeft = rootGrandparent.find('div.portfolio_navigation_arrows_container > a.portfolio_paggination_arrow.left');
					$navigationArrowRight = rootGrandparent.find('div.portfolio_navigation_arrows_container > a.portfolio_paggination_arrow.right');

					if (options.navArrowsFile) {
						$navigationArrowLeft.css('background-image', 'url("' + options.navArrowsFile + '")');
						$navigationArrowRight.css('background-image', 'url("' + options.navArrowsFile + '")');
					}

					if (options.hidableNavigationArrows) {
						$navigationArrowLeft.hide();
						$navigationArrowRight.hide();
						rootGrandparent
							.mouseenter(function () {
								var selectedPage = navUl.find('li.selected').index(),
									totalPages = navUl.children().length;

								if (!options.hideNavigationArrowsOnEnds || (options.hideNavigationArrowsOnEnds && selectedPage != 0)) {
									$navigationArrowLeft.fadeIn(250);
								}
								if (!options.hideNavigationArrowsOnEnds || (options.hideNavigationArrowsOnEnds && selectedPage != totalPages - 1)) {
									$navigationArrowRight.fadeIn(250);
								}
							})
							.mouseleave(function () {
								var selectedPage = navUl.find('li.selected').index(),
									totalPages = navUl.children().length;

								if (!options.hideNavigationArrowsOnEnds || (options.hideNavigationArrowsOnEnds && selectedPage != 0)) {
									$navigationArrowLeft.stop(false, true).fadeOut(250);
								}
								if (!options.hideNavigationArrowsOnEnds || (options.hideNavigationArrowsOnEnds && selectedPage != totalPages - 1)) {
									$navigationArrowRight.stop(false, true).fadeOut(250);
								}
							})
							.mousemove(function () {
								$(this).unbind('mousemove');
								$navigationArrowRight.fadeIn(250);
							});
					}

					if (options.hideNavigationArrowsOnEnds) {
						$navigationArrowLeft.hide();
					}

					var arrowsTopValue = -(Math.round(options.containerHeight / 2) + 63);
					$navigationArrowLeft.css('top', arrowsTopValue);
					$navigationArrowRight.css('top', arrowsTopValue);

					if (options.fullscreenMode) {
						$navigationArrowLeft.css('left', -10);
						$navigationArrowRight.css('right', -10);
					}

					$navigationArrowLeft.click(function () {
						moveToPrev();

						return false;
					});

					$navigationArrowRight.click(function () {
						moveToNext();

						return false;
					});
				}

				centerNavigation();
			}
		}

		function centerNavigation() {
			var navUl = root.siblings('#' + options.navigationId).find('ul');

			navUl.css({ marginLeft: (rendering.containerWidth / 2 - rendering.pageCount * options.navButtonWidth / 2) });
		}

		function moveToPrev() {
			var navUl = $('#' + options.navigationId).find('ul'),
				currentPageIndex = navUl.children('li.selected').index();

			moveItemContainer(currentPageIndex - 1);
		}

		function moveToNext() {
			var navUl = $('#' + options.navigationId).find('ul'),
				currentPageIndex = navUl.children('li.selected').index();

			moveItemContainer(currentPageIndex + 1);
		}

		function moveItemContainer(i) {
			var navUl = root.siblings('#' + options.navigationId).find('ul'),
				totalPages = navUl.children().length,
				currentPageIndex = navUl.children('li.selected').index(),
				marginLeft;

			if (i < 0 || i > totalPages - 1) {
				return false;
			}

			if (options.showNavigationArrows && options.hideNavigationArrowsOnEnds) {
				if (i == 0) {
					$navigationArrowLeft.stop(false, true).fadeOut(250);
				}
				if (i != 0) {
					$navigationArrowLeft.fadeIn(250);
				}

				if (i == totalPages - 1) {
					$navigationArrowRight.stop(false, true).fadeOut(250);
				}
				if (i != totalPages - 1) {
					$navigationArrowRight.fadeIn(250);
				}
			}

			marginLeft = i * (rendering.pageWidth + rendering.pageRightPadding);

			root.stop(true, false).animate({ marginLeft: [-marginLeft, options.easing] }, options.animationSpeed);

			navUl.find('li.selected').removeClass('selected');
			navUl.children().eq(i).addClass('selected');
		}

		function setHoverFunctionality() {
			$('.portfolio_item').hover(function () {
				$(this).stop().animate({ opacity: 0.8 }, 300);
			}, function () {
				$(this).stop().animate({ opacity: 1 }, 300);
			});
		}

		function generateItemObject(itemData) {
			var socialSharing = '',
				share_url,
				item_html;

			if (options.showSharingButtons.facebook || options.showSharingButtons.twitter || options.showSharingButtons.gplus) {
				if (location.href.indexOf('?') != -1) {
					share_url = location.href.substring(0, location.href.indexOf('?'));
				} else {
					share_url = location.href;
				}
				share_url += '?edgpid=' + itemData.edgpid + '&edgmid=' + itemData.ppgroup.substr(1) + '#!' + itemData.relTag + '_' + itemData.ppgroup + '/id' + itemData.edgpid + '/';

				socialSharing = '<div class="socialSharingContainer"><div class="buttons">';

				if (options.showSharingButtons.facebook) {
					socialSharing += '<iframe src="//www.facebook.com/plugins/like.php?href=' + encodeURIComponent(share_url) + '&amp;layout=button_count&amp;show_faces=true&amp;action=like&amp;font&amp;colorscheme=light&amp;height=20" scrolling="no" frameborder="0" style="border:none; overflow:hidden; height:20px; width: 100px;" allowTransparency="true"></iframe>';
				}

				if (options.showSharingButtons.gplus) {
					socialSharing += '<g:plusone size="medium" href="' + share_url + '" annotation="bubble"></g:plusone><script type="text/javascript">gapi.plusone.go();</script>';
				}

				if (options.showSharingButtons.twitter) {
					socialSharing += '<a href="//twitter.com/share" class="twitter-share-button" data-url="' + share_url + '" data-count="horizontal">Tweet</a><script type="text/javascript" src="//platform.twitter.com/widgets.js"></script>';
				}

				socialSharing += '</div></div>';
			}

			if (options.xmlRequestParams.Html5Video == 'True' && itemData.html5_video)
				item_html = '<video controls="true" src="' + itemData.html5_video + '" preview="' + itemData.thum + '" style="width: ' + options.maxImgWidth + 'px; height: ' + options.maxImgHeight + 'px;">Your browser doesn\'t support the video tag. You can <a href="' + itemData.html5_video + '">download the video here.</a></video>';
			else if (options.xmlRequestParams.Html5Audio == 'True' && itemData.html5_audio)
				item_html = '<a href="' + itemData.html5_audio + '"><img alt="' + itemData.imgalt + '" src="' + itemData.thum + '" /> <span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span><span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span><span class="round1"></span><span class="round2"></span><span class="round3"></span><span class="round4"></span><span class="' + itemData.cssClass + '"><span style="display:block">' + itemData.imgtitle + '</span><span class="Description">' + $('<div />').html(itemData.desc).text() + '</span></span></a>';
			else
				item_html = '<a rel="' + itemData.relTag + '_' + itemData.ppgroup + '"' + (itemData.downloadItemUrl == 'false' ? '' : ' downhref="' + itemData.downloadItemUrl + '"') + ' href="' + itemData.prev + '" lbnestedurl="' + itemData.lbnestedurl + '" edgpid="' + itemData.edgpid + '" title="' + itemData.imgdesc + '" pptitle="' + itemData.imgdesc + '" target="' + itemData.medTarget + '"><img alt="' + itemData.imgalt + '" src="' + itemData.thum + '" /> <span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span><span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span><span class="round1"></span><span class="round2"></span><span class="round3"></span><span class="round4"></span><span class="' + itemData.cssClass + '"><span style="display:block">' + itemData.imgtitle + '</span><span class="Description">' + $('<div />').html(itemData.desc).text() + '</span></span></a>';

			return $('<div class="EDGmainContainer"><div class="EDGmain"><div class="' + itemData.itemClass + '">' + item_html + '</div>' + socialSharing + '</div>' + (itemData.downloadItemUrl != 'false' ? '<div style="clear: both; display: block; text-align: center;"><a href="' + itemData.downloadItemUrl + '" class="downloadlink">' + options.downloadItemText + '</a></div>' : '') + '</div>');
		}
	};

	$.fn.fullscreenPortfolioGallery = function (rootId) {
		var $window = $(window), $body = $('body'), $rootObject,
			$fullscreenContainer, $fullscreenWrapper, $fullscreenMain,
			fullscreenWrapperResizeTimer, fullscreen_options,
			$fullscreen_close_btn;

		if (typeof rootId == 'string') {
			$rootObject = $('#' + rootId);
			fullscreen_options = $.extend(true, {}, $rootObject.data('EasyDNNGallery.portfolio.options'));
		} else if (typeof rootId == 'object') {
			fullscreen_options = rootId;
		}

		$fullscreenContainer = $('<div class="portfolio_gallery_fullscreen_container" id="' + fullscreen_options.fullscreenCssId + '"></div>');

		$fullscreenContainer
			.css('top', $window.scrollTop());

		$body
			.append($fullscreenContainer)
			.css({ overflow: 'hidden' });

		$fullscreenWrapper = $('<div class="portfolio_gallery_fullscreen_wrapper"></div>');
		$fullscreenContainer
			.append($fullscreenWrapper);

		$fullscreenWrapper
			.bind('reposition', function () {
				positionFullscreenWrapper();
				positionFullscreenCloseBtn();
				$fullscreenMain.trigger('resize_gallery');
			});

		$fullscreenMain = $('<div class="portfolio_gallery_fullscreen_main"><div style="position: relative;"><div class="portfolio_gallery_fullscreen_inner"></div></div></div>');
		$fullscreenWrapper.append($fullscreenMain);

		$fullscreenMain.data('initialOuterHeight', $fullscreenMain.outerHeight(true));

		positionFullscreenWrapper();

		$window
			.scroll(function () {
				$fullscreenContainer.css('top', $window.scrollTop());
			})
			.resize(function () {
				clearTimeout(fullscreenWrapperResizeTimer);
				fullscreenWrapperResizeTimer = setTimeout(function () {
					$fullscreenWrapper.trigger('reposition');
				}, 50);
			});

		$(document).bind('keydown.EasyDNNGallery_fullscreen', function (e) {
			var $lightboxOverlay = $('body > .pp_overlay');

			if ($lightboxOverlay.length == 0) {
				switch (e.keyCode) {
					case 27:
						destroyFullscreenWindow();
						break;

					case 39:
						$fullscreenMain.trigger('toNextPage');
						break;


					case 37:
						$fullscreenMain.trigger('toPrevPage');
						break;

					default:
				}
			}
		});

		var fullscreen_options = $.extend(fullscreen_options, {
			containerWidth: $fullscreenMain.width(),
			containerHeight: $fullscreenWrapper.height() - $fullscreenMain.data('initialOuterHeight'),
			fullscreenMode: true,
			fullscreenable: false,
			itemsPerPage: 0,
			spaceOutPage: true,
			scrollableContent: true,
			hideNavigationArrowsOnEnds: true
		});

		fullscreen_options.containerHeight -= fullscreen_options.categorySelector == 'classic' ? (fullscreen_options.customTitle ? 135 : 107) : 70;

		$fullscreenMain.find('div.portfolio_gallery_fullscreen_inner').portfolioSetter(fullscreen_options);

		$fullscreenMain
			.delegate('.closeFullscreenBtn', 'click', function () {
				destroyFullscreenWindow();

				return false;
			})
			.bind('fullscreen_close_btn_initialized', function () {
				$fullscreen_close_btn = $fullscreenMain.find('.closeFullscreenBtn');
				positionFullscreenCloseBtn();
			});

		function positionFullscreenWrapper() {
			$fullscreenWrapper
				.width($window.width() - 8 - parseInt($fullscreenWrapper.css('border-left-width'), 10) - parseInt($fullscreenWrapper.css('border-right-width'), 10))
				.height($window.height() - 8 - parseInt($fullscreenWrapper.css('border-top-width'), 10) - parseInt($fullscreenWrapper.css('border-bottom-width'), 10))
				.css('top', Math.round(($window.height() - $fullscreenWrapper.outerHeight()) / 2));
		}

		function positionFullscreenCloseBtn() {
			$fullscreen_close_btn
				.css({
					left: 'auto',
					right: (fullscreen_options.categorySelector == 'right' ? -(fullscreen_options.sidewayCatsWidth + 10) : -10)
				});
		}

		function destroyFullscreenWindow() {
			$(document).unbind('keydown.EasyDNNGallery_fullscreen');
			$body.css({ overflow: '' });
			$fullscreenContainer
				.fadeOut(200, function () {
					$fullscreenContainer.remove();
				});
		}
	};
},
array_contains = function (arr, value) {
	var length = arr.length;
	for (var i = 0; i < length; i++) {
		if (arr[i] === value) {
			return true;
		}
	}
	return false;
};

	if (typeof jQuery !== 'undefined')
		lightboxPortfolio(jQuery);

	if (typeof eds1_10 !== 'undefined')
		lightboxPortfolio(eds1_10);

})();
