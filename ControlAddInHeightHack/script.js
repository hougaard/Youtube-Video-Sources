function HeresSomeData(data) {
    // We wanna do something with the customer....
    console.log(data);
    alert(data["Name"]);
}

function Draw(code) {
    try {
        controlAddIn.innerHTML = "";
        var diagram = flowchart.parse(code);
        diagram.drawSVG('controlAddIn');
    }
    catch (e) {
        console.log(e);
    }
}