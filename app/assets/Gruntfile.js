module.exports = function(grunt) {
	
	grunt.initConfig({
		less: {
			core: {
				src: 'less/design.less',
				dest: 'stylesheets/design.css',
			},
		},
		cssmin: {
			core: {
				src: 'stylesheets/design.css',
				dest: 'stylesheets/design.min.css',
			},
		},
		uglify: {
			js: {
				files: {
			        'javascripts/script.min.js': ['javascripts/script.js'],
			    },	
			},
		},
		sprite:{
			all: {
				src: 'images/pins/*.png',
				dest: 'images/sprites/sprites.png',
				destCss: 'stylesheets/sprites.css',
	    	},
	    },
		watch: {
			less: {
			    files: ['less/*.less', 'less/pages/*.less'],
			    tasks: ['less:core'],
			},
			cssmin: {
				files: ['stylesheets/design.css'],
				tasks: ['cssmin:core'],
			},
			/*uglify: {
				files: ['build/js/script.js'],
				tasks: ['uglify'],
			},*/
		},
	});  	

	grunt.registerTask('default', ['watch']);
	grunt.loadNpmTasks('grunt-contrib-concat');
	grunt.loadNpmTasks('grunt-contrib-less');
	grunt.loadNpmTasks('grunt-contrib-cssmin');
	grunt.loadNpmTasks('grunt-contrib-uglify');
	grunt.loadNpmTasks('grunt-contrib-watch');
	grunt.loadNpmTasks('grunt-spritesmith');
}