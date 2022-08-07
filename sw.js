var cache_name = 'sw-cache-v1';
var cache_files = [
    './',
    './views/themes/sky_light/custom.css',
];

this.addEventListener('install', function(event) {
    event.waitUntil(
        caches.open(cache_name).then(function(cache) {
            console.log('in install service worker... cache is opened');
            return cache.addAll(cache_files)
        })
    );
});
  
self.addEventListener('activate', function(event) {
    event.waitUntil(
        caches.keys().then(function(cacheName) {
            return Promise.all(
                cacheName.filter(function(cacheName) {
                    return cacheName != cache_name
                }).map(function(cacheName) {
                    return caches.delete(cacheName)
                })
            );
        })
    );
});

self.addEventListener("fetch", (event) => {
    event.respondWith(
        caches.match(event.request).then((response) => {
            // caches.match() will always return a response,
            // but it may be null if the response has already been
            // deleted.
            if (response) {
                return response;
            }
            return fetch(event.request);
        })
    );
});