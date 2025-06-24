'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "5b118c981f7cb54c2119223bbcba1be1",
"assets/AssetManifest.bin.json": "f5846ad7a5af6640da0a97248d9f7443",
"assets/AssetManifest.json": "d55f098e3fea635cc539a0e798846ab5",
"assets/assets/contact.vcf": "6af45f29a7c3d7fc434b543675adb288",
"assets/assets/dillon_01.jpg": "e9c63762134a985f28283671d22856b9",
"assets/assets/dillon_02.jpg": "027cffada987361986076827f4c7961c",
"assets/assets/dillon_03.jpg": "017fe134e51fcf5c7414478f931819a3",
"assets/assets/dillon_04.jpg": "9f9b7936be1d433402c918e2897cd0ae",
"assets/assets/education.jpeg": "5098091a7a85789dc77abb7df31a7667",
"assets/assets/experience.jpg": "e5942300324aaf434b38c107a4b152cb",
"assets/assets/fms.jpg": "27051676a703e4e580c28dceb9bd79c0",
"assets/assets/fwfp_01.jpg": "430ee19276cb5cde9405ba6e19dbaaa0",
"assets/assets/fwfp_02.jpg": "daecde883a1c62d4fd67d190ff712c04",
"assets/assets/fwfp_03.jpg": "f05e13d525cb3dbcfa86a5a1d9123920",
"assets/assets/gis_01.jpg": "854b4d5e08cb95158438b93eedeb6140",
"assets/assets/gis_02.jpg": "30e6f5a7b5ad3afea11a22dc63c3431b",
"assets/assets/gis_03.jpg": "0a29c1539b06e49af279367913f67cd4",
"assets/assets/krone_01.jpg": "9651f3c84a9ce86a6800b3ad8ce522e3",
"assets/assets/krone_02.jpg": "ba90fe789a636cfd4316cb23a3bb106a",
"assets/assets/krone_03.jpg": "af59b4f9125533f3a842430887a6c02b",
"assets/assets/krone_04.jpg": "af7c9280b384d64f77a766ea24ea4304",
"assets/assets/krone_05.jpg": "b5e6ac9a489e0734d7e3459d7172e430",
"assets/assets/latvia_01.jpg": "fb8cf718fee97bf14373250343062e91",
"assets/assets/latvia_02.jpg": "9a590f90038bd959f1b6400d55adc3db",
"assets/assets/latvia_03.jpg": "d6b294e0af972d8153797bfa8226b0d5",
"assets/assets/latvia_04.jpg": "5deccc8f2e9f5a213147cfad844bf2b8",
"assets/assets/latvia_05.jpg": "4b44e82a715ba2af35554e64a5cc6864",
"assets/assets/msf_harvest_01.jpg": "877cdc9cb7849bd13c15d0d7612437cb",
"assets/assets/msf_harvest_02.jpg": "2d555eae3b41c277372bc4aec8e54d69",
"assets/assets/msf_harvest_03.jpg": "b46ab06df5207a257e74b147914c44a3",
"assets/assets/msf_harvest_04.jpg": "4f4be6cb4c8530a4a94657e7d023ed18",
"assets/assets/msf_seeding_01.jpg": "2b2a9fb23455bfd843b805f5846db3d6",
"assets/assets/msf_seeding_02.jpg": "ad6b938a8ab60f5394c800ae5dfc572c",
"assets/assets/msf_seeding_03.jpg": "c4055ade7813d8b6af79c16b525dd1a1",
"assets/assets/msf_seeding_04.jpg": "01db993f1f5fcd45a0370f8ecbe7393c",
"assets/assets/portfolio.jpg": "08497e73fc065ec9bcbd423123b34da6",
"assets/assets/profile.jpg": "92cb0c1c3ec75a194c860773e0c54ab7",
"assets/assets/saudhof_01.jpg": "16cfc51613a65c37eeb19bc247680344",
"assets/assets/saudhof_02.jpg": "e2c54056d98f0de261331654b4f32fc0",
"assets/assets/schuetz_01.jpg": "207d06c61c22127f6a1c6ab45b9dbbb7",
"assets/assets/thw_01.jpg": "50c29ff258412cff4ed705646cb48611",
"assets/assets/thw_02.jpg": "cd07edaec4f33ec568a8309e55810957",
"assets/assets/thw_03.jpg": "8e468d98f28ebe0313a8ea78636da1b5",
"assets/assets/thw_04.jpg": "c247276f05b5c1f646fbe49c89638803",
"assets/assets/thw_05.jpg": "f43f0cba946ef85482cbf97a69ee13a9",
"assets/assets/volunteering.jpg": "d2e3cefdaf88bf1517b67fa3609cbf2e",
"assets/assets/youtube.jpg": "89e6bc69066216f3a2eb5d282b4cb509",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "20a67cc784263bb94591a8f29392b46a",
"assets/NOTICES": "0ecf036b95411b46fa1b6436f817ebcb",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/flutter_map/lib/assets/flutter_map_logo.png": "208d63cc917af9713fc9572bd5c09362",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "2815e4bacf0bd26b5a69696abd793f70",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "a2eb084b706ab40c90610942d98886ec",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.svg": "ae95cd99eea9740e09520672638a4aaa",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "a91acf83f63419ba0bff21f07de426b5",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "d6d382b312700889932cb1a7af53d67c",
"/": "d6d382b312700889932cb1a7af53d67c",
"main.dart.js": "a2f8f600a39bbfce9fbbe0d0560fe97f",
"manifest.json": "a90fc70bfa7a0df7682282375162141a",
"version.json": "00a09cf571afbe8210e7561c3a8a443f",
"web_assets/CV_Simon-Tenbusch_2026.pdf": "2b62245367c39c9690e61640a60f754e",
"web_assets/gis_report.pdf": "22a7026c938a45d0ed56bb6c72698e32"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
