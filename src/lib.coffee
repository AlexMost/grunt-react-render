# grunt-react-render
# https://github.com/alexander/grunt-react-render

# Copyright (c) 2014 AlexMost
# Licensed under the MIT license.


cheerio = require 'cheerio'
fs = require 'fs'
React = require 'react'
path = require 'path'


renderComponent = (componentPath) ->
    component = require componentPath
    React.renderComponentToString component()


processFile = (filePath, destPath, cb) ->
    basedir = process.cwd()

    fs.readFile filePath, (err, content) ->
        cb(new Error err) if err

        $ = cheerio.load content.toString()

        $('*[data-rcomp]').each (index, comp) ->
            comp_path = path.resolve(basedir, comp.data.rcomp)
            $(comp).html (renderComponent comp_path)

        fs.writeFile destPath, $.html(), cb


module.exports = {processFile}