'use strict'

module.exports = (grunt) ->

  require 'coffee-errors'

  grunt.loadNpmTasks 'grunt-browserify'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-csslint'
  grunt.loadNpmTasks 'grunt-jsonlint'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-simple-mocha'
  grunt.loadNpmTasks 'grunt-notify'

  grunt.registerTask 'build', [
    'browserify',
    'uglify' if process.env.NODE_ENV is 'production'
  ].filter (i) -> i?

  grunt.registerTask 'test', [
    'csslint'
    'jsonlint'
    'coffeelint'
    'simplemocha'
  ]

  grunt.registerTask 'default', [ 'build', 'test' ]

  grunt.initConfig

    browserify:
      build:
        options:
          browserifyOptions:
            extensions: ['.coffee', '.cjsx']
            transform: 'coffee-reactify'
            debug: process.env.NODE_ENV isnt 'production'
        files:
          'public/js/bundle.js': [ 'client/**.{js,jsx,cjsx,coffee}' ]

    uglify:
      dist:
        files:
          'public/js/bundle.js': 'public/js/bundle.js'

    csslint:
      strict:
        src: [
          '**/*.css'
          '!node_modules/**'
        ]

    jsonlint:
      config:
        src: [
          '**/*.json'
          '!node_modules/**'
        ]

    coffeelint:
      options:
        max_line_length:
          value: 0
        indentation:
          value: 2
        newlines_after_classes:
          level: 'error'
        no_empty_param_list:
          level: 'error'
        no_unnecessary_fat_arrows:
          level: 'ignore'
      dist:
        files:
          src: [
            '**/*.coffee'
            '!node_modules/**'
          ]

    simplemocha:
      options:
        ui: 'bdd'
        reporter: 'spec'
        compilers: 'coffee:coffee-script'
        ignoreLeaks: no
      dist:
        src: [ 'tests/test_*.coffee' ]
