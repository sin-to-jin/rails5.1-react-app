const merge = require('webpack-merge');
const path = require('path');

const sharedConfig = require('./shared');

// ./app/javascript/packs/server.jsをcommonjs形式でビルドし、結果をpublic/packs/server.jsに出力する
module.exports = merge(sharedConfig.config, {
  entry: './app/javascript/packs/application.js',
  output: {
    filename: 'server.js',
    path: path.resolve('public', sharedConfig.distDir),
    libraryTarget: 'commonjs',
  },
});
