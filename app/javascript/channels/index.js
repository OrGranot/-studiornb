// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

const algoliasearch = require("algoliasearch");

const client = algoliasearch("YourApplicationID", "YourAdminAPIKey");
const index = client.initIndex("your_index_name");

const objects = [
  {
    objectID: 1,
    name: "Foo"
  }
];

index
  .saveObjects(objects)
  .then(({ objectIDs }) => {
    console.log(objectIDs);
  })
  .catch(err => {
    console.log(err);
  });

index
  .search("Fo")
  .then(({ hits }) => {
    console.log(hits);
  })
  .catch(err => {
    console.log(err);
  });


var client = algoliasearch(ApplicationID, Search - Only - API - Key);
var index = client.initIndex('Lewagon');
index.search('something', { hitsPerPage: 10, page: 0 })
  .then(function searchDone(content) {
    console.log(content)
  })
  .catch(function searchFailure(err) {
    console.error(err);
  });
