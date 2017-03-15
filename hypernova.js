const hypernova = require('hypernova/server');

hypernova({
  devMode: true,
  getComponent: name => require('./public/packs/application').default,
  port: 3030 || process.env.HYPERNOVA_PORT,
});
