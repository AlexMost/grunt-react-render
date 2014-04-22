(function() {
  var path, processFile;

  processFile = require('./lib').processFile;

  path = require('path');

  module.exports = function(grunt) {
    var defaults;
    defaults = {};
    return grunt.registerMultiTask('react_render', 'Grunt plugin for rendering reactjs controls', function() {
      var dest, done, fname, options, src;
      done = this.async();
      options = this.options(defaults);
      src = options.src;
      dest = options.dest ? (fname = path.basename(src), path.join(path.resolve(options.dest), fname)) : src;
      grunt.log.ok("Injecting react components into " + src);
      return processFile(src, dest, function(error) {
        grunt.log.ok("file " + dest + " is ready");
        grunt.log.subhead('grunt-react-render done');
        return done();
      });
    });
  };

}).call(this);
