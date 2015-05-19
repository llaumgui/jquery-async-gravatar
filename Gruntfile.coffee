module.exports = (grunt) ->

# =============================== Load plugins =============================== #
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-jshint'



# ================================= Settings ================================= #
  # Force use of Unix newlines
  grunt.util.linefeed = '\n'


  # Project configuration
  # =====================
  grunt.initConfig

    pkg: grunt.file.readJSON 'package.json'


    # Sources configuration
    # ---------------------
    src:
      output: 'jquery.async-gravatar.min.js'
      input: 'jquery.async-gravatar.js'



# ================================== Banner ================================== #
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



# ============================== Callable tasks ============================== #
  grunt.registerTask 'lint', [
    'jshint'
  ]

  grunt.registerTask 'build', [
    'lint'
    'uglify'
  ]

  # Alias
  grunt.registerTask 'default', 'build'
  grunt.registerTask 'travis', 'lint'
