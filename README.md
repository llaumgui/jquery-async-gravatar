# jQuery async Gravatar

[![Author][ico-twitter]][link-twitter]
[![Software License][ico-license]](LICENSE.txt)
[![Build Status][ico-ghactions]][link-ghactions]
[![Latest Version][ico-version]][link-npm]

[![Quality Gate Status][ico-sonarcloud-gate]][link-sonarcloud-gate]
[![Coverage][ico-sonarcloud-coverage]][link-sonarcloud-coverage]
[![Maintainability Rating][ico-sonarcloud-maintainability]][link-sonarcloud-maintainability]
[![Reliability Rating][ico-sonarcloud-reliability]][link-sonarcloud-reliability]
[![Security Rating][ico-sonarcloud-security]][link-sonarcloud-security]

An asynchronous loading method for Gravatar images.

## Installation

### With NPM

~~~
npm i jquery-async-gravatar
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

[ico-twitter]: https://img.shields.io/static/v1?label=Author&message=llaumgui&color=000&logo=x&style=flat-square
[link-twitter]: https://twitter.com/llaumgui
[ico-ghactions]: https://img.shields.io/github/actions/workflow/status/llaumgui/jquery-async-gravatar/devops.yml?style=flat-square&logo=github&label=DevOps
[link-ghactions]: https://github.com/llaumgui/jquery-async-gravatar/actions/workflows/devops.yml
[ico-version]: https://img.shields.io/npm/v/jquery-async-gravatar?include_prereleases&label=Package%20version&style=flat-square&logo=npm
[link-npm]: https://www.npmjs.com/package/jquery-async-gravatar
[ico-license]: https://img.shields.io/github/license/llaumgui/jquery-async-gravatar?style=flat-square
[ico-sonarcloud-gate]: https://sonarcloud.io/api/project_badges/measure?branch=main&project=llaumgui_jquery-async-gravatar&metric=alert_status
[link-sonarcloud-gate]: https://sonarcloud.io/dashboard?id=llaumgui_jquery-async-gravatar&branch=main
[ico-sonarcloud-coverage]: https://sonarcloud.io/api/project_badges/measure?project=llaumgui_jquery-async-gravatar&metric=coverage
[link-sonarcloud-coverage]: https://sonarcloud.io/dashboard?id=llaumgui_jquery-async-gravatar
[ico-sonarcloud-maintainability]: https://sonarcloud.io/api/project_badges/measure?project=llaumgui_jquery-async-gravatar&metric=sqale_rating
[link-sonarcloud-maintainability]: https://sonarcloud.io/dashboard?id=llaumgui_jquery-async-gravatar
[ico-sonarcloud-reliability]: https://sonarcloud.io/api/project_badges/measure?project=llaumgui_jquery-async-gravatar&metric=reliability_rating
[link-sonarcloud-reliability]: https://sonarcloud.io/dashboard?id=llaumgui_jquery-async-gravatar
[ico-sonarcloud-security]: https://sonarcloud.io/api/project_badges/measure?project=llaumgui_jquery-async-gravatar&metric=security_rating
[link-sonarcloud-security]: https://sonarcloud.io/dashboard?id=llaumgui_jquery-async-gravatar
