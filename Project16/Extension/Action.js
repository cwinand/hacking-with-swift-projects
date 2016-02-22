var Action = function() {};

Action.prototype = {
    run: function(parameters) {
        parameters.completionFunction({"URL": document.url, "title": document.title});
    },
        
    finalize: function(parameters) {
        
    }
};

var ExtentionPreprocessingJS = new Action