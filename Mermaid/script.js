function HeresSomeData(data) {
    // We wanna do something with the customer....
    console.log(data);
    alert(data["Name"]);
}

function Draw2(code) {
    try {
        controlAddIn.innerHTML = "";
        var diagram = flowchart.parse(code);
        diagram.drawSVG('controlAddIn');
    }
    catch (e) {
        console.log(e);
    }
}

function Draw(code) {
    try {
        const insertSvg = function (svgCode, bindFunctions) {
            document.getElementById('controlAddIn').innerHTML = svgCode;
        };
        mermaid.mermaidAPI.render('chart', code, insertSvg);
    }
    catch (e) {
        console.log(e);
    }
}