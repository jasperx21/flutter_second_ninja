'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "index.html": "5b433ec9b971c1e516c8b636c40625e1",
"/": "5b433ec9b971c1e516c8b636c40625e1",
"main.dart.js": "55e50eeb5b90f36b9d21aaf841cb248b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "da96c857572e6e62cae3527d9d61a9d0",
"assets/LICENSE": "94e3635829b162b82b0cea71ec554134",
"assets/AssetManifest.json": "d0d86268b0535aba9f53037f48e2f272",
"assets/FontManifest.json": "01700ba55b08a6141f33e168c4a6c22f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/assets/tree.webp": "6bb4d0b39b66bef9dea1bec6fecb4d13",
"assets/assets/day.jpg": "248464e5364bb33d0d4f1eb66f042168",
"assets/assets/england.webp": "2c945a6871f642b21138e3cbbe815845",
"assets/assets/india.png": "fc99589a89d98c66f61dc65c3eaa6485",
"assets/assets/night.jpg": "1e159b7601e45fcdc60ff44fc56faf00",
"assets/assets/mexico.jpg": "396a9f950b21541e82d37229c1faaf4f"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
