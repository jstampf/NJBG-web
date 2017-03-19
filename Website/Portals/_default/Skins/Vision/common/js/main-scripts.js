(function ($) {
	var menuInstanceKey = 'responsAbilityInstance',
		$window = $(window);

	$.fn.responsAbilityMenu = function () {
		return this.each(function () {
			var $mainWrapper = $(this),
				$menuWrapper = $('> .raMenuWrapper > div', $mainWrapper),
				$menuTriggerWrapper = $('> .raMenuTriggerWrapper', $mainWrapper),
				$placeholder = $mainWrapper.next('.responsAbilityMenuPlaceholder'),

				offsetTop,
				formTopMargin = parseInt($('#Form').css('marginTop'), 10),

				resizeMenu = function () {
					var maxHeight = $window.height() - $menuTriggerWrapper.outerHeight(true),
						windowScrollTop;

					if ($menuTriggerWrapper.is(':hidden') || !$mainWrapper.hasClass(menuOpenedClass))
						return;

					maxHeight -= $mainWrapper.outerHeight(true) - $mainWrapper.height();

					windowScrollTop = $window.scrollTop();

					if (offsetTop > windowScrollTop)
						maxHeight = maxHeight - formTopMargin - (offsetTop - windowScrollTop);

					$menuWrapper.css('maxHeight', maxHeight + 'px');
				},

				updateOffsetTop = function () {
					if ($mainWrapper.hasClass('raFixedMenu'))
						return;

					offsetTop = $mainWrapper.offset().top - parseFloat($mainWrapper.css('marginTop')) - formTopMargin;
				},

				menuOpenedClass = 'raMenuOpened',
				itemOpenedClass = 'raItemOpened',
				openMenuItemTimerKey = 'raOpenMenuItemTimer',
				isSideMenu = $mainWrapper.hasClass('sideMenu');

			if ($mainWrapper.data(menuInstanceKey))
				return;

			$mainWrapper.data(menuInstanceKey, true);

			updateOffsetTop();

			if ($placeholder.length > 0)
				$placeholder.height($mainWrapper.outerHeight(true));

			$mainWrapper
				.on('click', '> .raMenuTriggerWrapper > .raMenuTrigger', function () {
					$mainWrapper.toggleClass(menuOpenedClass);

					resizeMenu();
				})
				.on('click', '> .raMenuWrapper .edsmm_childIndicator', function () {
					$(this).parents('li').eq(0).toggleClass(itemOpenedClass)
				});

			if ($mainWrapper.hasClass('hoverOpensItems'))
				$mainWrapper
					.on('mouseenter', '> .raMenuWrapper .edsmm_menuItem', function () {
						var $this = $(this),
							$siblings = $this.siblings('.edsmm_hasChild');

						$siblings = $siblings.add('.edsmm_menuItem.edsmm_hasChild', $siblings)
							.each(function () {
								clearTimeout($(this).data(openMenuItemTimerKey));
							});

						$this.data(
							openMenuItemTimerKey,
							setTimeout(
								function () {
									if ($this.hasClass('edsmm_hasChild'))
										$this.addClass(itemOpenedClass);

									$siblings.removeClass(itemOpenedClass);
								},
								150
							)
						);
					});

			if (isSideMenu)
				$('> .raMenuWrapper .edsmm_menuItem.edsmm_active.edsmm_hasChild', $mainWrapper).addClass(itemOpenedClass);
			else
				$menuWrapper.on('mouseenter', '> ol > li.edsmm_megaMenu', function () {
					var $container = $('> div', this),
						avalibleHeight = $window.height() - Math.ceil($container.offset().top) - 10;

					$container.css('max-height', avalibleHeight + $window.scrollTop());
				});

			$window
				.on('scroll', function () {
					updateOffsetTop();

					resizeMenu();

					if ($placeholder.length == 0)
						return;

					if ($window.scrollTop() >= offsetTop) {
						$mainWrapper
							.addClass('raFixedMenu')
							.css('marginTop', Math.abs(formTopMargin));

						$placeholder.addClass('show');
					} else {
						$mainWrapper
							.removeClass('raFixedMenu')
							.css('marginTop', '');

						$placeholder.removeClass('show');
					}
				})
				.on('resize', function () {
					updateOffsetTop();

					resizeMenu();

					if ($menuTriggerWrapper.is(':hidden')) {
						$mainWrapper.removeClass(menuOpenedClass);
						$menuWrapper.css('maxHeight', '');
					}
				});
		});
	};
})(jQuery);

