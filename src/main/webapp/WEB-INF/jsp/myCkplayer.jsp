<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ckplayer</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ckplayer6.8/ckplayer/ckplayer.js"></script>
</head>
<body>
	<div style="width:600px;height:400px;margin:0 auto;margin-top:120px;">
		<div id="a1"></div>
	</div>	
	<script type="text/javascript">
	var flashvars={
			f:'${media.src}',
			c:0,
			b:1,
			i:'${media.picture}',
			my_url:'http://www.ckplayer.com/index.php',
			};
		var video=['${media.src}->video/flv'];
		CKobject.embed('${pageContext.request.contextPath}/js/ckplayer6.8/ckplayer/ckplayer.swf','a1','ckplayer_a1','600','400',false,flashvars,video)	
		function closelights(){//关灯
			alert(' 本演示不支持开关灯');
		}
		function openlights(){//开灯
			alert(' 本演示不支持开关灯');
		}
</script>
</body>
</html>