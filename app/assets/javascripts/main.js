
function share (){
	
	FB.ui({
  method: 'feed',
  link: 'saysquare.com',
  picture : 'http://i.imgur.com/Jt6yt9Q.png?1',
    caption: 'Airmule .com :)'
}, function(response){});
}


$(document).on('click', '#facebook', function(){
	share();
});




