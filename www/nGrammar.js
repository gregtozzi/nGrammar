shinyjs.inputAppend = function(inText){
    var textField = $('#inputText');
    textField.val(textField.val()+' ' + inText) 
};

shinyjs.labelChange = function(buttonId, newLabel){
    getElementById("button4").label="new label"
};