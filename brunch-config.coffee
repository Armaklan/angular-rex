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
