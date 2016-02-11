var publicAssets = "./public/assets";
var sourceFiles  = "./gulp/assets";
var npmPath  = './node_modules';
var reactify = require('reactify');

module.exports = {
  publicAssets: publicAssets,
  browserSync: {
    proxy: 'localhost:3000',
    files: ['./app/views/**']
  },
  sass: {
    src: sourceFiles + "/stylesheets/**/*.{sass,scss}",
    dest: publicAssets + "/stylesheets",
    settings: {
      indentedSyntax: false, // Enable .sass syntax!
      imagePath: '/assets/images', // Used by the image-url helper,
      //outputStyle: 'compressed',
      includePaths: [npmPath+'/bootstrap-sass/assets/stylesheets']
    }

  },
  images: {
    src: sourceFiles + "/images/**",
    dest: publicAssets + "/images"
  },
  iconFont: {
    name: 'Gulp Rails Icons',
    //src: sourceFiles + "/icons/*.svg",
    src: npmPath + "/bootstrap-sass/assets/fonts/bootstrap",
    dest: publicAssets + '/fonts',
    sassDest: sourceFiles + '/stylesheets/base',
    template: './gulp/tasks/iconFont/template.sass',
    sassOutputName: '_iconFont.sass',
    //fontPath: '/assets/fonts',
    fontPath: npmPath+'/bootstrap-sass/assets/fonts/bootstrap',
    className: 'icon',
    options: {
      fontName: 'glyphicons-halflings-regular',
      //fontName: 'gulp-rails-icons',
      appendCodepoints: true,
      normalize: false
    }
  },
  browserify: {
    bundleConfigs: [{
      entries: sourceFiles + '/javascripts/global.js',
      dest: publicAssets + '/javascripts',
      transform: [reactify],
      outputName: 'global.js',
      extensions: ['.js','.coffee', '.jsx']
    }]
  }
};
