'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "manifest.json": "0f658ec01afbaefd5ab066c567d8d174",
"version.json": "c69b4ee4c5b2601f82c477ab8acfb04a",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"index.html": "66c791cd256ebffaf771f416583806e9",
"/": "66c791cd256ebffaf771f416583806e9",
"main.dart.js": "8799a78437ae2de6140973f90df587e9",
"assets/NOTICES": "589a0ccf5dc7ce7cfb511ec434dc5b7d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/shaders/ink_sparkle.frag": "1ed03b0025463b56a87ebe9d27588c8a",
"assets/images/mohit-profile-pic.jpeg": "9438b07ce98905935c5e109017df48f3",
"assets/FontManifest.json": "e6d3d2f95424251fd7e08a929352ce0b",
"assets/AssetManifest.json": "68e21c17426b86281c5406f3487bcd68",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/fonts/FiraCode-VariableFont_wght.ttf": "ca3ebb34ddd32492162f9ff9b0ab1345",
"assets/assets/icons/linkedin.png": "6eb93795997b9dba0fd01d710559872b",
"assets/assets/icons/github.png": "6b93f90c8bb61dcd4a4cc6dc879f9349",
"assets/assets/icons/instagram.png": "5308f52f9a75e8b6cc4d92173304f567",
"assets/assets/icons/handwave.png": "945966e1e2e2a9015825ed6cbe97648f",
"assets/assets/icons/icon_flutter.png": "4262c71228b7aa391e995fe5f1d57795",
"assets/assets/icons/flutter.png": "134c20fce1144d5bc15a081935448a62",
"assets/assets/icons/markdown.webp": "eac4f21018dd0534707621824dda0885",
"assets/assets/icons/twitter.png": "49bd325c5c078d42dd39979579c08aae",
"assets/assets/icons/yana-darelova.png": "f128791c5cdb9e1fb151b8cea1196e89",
"assets/assets/icons/github_png256.png": "a1052e37d94f4772ab5d481ffc4a21b4",
"assets/assets/images/mohit-contact-qr.png": "559abdf3cae4a3bc8e54ee9cf34014de",
"assets/assets/images/projects/brain-basket/1.png": "620ad24a167591d34ab05faa81f4653a",
"assets/assets/images/projects/brain-basket/3.png": "77426a88c7fe706738b892ace5065c0f",
"assets/assets/images/projects/brain-basket/4.png": "8da3e196d7a5528ca036f971434544a3",
"assets/assets/images/projects/brain-basket/2.png": "2ab18a71cf860a1d0014a3adf8008392",
"assets/assets/images/projects/workitout/1.png": "c425ab8599f3b6cf28cfbd9b66fa1c2a",
"assets/assets/images/projects/workitout/3.png": "161887ce1e21d546877ebce1397ae41b",
"assets/assets/images/projects/workitout/4.png": "85e9fede77b9b05295f7f233de617b2f",
"assets/assets/images/projects/workitout/2.png": "1b3748df1e1ec3030bfd761aa1c99563",
"assets/assets/images/projects/mohit-portfolio/1.png": "101eb1bcf7303e39bc7ae085b6e33938",
"assets/assets/images/projects/cc-bot/1.png": "e3c8a7b91c9ad8948cd1363187f820a5",
"assets/assets/images/project-placeholder.png": "d1535134729aa1eb44fe961acf781263",
"assets/assets/images/project-placeholder.jpeg": "6ac31c1a62c008efdb13096cd7d708bc",
"assets/assets/markdowns/education_details.md": "2e0f6a29d06cc7ca4a4836baea804b21",
"assets/assets/markdowns/skills.md": "835e222fe111f89c940ae122908c84e1",
"assets/assets/markdowns/career_progression.md": "b0225c45bc05fd5b5e8934cea588211f",
"assets/assets/markdowns/interests.md": "521bb5c974b7ccf3a016cadafff5e9cb",
"assets/assets/markdowns/achievements.md": "e2cdd8f12b939a0df7df6c9af8a19a37",
"assets/assets/markdowns/intro.md": "0d101def93753ef6cc94920dafc5e0e8"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
