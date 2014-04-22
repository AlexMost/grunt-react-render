# grunt-react-render

> Grunt plugin for rendering reactjs components in existing markup

## Getting Started
This plugin requires Grunt `~0.4.4`

If you haven't used [Grunt](http://gruntjs.com/) before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide, as it explains how to create a [Gruntfile](http://gruntjs.com/sample-gruntfile) as well as install and use Grunt plugins. Once you're familiar with that process, you may install this plugin with this command:

```shell
npm install grunt-react-render --save-dev
```

Once the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

```js
grunt.loadNpmTasks('grunt-react-render');
```

## The "react_render" task

### Overview
Lets assume you creating some static site with html pages and have some react component:


```js
//path - ./component/component1.js
React = require('react');

Comp1 = React.createClass({
    render: function(){
        return React.DOM.div({id: "comp1", className: "test"}, "testDiv")
    }
});

module.exports = Comp1
```


Here is our source markup:

```html
<!DOCTYPE html>
<html lang="en">
    <head></head>
    <body>
      <h1>Header ...</h1>
      <!-- placing path to component file in data-rcomp attribute -->
      <div data-rcomp="./component/component1.js" id="container"></div>
      <script type="javascript">
        //some init logic
      </script>
    </body>
</html>
```

After processing we will recieve:
```html
<!DOCTYPE html>
<html lang="en">
    <head></head>
    <body>
      <h1>Header ...</h1>
      <!-- placing path to component file in data-rcomp attribute -->
      <div data-rcomp="./component/component1.js" id="container">
      <div id="comp1" class="test" data-reactid=".1vufboq169s" data-react-checksum="1034950555">testDiv</div>
      </div>
      <script type="javascript">
        //some init logic
      </script>
    </body>
</html>
```

So, as you may understood this plugin will iterate through all over the components and will call React.renderComponentToString for each component.


### Usage Examples

#### Overwrite existing file
In this example we will overwrite an existing file:

```js
grunt.initConfig({
  react_render: {
    task1: {
      options: {src: "./path/to/some/file.html"}
    },
  },
});
```

#### Create processed file at some dest
This configuration will create file with the same name at some destination path.
```js
grunt.initConfig({
  react_render: {
    task1: {
      options: 
          {src: "./path/to/some/file.html",
          dest: "./dest/}
    },
  },
});
```

## Contributing
Take care to maintain the existing coding style. Add unit tests for any new or changed functionality.
