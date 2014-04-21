# grunt-cafe
# https://github.com/alexander/grunt-react-render

# Copyright (c) 2014 AlexMost
# Licensed under the MIT license.


cheerio = require 'cheerio'
fs = require 'fs'
React = require 'react'
path = require 'path'


module.exports = (grunt) ->
  grunt.registerMultiTask 'react_render', 'Grunt plugin for rendering reactjs controls', ->

    done = @async()
    options = @options defaults
    src = options.src
    basedir = options.basedir

    fs.readFile src, (err, content) ->
        done(new Error err) if err
        $ = cheerio.load(content.toString())
        components = [$('*[data-rcomp]')]

        components.map (comp) ->
            comp_path = path.resolve(basedir, comp.data().rcomp)
            component = require comp_path
            react_content_str = React.renderComponentToString component()
            comp.html react_content_str

        fs.writeFile src, $.html(), ->
            done()
            grunt.log.oklns 'grunt-react-render done'  
