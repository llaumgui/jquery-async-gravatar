/*!
* jQuery async Gravatar
* https://github.com/llaumgui/jquery-async-gravatar
*
* Copyright 2015 Guillaume Kulakowski and other contributors
* Released under the MIT license
* https://raw.githubusercontent.com/llaumgui/jquery-async-gravatar/master/LICENSE.txt
*/
(function ($) {
    "use strict";

    /**
     * Gravatar object
     */
    $.gravatar = function () {};
    $.extend($.gravatar, {
        // Default options.
        options : {
            size : 64,
            default_img: "mm",
            force_secure: false,
            rating: "g",
            attr: {
                hash: "data-gravatar_hash",
                size: "data-gravatar_size",
                rating: "data-gravatar_rating",
                default: "data-gravatar_default"
            }
        },

        // HTTP & HTTPS URLs.
        url: {
            http: "http://www.gravatar.com/avatar",
            htps: "https://secure.gravatar.com"
        },

        /**
         * Init
         */
        init: function (arg) {
            // Extends Gravatar with arguments.
            if (arg) {
                $.extend($.gravatar.options, arg);
            }

            // Check protocol.
            if ($.gravatar.options.force_https === true || "https:" === document.location.protocol) {
                $.gravatar.url = $.gravatar.url.https;
            } else {
                $.gravatar.url = $.gravatar.url.http;
            }
        },
    });


    /**
    * asyncGravatar jQuery plugin.
    */
    $.fn.asyncGravatar = function (arg) {
        $.gravatar.init(arg);

        this.each(function () {
            if ($(this).attr($.gravatar.options.attr.hash)) {
                var hash = $(this).attr($.gravatar.options.attr.hash),
                    // Allow to override with data attributs ("data-").
                    size = ($(this).attr($.gravatar.options.attr.size) ? $(this).attr($.gravatar.options.attr.size) : $.gravatar.options.size),
                    rating = ($(this).attr($.gravatar.options.attr.rating) ? $(this).attr($.gravatar.options.attr.rating) : $.gravatar.options.rating),
                    default_img = ($(this).attr($.gravatar.options.attr.default) ? $(this).attr($.gravatar.options.attr.default) : $.gravatar.options.default_img),
                    src = $.gravatar.url + "/" + encodeURIComponent(hash) +
                    "?s=" + encodeURIComponent(size) +
                    "&r=" + encodeURIComponent(rating) +
                    "&d=" + encodeURIComponent(default_img);

                $(this).attr("src", src);
            }
        });
    };
}(jQuery));