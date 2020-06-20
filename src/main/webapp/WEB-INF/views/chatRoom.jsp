<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0">

<!-- To onoma tou titlou tou TAB -->
<title>Spring Boot WebSocket Chat Application | CalliCoder</title>
<link href="resources/css/main.css" rel="stylesheet" media="screen" />
<script type="text/javascript" src='<c:url value= "/resources/js/main.js"/>' >
	</script>
</head>
<body background="resources/img/img.jpg">
	
	<noscript>
		<h2>Sorry! Your browser doesn't support Javascript</h2>
	</noscript>

	<!-- Otan o xrhsths balei to onoma toy mpainei sto chat -->
	<div id="chat-page" class="hidden">
		<div class="chat-container">
			<div class="chat-header">
				<!-- Na allaxw ton titlo -->
				<h2>Global Chat Box</h2>
			</div>
			<div class="connecting">Connecting...</div>

			<ul id="messageArea">
				<!-- messageArea -->
				
			</ul>
			<form id="messageForm" name="messageForm" nameForm="messageForm">
				<div class="form-group">
					<div class="input-group clearfix">
						<!-- edw grafei to mhnyma prin to steilei -->
						<input type="text" id="message" placeholder="Type a message..."
							autocomplete="off" class="form-control" />
						<button type="submit" class="primary">Send</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	<script src="/js/main.js"></script>
</body>
</html>