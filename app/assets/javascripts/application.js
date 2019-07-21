// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap-sprockets

// song編集用
let songEdit = document.querySelectorAll(".song-edit")
let songEditBtn = document.querySelectorAll(".song-edit-btn")
let song_count = []
for(let i = 0; i < songEditBtn.length;i++){
    song_count.push(0)
}
// console.log(songEdit[0])
for(let i=0; i < songEditBtn.length; i++) {
    songEditBtn[i].addEventListener("click", (e) => {
        song_count[i]++;
        if(song_count[i]%2 !== 0){
            songEdit[i].style.display = "block"
        } else {
            songEdit[i].style.display = "none"
            song_count[i]=0
        }
    })
}

// song編集用
let discEdit = document.querySelectorAll(".disc-edit")
let discEditBtn = document.querySelectorAll(".disc-edit-btn")
let disc_count = []
for(let i = 0; i < discEditBtn.length;i++){
    disc_count.push(0)
}
// console.log(discEdit[0])
for(let i=0; i < discEditBtn.length; i++) {
    discEditBtn[i].addEventListener("click", (e) => {
        disc_count[i]++;
        if(disc_count[i]%2 !== 0){
            discEdit[i].style.display = "block"
        } else {
            discEdit[i].style.display = "none"
            disc_count[i]=0
        }
    })
}

