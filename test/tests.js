/*global QUnit*/

/**
 * Function to get URL parameters.
 */
$.urlParam = function(url, param){
    "use strict";
    var results = new RegExp("[\?&]" + param + "=([^&#]*)").exec(url);
    return results[1] || 0;
};

// Hash to test.
var $hash = "85a877c3620cfdb68d4a8fb23835d0f3";


QUnit.test( "Tests with defaults options values", function( assert ) {
    "use strict";

    // Create img object.
    var fixture = $("<img id=\"test-1\" alt=\"Gravatar\" src=\"__TO_CHANGE__\" data-gravatar_hash=\"" + $hash + "\"  />");
    fixture.append("#qunit-fixture");

    // Run asyncGravatar.
    fixture.asyncGravatar({});

    // Get modifications.
    var $src = fixture.attr("src"), // Get image source.
        $url = $src.slice( 0, $src.indexOf("?") );

    assert.notEqual(
        $src,
        "__TO_CHANGE__",
        "Test that the image attribute src is changed."
    );
    assert.equal(
        $url,
        "http://www.gravatar.com/avatar/" + $hash,
        "Test the image attribute src url."
    );
    assert.equal(
        $.urlParam($src,"s"),
        "64",
        "Test that the image attribute src is changed with the good default size."
    );
    assert.equal(
        $.urlParam($src,"d"),
        "mm",
        "Test that the image attribute src is changed with the good default image."
    );
    assert.equal(
        $.urlParam($src,"r"),
        "g",
        "Test that the image attribute src is changed with the good default rating."
    );
});


QUnit.test( "Tests with customs options values", function( assert ) {
    "use strict";

    // Create img object.
    var fixture = $("<img id=\"test-2\" alt=\"Gravatar\" src=\"__TO_CHANGE__\" data-gravatar_hash=\"" + $hash + "\"  />");
    fixture.append("#qunit-fixture");

    // Run asyncGravatar.
    fixture.asyncGravatar({
        size: 50,
        default_img: "404",
        rating: "x",
        force_https: true
    });

    // Get modifications.
    var $src = fixture.attr("src"), // Get image source.
        $url = $src.slice( 0, $src.indexOf("?") );

    assert.notEqual(
        $src,
        "__TO_CHANGE__",
        "Test that the image attribute src is changed."
    );
    assert.equal(
        $url,
        "https://secure.gravatar.com/" + $hash,
        "Test the image attribute src url."
    );
    assert.equal(
        $.urlParam($src,"s"),
        "50",
        "Test that the image attribute src is changed with the good size."
    );
    assert.equal(
        $.urlParam($src,"d"),
        "404",
        "Test that the image attribute src is changed with the good image."
    );
    assert.equal(
        $.urlParam($src,"r"),
        "x",
        "Test that the image attribute src is changed with the good rating."
    );
});


QUnit.test( "Tests with data attributes", function( assert ) {
    "use strict";

    // Create img object.
    var fixture = $("<img id=\"test-3\" alt=\"Gravatar\" src=\"__TO_CHANGE__\" data-gravatar_hash=\"" + $hash + "\" data-gravatar_size=\"50\" data-gravatar_default=\"404\" data-gravatar_rating=\"x\"  />");
    fixture.append("#qunit-fixture");

    // Run asyncGravatar.
    fixture.asyncGravatar({});

    // Get modifications.
    var $src = fixture.attr("src"), // Get image source.
        $url = $src.slice( 0, $src.indexOf("?") );

    assert.notEqual(
        $src,
        "__TO_CHANGE__",
        "Test that the image attribute src is changed."
    );
    assert.equal(
        $url,
        "http://www.gravatar.com/avatar/" + $hash,
        "Test the image attribute src url."
    );
    assert.equal(
        $.urlParam($src,"s"),
        "50",
        "Test that the image attribute src is changed with the good size."
    );
    assert.equal(
        $.urlParam($src,"d"),
        "404",
        "Test that the image attribute src is changed with the good image."
    );
    assert.equal(
        $.urlParam($src,"r"),
        "x",
        "Test that the image attribute src is changed with the good rating."
    );
});