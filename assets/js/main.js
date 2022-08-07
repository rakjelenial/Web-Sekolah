if ('serviceWorker' in navigator) {
    window.addEventListener('load', function() {
        navigator.serviceWorker.register('./sw.js').then(function(registration) {
            console.log('Service worker registration succeeded:', registration.scope);
        }, function(err) {
            console.log('Service worker registration failed:', err);
        });
    });
} else {
    console.log('Service workers are not supported.');
}