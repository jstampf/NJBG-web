jQuery(function ($) {
	var $edrAdminSettings = $('#EDRAdminContent'),
		$collapsable_box_switch = $('.collapsable_box > .switch input[type="checkbox"]');

	$collapsable_box_switch.bind('change', function () {
		var $target = $(this).parent().siblings('.collapsableContent');

		if (this.checked)
			$target.slideDown(200);
		else
			$target.slideUp(200);
	});

	$edrAdminSettings.on('click', '.onOffToggle', function () {
		var $this = $(this),
			$input = $('input', $this);

		$this.toggleClass('off');

		if ($input.length == 0)
			return;

		var $showHideElement = $this.parents('.settings_table').next();

		if ($this.hasClass('off')) {
			$input[0].checked = false;
			$showHideElement.slideUp(200);
		}
		else {
			$input[0].checked = true;
			$showHideElement.slideDown(200);
		}

	});

	$('.onOffToggle input[type="checkbox"]').each(function () {
		var $this = $(this),
			$onOffElement = $this.parents('.onOffToggle').first(),
			$showHideElement = $this.parents('.settings_table').next();

		if (this.checked) {
			$showHideElement.slideDown(200);
		}
		else {
			$showHideElement.slideUp(200);
		}

		$onOffElement.toggleClass('off', !this.checked);
	});
});