(function ($, window) {
	var activeClass = 'edsTabulator_active';
	var tabTriggerSelector = '.edsTabulator_tabTrigger';

	function edsTabulator (elem) {
		var self = this,
			$mainWrapper = $(elem);

		$mainWrapper
			.on('click', tabTriggerSelector, function () {
				var $clicked = $(this),
					itemIndex = $clicked.index(),
					$tabContentWrappers = $('.edsTabulator_tabsWrapper .edsTabulator_tab', $mainWrapper);

				if ($clicked.hasClass(activeClass))
					return;

				$tabContentWrappers.removeClass(activeClass);
				$(tabTriggerSelector, $mainWrapper).removeClass(activeClass);

				$clicked.addClass(activeClass);
				$tabContentWrappers.eq(itemIndex).addClass(activeClass);
			});
	}

	edsTabulator.prototype = {};

	$.fn.edsTabulator_1 = function () {
		var instanceKey = 'edsTabulatorRun';

		return this.each(function () {
			var self = this;

			if (!$.data(self, instanceKey))
				$.data(self, instanceKey, new edsTabulator(self));
		});
	};

})(jQuery, window);

(function ($, window) {
	var activeClass = 'edsAccordion_active',
		sectionClass = 'edsAccordion_section',
		sectionContentWrapper = 'edsAccordion_contentWrapper';

	function edsAccordion (elem) {
		var self = this,
			$mainWrapper = $(elem);

		$mainWrapper
			.on('click', '.' + sectionClass + ' > .edsAccordion_title', function (e) {
				var $clicked = $(this),
					$section = $clicked.parent(),
					$sectionContentWrapper = $('> .' + sectionContentWrapper, $section),
					$activeSections = $('.' + sectionClass + '.' + activeClass, $mainWrapper),
					currentlyActive = $section.hasClass(activeClass);

				$('> .' + sectionContentWrapper, $activeSections)
					.stop(true)
					.animate(
						{
							height: 0
						},
						{
							duration: 200
						}
					);
				$activeSections.removeClass(activeClass);

				if (currentlyActive)
					return false;

				$sectionContentWrapper
					.stop(true)
					.animate(
						{
							height: $('> .edsAccordion_content', $sectionContentWrapper).outerHeight(true)
						},
						{
							duration: 200,
							complete: function () {
								$sectionContentWrapper.css('height', 'auto');
							}
						}
					);
				$section.addClass(activeClass);

				return false;
			});
	}

	edsAccordion.prototype = {};

	$.fn.edsAccordion_1 = function () {
		var instanceKey = 'edsAccordionRun';

		return this.each(function () {
			var elem = this;

			if (!$.data(elem, instanceKey))
				$.data(elem, instanceKey, new edsAccordion(elem));
		});
	};

})(jQuery, window);

jQuery(document).ready(function($){
	// browser window scroll (in pixels) after which the "back to top" link is shown
	var offset = 300,
		//browser window scroll (in pixels) after which the "back to top" link opacity is reduced
		offset_opacity = 1200,
		//duration of the top scrolling animation (in ms)
		scroll_top_duration = 700,
		//grab the "back to top" link
		$back_to_top = $('.eds_backToTop');

	//hide or show the "back to top" link
	$(window).scroll(function(){
		($(this).scrollTop() > offset ) ? $back_to_top.addClass('eds_backToTopVisible') : $back_to_top.removeClass('eds_backToTopVisible eds_backToTopFadeOut');
		if( $(this).scrollTop() > offset_opacity ) {
			$back_to_top.addClass('eds_backToTopFadeOut');
		}
	});

	//smooth scroll to top
	$back_to_top.on('click', function(event){
		event.preventDefault();
		$('body,html').animate({
			scrollTop: 0 ,
		 	}, scroll_top_duration
		);
	});

});

jQuery(function($){
	$('.responsAbilityMenu').responsAbilityMenu();
	$('div.EDS_tabs').edsTabulator_1();
	$('div.EDS_accordion').edsAccordion_1();

	$('.eds_floatingMenu')
		.on('click', '> span', function () {
			$(this).parent().toggleClass('eds_floatingMenuActive');
		})
		.filter('.eds_onClickCloseMenu')
			.on('click', '> ul > li a.edsfnl_action', function () {
				$(this).parents('.eds_floatingMenu > ul').eq(0).parent().removeClass("eds_floatingMenuActive");
			});
});
