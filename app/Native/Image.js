const checked = require('./app/Task/Images/checked@2x.png');

const _ohanhi$elm_native_ui$Native_Image = function () {

  const images = { checked };

  function loadImage(imageName) {
    return images[imageName];
  }

  return {
    loadImage,
  };
}();
