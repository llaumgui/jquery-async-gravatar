module.exports = (grunt) ->

# =============================== Load plugins =============================== #
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-compress'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-eslint'
  grunt.loadNpmTasks 'grunt-jsonlint'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-karma'



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
      output: 'dist/jquery.async-gravatar.min.js'
      input: 'src/jquery.async-gravatar.js'

    # Banner
    banner: '/*! <%= pkg.title %> v<%= pkg.version %> | (c) 2015-2018 <%= pkg.author.name %>. | MIT license */\n'



# =================================== Task =================================== #

    # Packaging
    # ---------

    # Clean
    clean:
      dist: ['dist']
      build: ['build', '*.tgz']
    # Copy
    copy:
      default:
        expand: true
        #cwd: 'src/'
        filter: 'isFile'
        flatten: true
        src: '<%= src.input %>'
        dest: 'dist/'

    # Uglify
    uglify:
      default:
        options:
          report: 'gzip'
          banner: '<%= banner %>'
        files:
          '<%= src.output %>': '<%= src.input %>'

    # Compress
    compress:
      default:
        options:
          archive: "build/<%= pkg.name %>-v<%= pkg.version %>.tar.gz"
        files : [
          {
            expand: true
            src : [
              '<%= src.output %>'
              '<%= src.input %>'
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
    eslint:
      options:
        configFile: '.eslintrc',
      target: [
        '<%= src.input %>'
        "test/*.js"
      ]

    # JSON
    jsonlint:
      default:
        src: [
          "*.json"
          ".coffeelintrc"
          ".eslintrc"
        ]

    # Coffee
    coffeelint:
      default: [
        '*.coffee'
      ]
      options:
        configFile: '.coffeelintrc'


    # Unit tests
    # ----------
    karma:
      unit:
        configFile: 'karma.conf.js'



# ============================== Callable tasks ============================== #
  grunt.registerTask 'test', [
    'lint'
    'unit_test'
  ]

  grunt.registerTask 'lint', [
    'jsonlint'
    'coffeelint'
    'eslint'
  ]

  grunt.registerTask 'unit_test', [
    'karma'
  ]

  grunt.registerTask 'build', [
    'uglify'
  ]

  grunt.registerTask 'release', [
    'clean'
    'build'
    'copy'
    'compress'
  ]

  # Alias
  grunt.registerTask 'default', 'build'
