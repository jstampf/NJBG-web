jQuery(function($){

	$(window).scroll(function() {
		if($(this).scrollTop() != 0) {
			$('#EDS_toTop').fadeIn();
		} else {
			$('#EDS_toTop').fadeOut();
		}
	});
	$('#EDS_toTop').click(function() {
		$('body,html').animate({scrollTop:0},800);
	});
});

(function ($) {
	var menuInstanceKey = 'responsAbilityInstance',
		$window = $(window);

	$.fn.responsAbilityMenu = function () {
		return this.each(function () {
			var $mainWrapper = $(this),
				$menuWrapper = $('> .raMenuWrapper', $mainWrapper),
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
					maxHeight -= $menuWrapper.outerHeight(true) - $menuWrapper.height();

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

				menuOpenedClass = 'raMenuOpened';

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
					$(this).parents('li').eq(0).toggleClass('raItemOpened')
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

$(function () {
	$('.responsAbilityMenu').responsAbilityMenu();
	$('div.EDS_tabs').edsTabulator_1();
	$('div.EDS_accordion').edsAccordion_1();
});
