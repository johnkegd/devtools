/**
 * using property wcmmode and theme configured in af in aem.
 */
use(function () {
    var property;
    for (property in this) {
        request.setAttribute(property, this[property]);
    }
});
