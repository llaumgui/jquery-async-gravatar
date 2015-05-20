module.exports = (grunt) ->

# =============================== Load plugins =============================== #
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-compress'
  grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'grunt-jscs'
  grunt.loadNpmTasks 'grunt-travis-lint'
  grunt.loadNpmTasks 'grunt-jsonlint'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-mdlint'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-qunit'



# ================================= Settings ================================= #
  # Force use of Unix newlines
  grunt.util.linefeed = '\n'


  # Project configuration
  # =====================
  grunt.initConfig

    # Load external configurations
    pkg: grunt.file.readJSON 'package.json'

    # Sources configuration
    src:
      output: 'src/jquery.async-gravatar.min.js'
      input: 'src/jquery.async-gravatar.js'

    # Banner
    banner: '/*! <%= pkg.title %> v<%= pkg.version %> | (c) 2015 <%= pkg.author.name %>. | MIT license */\n'



# =================================== Task =================================== #

    # Packaging
    # ---------

    # Uglify
    uglify:
      default:
        options:
          report: 'gzip'
          banner: '<%= banner %>'
        files:
          '<%= src.output %>': '<%= src.input.js %>'

    # Compress
    compress:
      main:
        options:
          archive: "build/<%= pkg.name %>-v<%= pkg.version %>.tar.gz"
        files : [
          {
            expand: true
            src : [
              '<%= src.output %>'
              '<%= src.input.js %>'
              'LICENSE.txt'
              'README.md'
            ]
            flatten: true
            cwd: './'
            dest: '<%= pkg.name %>-v<%= pkg.version %>/'
          }
        ]


    # Linters
    # ------

    # JS
    jshint:
      default:
        options:
          jshintrc: true
        files:
          src: [
            '<%= src.input.js %>'
            "test/*.js"
          ]

    # JS Code Sniffer
    jscs:
      src: [
        '<%= src.input.js %>'
        "test/*.js"
      ]
      options:
        config: ".jscsrc"

    # JSON
    jsonlint:
      default:
        src: [
          "*.json"
          ".coffeelintrc"
          ".jscsrc"
          ".jshintrc"
        ]

    # Coffee
    coffeelint:
      default: [
        '*.coffee'
      ]
      options:
        configFile: '.coffeelintrc'

    # MarkDown
    mdlint:
      default: [
        '*.md'
      ]


    # Unit tests
    # ----------

    # QUnit
    qunit:
      default:
        options:
          urls: [
            'http://localhost:<%= connect.server.options.port %>/test/index.html'
          ]

    # Conect
    connect:
      server:
        options:
          port: 8000
          base: '.'
          debug: true



# ============================== Callable tasks ============================== #
  grunt.registerTask 'travis', [
    'lint'
    'unit_tests'
  ]

  grunt.registerTask 'lint', [
    'jsonlint'
    'travis-lint'
    'coffeelint'
    'mdlint'
    'jscs'
    'jshint'
  ]

  grunt.registerTask 'unit_tests', [
    'uglify'
    'connect'
    'qunit'
  ]

  grunt.registerTask 'build', [
    'lint'
    'unit_tests'
    'uglify'
  ]

  grunt.registerTask 'release', [
    'build'
    'compress'
  ]

  # Alias
  grunt.registerTask 'default', 'build'