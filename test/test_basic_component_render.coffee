# grunt-react-render
# https://github.com/alexander/grunt-react-render

# Copyright (c) 2014 AlexMost
# Licensed under the MIT license.

{processFile} = require '../src/lib'
cheerio = require 'cheerio'
fs = require 'fs'

path = require 'path'

exports.test_component_render = (test) ->
    filePath = path.resolve './test/fixtures/render1comp.html'
    destPath = path.join (path.resolve './test/tmp'), 'render1comp.result.html'

    processFile filePath, destPath, (error) ->
        test.ok !error

        fs.readFile destPath, (err, content) ->
            test.ok !err, "failed to read rendered file"
            test.ok Boolean(content)

            $ = cheerio.load content.toString()

            test.ok(
                $('#comp1').length is 1
                "React component1 was not rendered"
            )

            test.ok(
                $('#comp2').length is 1
                "React component2 was not rendered"
            )

            test.done()