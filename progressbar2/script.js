function SetProgress(progress) {
    var elem = document.getElementById("myBar");
    // var width = CurrentProgress;
    // var id = setInterval(frame, 10);
    // function frame() {            
    //     if (width > progress) {
    //         width--;
    //         elem.style.width = width + "%";
    //         elem.innerHTML = width + "%";
    //     } else if (width < progress) {
    //         width++;
    elem.style.width = progress + "%";
    elem.innerHTML = progress + "%";
    //     }
    // }
}