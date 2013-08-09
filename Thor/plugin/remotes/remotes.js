/**
<<<<<<< HEAD
 * Touch-based remote controller for your presentation courtesy 
=======
 * Touch-based remote controller for your presentation courtesy
>>>>>>> copied presentation from master branch
 * of the folks at http://remotes.io
 */

(function(window){

    /**
     * Detects if we are dealing with a touch enabled device (with some false positives)
<<<<<<< HEAD
     * Borrowed from modernizr: https://github.com/Modernizr/Modernizr/blob/master/feature-detects/touch.js   
=======
     * Borrowed from modernizr: https://github.com/Modernizr/Modernizr/blob/master/feature-detects/touch.js
>>>>>>> copied presentation from master branch
     */
    var hasTouch  = (function(){
        return ('ontouchstart' in window) || window.DocumentTouch && document instanceof DocumentTouch;
    })();

    if(!hasTouch){
        head.ready( 'remotes.ne.min.js', function() {
            new Remotes("preview")
                .on("swipe-left", function(e){ Reveal.right(); })
                .on("swipe-right", function(e){ Reveal.left(); })
                .on("swipe-up", function(e){ Reveal.down(); })
                .on("swipe-down", function(e){ Reveal.up(); })
<<<<<<< HEAD
                .on("tap", function(e){ 
                    Reveal.toggleOverview(); 
=======
                .on("tap", function(e){
                    Reveal.toggleOverview();
>>>>>>> copied presentation from master branch
                });
        } );

        head.js('https://raw.github.com/Remotes/Remotes/master/dist/remotes.ne.min.js');
    }
})(window);