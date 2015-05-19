module.exports = (grunt) ->

# =============================== Load plugins =============================== #
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'grunt-travis-lint'
  grunt.loadNpmTasks 'grunt-jsonlint'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-mdlint'
  grunt.loadNpmTasks 'grunt-contrib-compress'



# ================================= Settings ================================= #
  # Force use of Unix newlines
  grunt.util.linefeed = '\n'


  # Project configuration
  # =====================
  grunt.initConfig

    pkg: grunt.file.readJSON 'package.json'


    # Sources configuration
    src:
      output: 'src/jquery.async-gravatar.min.js'
      input: 'src/jquery.async-gravatar.js'

    # Banner
    banner: '/*! <%= pkg.title %> v<%= pkg.version %> | (c) 2015 <%= pkg.author.name %>. | MIT license */\n'



# =================================== Task =================================== #

    # Uglify the JS file
    # ------------------
    uglify:
      default:
        options:
          report: 'gzip'
          banner: '<%= banner %>'
        files:
          '<%= src.output %>': '<%= src.input.js %>'


    # JSHint
    # ------
    jshint:
      default:
        options:
          jshintrc: true
        files:
          src: [ '<%= src.input.js %>' ]

    # JSON Lint
    # --------
    jsonlint:
      default:
        src: [
          "*.json"
          ".coffeelintrc"
          ".jshintrc"
        ]


    # Coffee Lint
    # -----------
    coffeelint:
      default: [
        '*.coffee'
      ]
      options:
        configFile: '.coffeelintrc'


    # MarkDown lint
    # -------------
    mdlint:
      default: [
        '*.md'
      ]


    # Compress
    # --------
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



# ============================== Callable tasks ============================== #
  grunt.registerTask 'lint', [
    'jsonlint'
    'travis-lint'
    'coffeelint'
    'mdlint'
    'jshint'
  ]

  grunt.registerTask 'build', [
    'lint'
    'uglify'
  ]

  grunt.registerTask 'release', [
    'build'
    'compress'
  ]

  # Alias
  grunt.registerTask 'default', 'build'
  grunt.registerTask 'travis', 'lint'
