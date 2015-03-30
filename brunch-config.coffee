exports.config =
    modules:
        definition: false
        wrapper: false
    paths:
        public: 'public'
    files:
        stylesheets:
            joinTo:
                'style/app.css': /^app/
                'style/vendor.css': /^(vendor|bower_components)/,
        javascripts:
            joinTo:
                'js/vendor.js': /^bower_components/
