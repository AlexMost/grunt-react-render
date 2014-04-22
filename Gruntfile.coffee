
# grunt-cafe
# https://github.com/alexander/grunt-react-render

# Copyright (c) 2014 AlexMost
# Licensed under the MIT license.


module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig(
    watch:
      task:
        files: ['src/**/*']
        tasks: ['build']

    coffee:
        build:
          expand: true
          cwd: "src"
          src: "**/*.coffee"
          dest: "tasks/"
          ext: ".js"

    nodeunit:
        all: ['test/**/test*.coffee']

    react_render:
        task1: {}
  )

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-nodeunit'

  grunt.loadTasks 'tasks'
  grunt.registerTask 'default', ['coffee:build']
  grunt.registerTask 'render', ['react_render']
  grunt.registerTask 'build', ['coffee', 'nodeunit']




