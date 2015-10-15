module.exports = function(config) {
  config.set({
    frameworks: ["browserify", "jasmine"],
    files: [
      "tests/js/support/function-bind.js",
      "public/js/app.bundle.js",
      "tests/js/**/*.spec.js"
    ],
    preprocessors: {
      "tests/js/**/*.spec.js": ["browserify"]
    },
    browsers: ["PhantomJS"],
    reporters: ["spec"]
  });
}
