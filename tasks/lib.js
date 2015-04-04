(function() {
  var React, cheerio, fs, path, processFile, renderComponent;

  cheerio = require('cheerio');

  fs = require('fs');

  React = require('react');

  path = require('path');

  renderComponent = function(componentPath, componentProps) {
    var component, props;
    component = require(componentPath);
    props = {};
    if (componentProps) {
      props = JSON.parse(componentProps);
    }
    return React.renderToString(React.createElement(component, props));
  };

  processFile = function(filePath, destPath, cb) {
    var basedir;
    basedir = process.cwd();
    return fs.readFile(filePath, function(err, content) {
      var $;
      if (err) {
        cb(new Error(err));
      }
      $ = cheerio.load(content.toString());
      $('*[data-rcomp]').each(function(index, comp) {
        var comp_path;
        comp_path = path.resolve(basedir, $(comp).data().rcomp);
        return $(comp).html(renderComponent(comp_path, $(comp).data().rprop));
      });
      return fs.writeFile(destPath, $.html(), cb);
    });
  };

  module.exports = {
    processFile: processFile
  };

}).call(this);
