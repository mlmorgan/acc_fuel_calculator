'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"index.html": "1003db5e72ae5d634c103cab03db7ab5",
"/": "1003db5e72ae5d634c103cab03db7ab5",
"splash/style.css": "07141c6c5b693af5ee703d8197953784",
"splash/img/light-3x.png": "53c0acb95a2e9c592f234cfaf3fa064b",
"splash/img/light-1x.png": "3851a658c99ba23e45a337525de38da6",
"splash/img/light-4x.png": "7a8f7e8cf4f663ba274acd6c7344c72e",
"splash/img/light-2x.png": "476c35bffa8d086851b8435e692ac758",
"splash/img/dark-1x.png": "3851a658c99ba23e45a337525de38da6",
"splash/img/dark-4x.png": "7a8f7e8cf4f663ba274acd6c7344c72e",
"splash/img/dark-2x.png": "476c35bffa8d086851b8435e692ac758",
"splash/img/dark-3x.png": "53c0acb95a2e9c592f234cfaf3fa064b",
"main.dart.js": "33032b70afadccaed015b39e1ea84857",
"manifest.json": "fc020fa583bbe07dfb33598fb3017f35",
"version.json": "eb2b61d21c78185a9fe32d31e11a90f8",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"icons/Icon-512.png": "aeff0d1acea81c30654738b7911bfb60",
"icons/Icon-192.png": "9248ed85195eaff3dad7949f93679fab",
"favicon-16x16.ico": "2f507db6a388d02b848fd5c298cf837a",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/images/flags/svg/za.svg": "bdffe88c5ac0c6695fc339b91593a667",
"assets/images/flags/svg/nl.svg": "ccd6451f5c4b35c567fc5ee04dc41cc8",
"assets/images/flags/svg/hu.svg": "bbddd29d5a52857bbb2cbc39b11f6f64",
"assets/images/flags/svg/es.svg": "70c13cd015f176edf45636e72635fe32",
"assets/images/flags/svg/it.svg": "78dad7d7f88e24a25387da9ecbc3819c",
"assets/images/flags/svg/us.svg": "c09801e2b944f19313ea8dcefddbd62f",
"assets/images/flags/svg/be.svg": "1d636b06c412980ecddb7b278cbf1c39",
"assets/images/flags/svg/de.svg": "702f527ff97cca4f4fb484a6459301b3",
"assets/images/flags/svg/gb.svg": "db68882cbf4beac3f3ee3923f1a91b82",
"assets/images/flags/svg/au.svg": "ba093f23e847a09c0f39c362c2e91f83",
"assets/images/flags/svg/fr.svg": "3c59a185bba42ef3547f1e124a54fd10",
"assets/images/flags/svg/jp.svg": "db1e3fb2c91bf007b178167b6f4bb0a4",
"assets/images/icon/splash_icon_padding.png": "9c73bfaa6613f7124d9cedb6f8457cef",
"assets/images/icon/ic_launcher.png": "9248ed85195eaff3dad7949f93679fab",
"assets/images/icon/splash_icon.png": "aeff0d1acea81c30654738b7911bfb60",
"assets/images/icon/app_icon.svg": "5159432e3a6d7a5e9b5ddf5876889dd1",
"assets/NOTICES": "6d9b74e6bf483a647b8c53a95696a78f",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/AssetManifest.json": "54a2b91e5e63bc9881018824c95c5942"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
