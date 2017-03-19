(function ($, undefined) {

	$(function () {
		setInterval(
			function () {
				var $flashMessagesContainer = $('#EDRAdminContent > .flashMessages');

				$('#EDRAdminContent > .mainContentWrapper .infoMessages').each(function () {
					var $this = $(this),
						$div = $('<div><span></span></div>'),
						$span = $('> span', $div);

					if ($this.hasClass('static'))
						return;

					$span[0].className = $this[0].className;

					$span.text($this.text());
					$flashMessagesContainer.append($div);

					$this.remove();

					setTimeout(
						function () {
							$div.fadeOut(400, function () {
								$div.remove();
							});
						},
						7000
					);
				});
			},
			100
		);
	});

})(eds1_10);