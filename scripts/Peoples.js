// Public chat
const main_input_pub_chat = document.getElementById("main-public-chat-input");
const main_pub_chat = document.getElementById("public-chat");
const submit_pub_chat = document.getElementById("submit-public-chat");
// Private chat
const main_input_priv_chat = document.getElementById("main-private-chat-input");
const main_priv_chat = document.getElementById("private-chat");
const submit_priv_chat = document.getElementById("submit-private-chat");

async function fetch_msg(){
	try {
		const response = await fetch("http://localhost:3000/api/data");
		const data = await response.json();
		displayData(data);
	} catch (error) {
		console.error("Error fetching data: ", error);
		main_chat.innerHTML = "Error loading data";
	}
}
function send_msg(msg){
	fetch("http://10.0.0.16:8080/submit-message", {
		method:'POST',
		headers: {
			"Content-type": 'application/json',
		},
		body: JSON.stringify({ message: msg }),
	})
	.then(response => response.json())
	.then(data =>{
		console.log('success', data);
	})
	.catch((error) => {
		console.error("Error: ",error);
	});
}
function displayData(data){
	if (!data || data.lenght === 0){
		main_chat.innerHTML = "No data found..";
		return;
	}
	data.forEach(item => {
		main_chat.innerHTML += `
            	<div class="message message-me">
                	<span>hmm</span>
					<p>${item}</p>
            	</div>
		`;
	});
}
main_input_pub_chat.addEventListener("keypress", (e)=>{
    if (e.key === "Enter"){
        let msg = main_input_pub_chat.value;
        // THE BELOW INNERHTML IS TEMPORARY
        // To create the public chat, the sent msg is stored on the db then fetched, not displayed in "sync"
        main_pub_chat.innerHTML+=`
            <div class="message">
                    <span>hmm</span>
					<p style="background-color:var(--primary)">${msg}</p>
            </div>
        `;
	send_msg(msg);
        main_input_pub_chat.value = "";
    }
});
main_input_priv_chat.addEventListener("keypress", (e)=>{
    if (e.key === "Enter"){
        let msg = main_input_priv_chat.value;
        // THE BELOW INNERHTML IS TEMPORARY
        // To create the public chat, the sent msg is stored on the db then fetched, not displayed in "sync"
        main_priv_chat.innerHTML+=`
            <div class="message">
                    <span>hmm</span>
					<p style="background-color:var(--primary)">${msg}</p>
            </div>
        `;
	send_msg(msg);
        main_input_priv_chat.value = "";
    }
});