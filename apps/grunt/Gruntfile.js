module.exports = function(grunt) {

	var __HTMLs = ["*.html"];
	var __SCSSs = ["sass/*.scss"];
	var __JSs	  = ["js/*.js"];

	grunt.initConfig({

		compass: {
			dist: {
				options: {
					config: 'config.rb'
				}
			}
		},

		connect: {
			server: {
				options: {
					port: 9000,
					base: "./"
				}
			}
		},

		validation: {
			options: {
				reset: true,
				stoponerror: false
			},
			files: {
				src: __HTMLs
			}

		},

		watch: {
			html: {
				files: __HTMLs
			},
			stylesheet: {
				files: __SCSSs,
				tasks: ['compass']
			},
			scripts: {
				files: __JSs
			},
			options: {
				livereload: true
			}
		},

	});

	grunt.loadNpmTasks('grunt-contrib-compass');
	grunt.loadNpmTasks('grunt-contrib-connect');
	grunt.loadNpmTasks('grunt-contrib-watch');
	grunt.loadNpmTasks('grunt-html-validation');

	grunt.registerTask('default', ['connect', 'watch']);
	grunt.registerTask('test', ['validation']);

};