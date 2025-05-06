const main_input_chat = document.getElementById("main-public-chat-input");
const main_chat = document.getElementById("chat");
const submit_chat = document.getElementById("submit-chat");

const main_input_mike = document.getElementById("main-mike");
const main_mike = document.getElementById("mike");
const question = document.getElementById("question");
const submit_mike = document.getElementById("submit-mike");


main_input_mike.addEventListener("keypress", (e)=>{
    if (e.key === "Enter"){
        let question_input = main_input_mike.value;
        question.innerText= question_input;
        main_input_mike.value = "";
    }
});
submit_chat.addEventListener("click",()=>{
    main_input_chat.value = "";
});
submit_chat.addEventListener("click",()=>{
    main_input_mike.value = "";
});

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
            	<div class="message">
                	<p>${item}</p>
                	<span>hmm</span>
            	</div>
		`;
	});
}
main_input_chat.addEventListener("keypress", (e)=>{
    if (e.key === "Enter"){
        let msg = main_input_chat.value;
        // THE BELOW INNERHTML IS TEMPORARY
        // To create the public chat, the sent msg is stored on the db then fetched, not displayed in "sync"
        main_chat.innerHTML+=`
            <div class="message">
                    <p>${msg}</p>
                    <span>hmm</span>
            </div>
        `;
	send_msg(msg);
        main_input_chat.value = "";
    }
});
