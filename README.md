# jQuery async Gravatar
master [![Build Status branch master](https://travis-ci.org/llaumgui/jquery-async-gravatar.svg?branch=master)](https://travis-ci.org/llaumgui/jquery-async-gravatar) develop [![Build Status branch develop](https://travis-ci.org/llaumgui/jquery-async-gravatar.svg?branch=develop)](https://travis-ci.org/llaumgui/jquery-async-gravatar) [![devDependency Status](https://david-dm.org/llaumgui/jquery-async-gravatar/dev-status.png)](https://david-dm.org/llaumgui/jquery-async-gravatar#info=devDependencies)

An asynchronous loading method for Gravatar's images.

## Installation
### With Bower

Via [Bower](http://bower.io):

~~~
bower install jquery-async-gravatar
~~~

Or, add `jquery-async-gravatar` to your app's `bower.json`.

~~~json
  ...
    "dependencies": {
      "jquery-async-gravatar": "latest"
    },
  ...
~~~

### Standalone
Include script *after* the jQuery library (unless you are packaging scripts somehow else):

~~~html
<script src="/path/to/jquery.async-gravatar.js"></script>
~~~

**Do not include the script directly from GitHub.** The file is being served as text/plain and as such being blocked
in Internet Explorer on Windows 7 for instance (because of the wrong MIME type). Bottom line: **GitHub is not a CDN**.

## Usage
* Add an default image to your HTML with data-gravatar_hash attribut:
~~~html
<img alt="Gravatar" src="./img/default_gravatar.png" data-gravatar_hash="HASH" class="gravatar" />
~~~
* Select all image and load asynchronous the Gravatar :

~~~javascript
$(".gravatar").asyncGravatar({});
~~~

### Options
| Option        | Description   | Default value |
| ------------- | ------------- | ------------- |
| size | Image size, which will be dynamically delivered from Gravatar. | 64 |
| default_img | What happens when an email address has no matching Gravatar image? | mm |
| force_secure | If you're displaying Gravatars on a page that is being served over SSL and it's not detected. | false |
| rating  | Gravatar allows users to self-rate their images so that they can indicate if an image is appropriate for a certain audience. | g |

For more explication see [official documentation](https://gravatar.com/site/implement/images/).

### Data attributes
You can also use [data attributes](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Using_data_attributes) on each images:
~~~html
<img alt="Gravatar" src="./img/default_gravatar.png" class="gravatar"
     data-gravatar_hash="HASH"
     data-gravatar_size="SIZE"
     data-gravatar_default="DEFAULT_IMG"
     data-gravatar_rating="RATING" />
~~~

## License
Released under the [MIT license](http://www.opensource.org/licenses/MIT).
