 // 유툽 iframe api
      var tag = document.createElement('script');

      tag.src = "https://www.youtube.com/iframe_api";
      var firstScriptTag = document.getElementsByTagName('script')[0];
      firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

      var player;
      
      function onYouTubeIframeAPIReady() {
        player = new YT.Player('player', {
          height: '360',
          width: '640',
          videoId: '78xR0iful7A',
		  playerVars: {
			  'autoplay': 1, // 자동재생
			  'loop': 1,	 // 한번만 재생됨
			  'mute': 1 	 // 음소거
		  }	
          , events: {
            'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange
          }
        });
      }

      function onPlayerReady(event) { 
		event.target.playVideo();
      }

	  function onPlayerStateChange(event) {		 
		if(event.data == 0)  {
			// e.data 의 값이 0일경우, 동영상이 종료되었음을 뜻함
			document.getElementById('player').style.display = 'none'; //video 숨기기
			document.getElementById('imgTarget').style.display = ''; //이미지 보이기
		}
	  }

	  // stopVideo() 해당 함수 호출시, 동영상 종료됨.
      function stopVideo() {
        player.stopVideo();
      }