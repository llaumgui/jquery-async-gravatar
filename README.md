# jQuery async Gravatar

[![Bower version](https://badge.fury.io/bo/jquery-async-gravatar.svg)](https://libraries.io/bower/jquery-async-gravatar) [![Build Status branch master](https://travis-ci.org/llaumgui/jquery-async-gravatar.svg?branch=master)](https://travis-ci.org/llaumgui/jquery-async-gravatar) [![Code Climate](https://codeclimate.com/github/llaumgui/jquery-async-gravatar/badges/gpa.svg)](https://codeclimate.com/github/llaumgui/jquery-async-gravatar) [![Test Coverage](https://codeclimate.com/github/llaumgui/jquery-async-gravatar/badges/coverage.svg)](https://codeclimate.com/github/llaumgui/jquery-async-gravatar/coverage) [![Inline docs](http://inch-ci.org/github/llaumgui/jquery-async-gravatar.svg?branch=master)](http://inch-ci.org/github/llaumgui/jquery-async-gravatar) [![dependencies Status](https://david-dm.org/llaumgui/jquery-async-gravatar/status.svg)](https://david-dm.org/llaumgui/jquery-async-gravatar) [![devDependency Status](https://david-dm.org/llaumgui/jquery-async-gravatar/dev-status.png)](https://david-dm.org/llaumgui/jquery-async-gravatar#info=devDependencies)

An asynchronous loading method for Gravatar images.

## Installation

### With NPM

Next...

### With Bower

Use [Bower](http://bower.io) client:

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
<script src="/path/to/jquery.async-gravatar.min.js"></script>
~~~

**Do not include the script directly from GitHub.** The file is being served as text/plain and as such being blocked
in Internet Explorer on Windows 7 for instance (because of the wrong MIME type). Bottom line: **GitHub is not a CDN**.

## Usage

* Use a default image instead of Gravatar image and pass the hash as a "***data-gravatar_hash***" attribute:

~~~html
<img class="gravatar" alt="Gravatar" src="./test/default.jpg" data-gravatar_hash="THE_USER_GRAVATAR_HASH_HERE" />
~~~

* Select all images and load asynchronous the Gravatars:

~~~javascript
$( ".gravatar" ).asyncGravatar( {} );
~~~

### Options

| Option        | Description   | Default value |
| ------------- | ------------- | ------------- |
| size | Image size, which will be dynamically delivered from Gravatar. | 64 |
| default_img | What happens when an email address has no matching Gravatar image? | mm |
| force_https | If you're displaying Gravatars on a page that is being served over SSL and it's not detected. | false |
| rating  | Gravatar allows users to self-rate their images so that they can indicate if an image is appropriate for a certain audience. | g |

For more explication see [official documentation](https://gravatar.com/site/implement/images/).

### Example

Example with images of "50px", with "identicon" as default image, with rating "pg" and using https:

~~~javascript
$(".gravatar").asyncGravatar({
    "size": "50",
    "default_img": "identicon",
    "force_https": true,
    "rating": "pg"
} );
~~~

### Data attributes

You can also use [data attributes](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Using_data_attributes) on each images:

~~~html
<img class="gravatar" alt="Gravatar" src="./test/default.jpg"
     data-gravatar_hash="HASH"
     data-gravatar_size="SIZE"
     data-gravatar_default="DEFAULT_IMG"
     data-gravatar_rating="RATING" />
~~~

## License

Released under the [MIT license](http://www.opensource.org/licenses/MIT).