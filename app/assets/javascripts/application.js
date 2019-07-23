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

editBtn(".song-edit", ".song-edit-btn")
editBtn(".disc-edit", ".disc-edit-btn")
editBtn(".genre-edit", ".genre-edit-btn")
editBtn(".label-edit", ".label-edit-btn")
editBtn(".singer-edit", ".singer-edit-btn")

function editBtn(editBody,editBodyBtn){
    let hogeEdit = document.querySelectorAll(editBody)
    let hogeEditBtn = document.querySelectorAll(editBodyBtn)
    let hoge_count = []
    for(let i=0;i<hogeEditBtn.length;i++){
        hoge_count.push(0)
    }
    for(let i=0;i<hogeEditBtn.length;i++){
        hogeEditBtn[i].addEventListener("click", () => {
            hoge_count[i]++;
            if(hoge_count[i]%2 !== 0){
                hogeEdit[i].style.display = "block";
            } else {
                hogeEdit[i].style.display = "none";
                hoge_count[i]=0
            }
        })
    }
}
