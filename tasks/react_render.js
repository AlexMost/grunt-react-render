(function() {
  var processFile;

  processFile = require('./lib').processFile;

  module.exports = function(grunt) {
    var defaults;
    defaults = {};
    return grunt.registerMultiTask('react_render', 'Grunt plugin for rendering reactjs controls', function() {
      var done, options, src;
      done = this.async();
      options = this.options(defaults);
      src = options.src;
      return processFile(src, src, function(error) {
        grunt.log.oklns('grunt-react-render done');
        return done();
      });
    });
  };

}).call(this);
