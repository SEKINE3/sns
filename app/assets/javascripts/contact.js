$(function(){
	var i = 0; //変数iに0から代入
	while(i < gon.user_contact.length){ //iは投稿の数分
		const index = i //constで再代入を不可能にする
		$('#contact-title_' + index).on('click',function(){
			$('#contact-content_' + index).fadeIn();
		});
		i++;
};