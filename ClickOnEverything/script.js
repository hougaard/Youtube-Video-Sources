function clickanything() {
    try {
        let boxes = window.parent.document.querySelectorAll('[id$="factBoxToggle"]');

        boxes[boxes.length - 1].click();
    }
    catch (e) {
        console.log(e);
    }
}

function FilterPaneToggle() {
    try {
        let boxes = window.parent.document.querySelectorAll('[id$="filterPaneToggle"]');
        boxes[boxes.length - 1].click();
    }
    catch (e) {
        console.log(e);
    }
}