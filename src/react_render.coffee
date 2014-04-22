# grunt-react-render
# https://github.com/alexander/grunt-react-render

# Copyright (c) 2014 AlexMost
# Licensed under the MIT license.

{processFile} = require './lib'


module.exports = (grunt) ->
  defaults = {}

  grunt.registerMultiTask(
    'react_render'
    'Grunt plugin for rendering reactjs controls'
    ->
        done = @async()
        options = @options defaults
        src = options.src

        processFile src, src, (error) ->
            grunt.log.oklns 'grunt-react-render done'  
            done()
    )
