# grunt-react-render
# https://github.com/alexander/grunt-react-render

# Copyright (c) 2014 AlexMost
# Licensed under the MIT license.

{processFile} = require './lib'
path = require 'path'


module.exports = (grunt) ->
  defaults = {}

  grunt.registerMultiTask(
    'react_render'
    'Grunt plugin for rendering reactjs controls'
    ->
        done = @async()
        options = @options defaults
        src = options.src
        
        dest = if options.dest
            fname = path.basename src
            path.join path.resolve(options.dest), fname
        else
            src

        grunt.log.ok "Injecting react components into #{src}"

        processFile src, dest, (error) ->
            grunt.log.ok "file #{dest} is ready"
            grunt.log.subhead 'grunt-react-render done'  
            done()
    )
