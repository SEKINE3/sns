$(function(){
	let i = 0; //変数iに0から代入
	while(i < gon.followers.posts.length){ //iは投稿の数分
		const index = i //constで再代入を不可能にする
		$('#modal-open_' + index).on('click',function(){
			$('#modal-overlay, #modal-content_' + index).fadeIn();
		});
		i = i + 1;

		$('#modal-overlay').on('click',function(){
			$('#modal-overlay, #modal-content_' + index).fadeOut();
		});

		locateCenter();
	  $(window).resize(locateCenter);

	  function locateCenter() {
	    let w = $(window).width();
	    let h = $(window).height();

	    let cw = $('#modal-content_' + index).outerWidth();
	    let ch = $('#modal-content_' + index).outerHeight();

	    $('#modal-content_' + index).css({
	      'left': ((w - cw) / 2) + 'px',
	      'top': ((h - ch) / 2) + 'px'
	    });
	  }
};