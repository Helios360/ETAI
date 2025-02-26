const mysql = require('mysql');

// configurations for creating mysql connection
const connection = mysql.createConnection({
    host: 'localhost',     // host for connection
    port: 3306,            // default port for mysql is 3306
    database: 'test',      // database from which we want to connect our node application
    user: 'root',          // username of the mysql connection
    password: 'root'       // password of the mysql connection
});

// executing connection
connection.connect(function(err) {
    if (err) {
        console.log("error occurred while connecting");
    } else {
        console.log("connection created with mysql successfully");
    }
});

const main_input_chat = document.getElementById("main-public-chat-input");
const main_chat = document.getElementById("chat");
const submit_chat = document.getElementById("submit-chat");

const main_input_mike = document.getElementById("main-mike");
const main_mike = document.getElementById("mike");
const question = document.getElementById("question");
const submit_mike = document.getElementById("submit-mike");

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
        main_input_chat.value = "";
    }
});
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

function send_msg(){

}