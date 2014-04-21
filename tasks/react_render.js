(function() {
  module.exports = function(grunt) {
    return grunt.registerMultiTask('react_render', 'Grunt plugin for rendering reactjs controls', function() {
      var done;
      done = this.async();
      grunt.log.oklns('grunt-react-render done');
      return done();
    });
  };

}).call(this);
