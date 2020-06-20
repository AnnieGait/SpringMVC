'use strict';

// To log in
var usernamePage = document.querySelector('#username-page');

// TO chat room
var chatPage = document.querySelector('#chat-page');

// to onoma tou user (to grafei gia na syndethei sto chat kai pata to koumpi 'Start Chatting'
var usernameForm = document.querySelector('#usernameForm');

// to mhnyma poy stelnei o user (pata apostolh)
var messageForm = document.querySelector('#messageForm');

// to mhnyma poy grafetai prin stalei (den exei pathsei akoma apostolh)
var messageInput = document.querySelector('#message');

// To thread poy exei thn synomilia
var messageArea = document.querySelector('#messageArea');


var connectingElement = document.querySelector('.connecting');

var stompClient = null;
var username = null;
//vivid blue (very dark blue),(strong) green, light blue, light red (strong red), 
// yellow, pink, orange (orangeRed), turquise
// (lightBlue), (lila)
var colors = [
    '#00004d', '#99cc00', '#00BCD4', '#cc0000',
    '#ffc107', '#ff85af', '#FF3300', '#39bbb0',
    '#99ffdd', '#5e5eff'
];

function connect(event) {
	// otan o xrhsths eisagei to username toy, afairoyntai tyxwn kena
    username = document.querySelector('#name').value.trim();

    if(username) {
    	//prosthetei ton user sthn omadikh lista?
        usernamePage.classList.add('hidden');
        chatPage.classList.remove('hidden');

        var socket = new SockJS('/java');
        stompClient = Stomp.over(socket);

        stompClient.connect({}, onConnected, onError);
    }
    event.preventDefault();
}


function onConnected() {
    // Subscribe to the Public Topic
    stompClient.subscribe('/topic/public', onMessageReceived);

    // Tell your username to the server
    stompClient.send("/app/chat.register",
        {},
        JSON.stringify({sender: username, type: 'JOIN'})
    )

    connectingElement.classList.add('hidden');
}


function onError(error) {
    connectingElement.textContent = 'Could not connect to WebSocket server. Please refresh this page to try again!';
    connectingElement.style.color = 'red';
}

function onLeft() {
	
}


function send(event) {
    var messageContent = messageInput.value.trim();

    if(messageContent && stompClient) {
        var chatMessage = {
            sender: username,
            content: messageInput.value,
            type: 'CHAT'
        };

        stompClient.send("/app/chat.send", {}, JSON.stringify(chatMessage));
        messageInput.value = '';
    }
    event.preventDefault();
}


function onMessageReceived(payload) {
    var message = JSON.parse(payload.body);

    var messageElement = document.createElement('li');

    if(message.type === 'JOIN') {
        messageElement.classList.add('event-message');
        message.content = message.sender + ' joined!';
    }
    if (message.type === 'LEAVE') {
    	// den emfanizetai to mhnyma apoxwrhshs
        messageElement.classList.add('event-message');
        message.content = message.sender + ' left!';
    } 
    else {
        messageElement.classList.add('chat-message');

        var avatarElement = document.createElement('i');
        var avatarText = document.createTextNode(message.sender[0]);
        avatarElement.appendChild(avatarText);
        avatarElement.style['background-color'] = getAvatarColor(message.sender);

        messageElement.appendChild(avatarElement);

        var usernameElement = document.createElement('span');
        var usernameText = document.createTextNode(message.sender);
        usernameElement.appendChild(usernameText);
        messageElement.appendChild(usernameElement);
    }

    var textElement = document.createElement('p');
    var messageText = document.createTextNode(message.content);
    textElement.appendChild(messageText);

    messageElement.appendChild(textElement);

    messageArea.appendChild(messageElement);
    messageArea.scrollTop = messageArea.scrollHeight;
}


function getAvatarColor(messageSender) {
    var hash = 0;
    for (var i = 0; i < messageSender.length; i++) {
        hash = 31 * hash + messageSender.charCodeAt(i);
    }

    var index = Math.abs(hash % colors.length);
    return colors[index];
}

usernameForm.addEventListener('submit', connect, true)
messageForm.addEventListener('submit', send, true)