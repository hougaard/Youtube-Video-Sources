function DoIt()
{
    var currentSheet = null;
    var i = 0;
    var j = 0;
   
    //loop through styleSheet(s)
    for(i = 0; i< window.parent.document.styleSheets.length; i++){
        currentSheet = window.parent.document.styleSheets[i];
        
        ///loop through css Rules
        for(j = 0; j< currentSheet.cssRules.length; j++){

            if (currentSheet.cssRules[j].selectorText != null)
                if (currentSheet.cssRules[j].selectorText.startsWith('.borderShine-'))
                {
                    window.parent.document.querySelector("[controlname^='Description']").classList.add(currentSheet.cssRules[j].selectorText.substring(1));
                    return;
                }
        }
    }
}