let selected = 0;
let isOpen = false;


$(function(){


    window.addEventListener('message', function(event) {
        if(event.data.type == "open"){
            _open()
        }
    })


})

// $(document).keyup(function(event) {
//     if (event.which === 34) {
//         _open()
//     }
// });

// Open admin panel
function _open() { 
    if (!isOpen) { 
        document.getElementById("bg").classList.toggle("show");
        document.getElementById("panel").classList.toggle("show");
        console.log('OPENED')
        isOpen = !isOpen; 
    }
}

// Close admin panel
function _close() { 
    if (isOpen){ 
        document.getElementById("bg").classList.toggle("show");
        document.getElementById("panel").classList.toggle("show");
        console.log('CLOSED')
        isOpen = !isOpen; 
    }
}