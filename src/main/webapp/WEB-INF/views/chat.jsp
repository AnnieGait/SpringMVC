<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0">

<!-- To onoma tou titlou tou TAB -->
<title>Spring Boot WebSocket Chat Application | CalliCoder</title>
<link href="resources/css/main.css" rel="stylesheet" media="screen" />
<!-- this is the first script I had
	1.
	<script type="text/javascript" src='<c:url value= "/resources/js/main.js"/>' >
	</script> 
	2.
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" >
	</script>
	3.
	request.getContextPath
	4.
	<script type="text/javascript" src="../resources/js/main.js" >
	</script>
	5.
	
	
	
	-->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js" >
	</script>
</head>
<body background="resources/img/img.jpg">
	
	<noscript>
		<h2>Sorry! Your browser doesn't support Javascript</h2>
	</noscript>

	<!-- To aspro koyti poy o xrhsths eisagei to onoma toy gia na tsatarei -->
	<div id="username-page">
		<div class="username-page-container">
			<h1 class="title">Type your username</h1>
			<form id="usernameForm" name="usernameForm">
				<div class="form-group">
					<input type="text" id="name" placeholder="Username"
						autocomplete="off" class="form-control" />
				</div>
				<div class="form-group">
					<button type="submit" class="accent username-submit">Start
						Chatting</button>
				</div>
			</form>
		</div>
	</div>
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